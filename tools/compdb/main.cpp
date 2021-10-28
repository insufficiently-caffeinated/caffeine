
// Command to generate a compile_commands.json using bazel aquery

#include <boost/algorithm/string/predicate.hpp>
#include <boost/algorithm/string/replace.hpp>
#include <boost/json.hpp>
#include <boost/process.hpp>
#include <filesystem>
#include <iostream>
#include <llvm/Support/InitLLVM.h>
#include <optional>
#include <sstream>
#include <string>
#include <unordered_map>

namespace bp = boost::process;

namespace {
std::string execution_root() {
  bp::ipstream pipe_stream;
  // bp::child bzl(bp::search_path("bazel"), "info", "execution_root",
  //               bp::std_out > pipe_stream);
  bp::child bzl(bp::search_path("bazel"), "info", "output_base",
                bp::std_out > pipe_stream);

  std::string result;
  std::getline(pipe_stream, result);
  bzl.wait();
  return result;
}
} // namespace

int main(int argc, char** argv) {
  // To get useful stacktraces in case of error.
  int fake_argc = 1;
  llvm::InitLLVM llvm(fake_argc, argv);

  auto cwd = execution_root();
  auto exec_dir = std::filesystem::current_path();

  std::vector<std::string_view> args{"aquery", "--output=jsonproto"};
  for (int i = 1; i < argc; ++i)
    args.push_back(argv[i]);

  bp::ipstream pipe_stream;
  bp::child bzl(bp::search_path("bazel"), bp::args(args),
                bp::std_out > pipe_stream);

  std::string result(std::istreambuf_iterator<char>(pipe_stream), {});
  auto value = boost::json::parse(result);
  const auto& root = value.as_object();
  const auto& actions = root.at("actions").as_array();

  std::cout << "[\n";
  bool first = true;

  for (auto& action : actions) {
    const auto& mnemonic = action.at("mnemonic");
    if (mnemonic != "CppCompile" && mnemonic != "BitcodeCompile")
      continue;

    std::vector<std::string> args;
    for (auto& arg : action.at("arguments").as_array()) {
      auto& str = arg.as_string();
      std::string transformed = std::string(str);
      boost::algorithm::replace_all(transformed, std::string_view("'"),
                                    std::string_view("\\'"));

      boost::replace_all(transformed, "-iquote", "-I");

      args.push_back(std::move(transformed));
    }

    auto it = std::find(args.begin(), args.end(), "-c");
    if (it == args.end())
      continue;

    ++it;
    std::string file = *it;

    if (std::filesystem::exists(file)) {
      std::string full_file = exec_dir / file;

      for (auto& arg : args)
        boost::replace_all(arg, file, full_file);

      file = full_file;
    }

    std::string cmd = boost::algorithm::join(args, " ");

    boost::json::object object;
    object.emplace("file", boost::json::string_view(file));
    object.emplace("command", boost::json::string_view(cmd));
    object.emplace("directory", boost::json::string_view(cwd));

    if (first) {
      first = false;
    } else {
      std::cout << ",\n";
    }

    std::cout << object;
  }

  bzl.wait();

  std::cout << "\n]" << std::flush;

  return 0;
}
