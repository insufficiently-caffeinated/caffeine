
// Command to generate a compile_commands.json using bazel aquery

#include <boost/algorithm/string/predicate.hpp>
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

bool starts_with(std::string_view input, std::string_view test) {
  return boost::algorithm::starts_with(input, test);
}

bool ends_with(std::string_view input, std::string_view test) {
  return boost::algorithm::ends_with(input, test);
}

struct Record {
  std::string_view leading;
  std::unordered_map<std::string_view, std::string> data;
};

class RecordParser {
public:
  RecordParser(std::string_view data) : data(data) {}

  std::optional<Record> parse_record() {
    auto leading = parse_leading();
    if (!leading)
      return std::nullopt;

    if (!parse_char('\n'))
      return std::nullopt;

    std::unordered_map<std::string_view, std::string> data;
    while (!this->data.empty()) {
      if (!parse_match("  "))
        return std::nullopt;

      auto key = parse_key();
      if (!key)
        return std::nullopt;

      if (!parse_match(": "))
        return std::nullopt;

      auto value = parse_value();
      if (!value)
        return std::nullopt;

      data.emplace(std::move(*key), std::move(*value));

      parse_char('\n');
    }

    return Record{*leading, data};
  }

private:
  std::optional<std::string_view> parse_leading() {
    return parse_until('\n');
  }

  std::optional<std::string_view> parse_key() {
    return parse_until(':');
  }

  std::optional<std::string> parse_value() {
    std::string value;

    while (true) {
      auto line = parse_until('\n');
      if (!line)
        return std::nullopt;

      value += *line;

      if (line->empty())
        break;

      if (!parse_char('\n'))
        return std::nullopt;

      if (line->back() != '\\')
        break;

      value.pop_back();
    }

    return value;
  }

  // Parse until a given character is encountered. Does not
  // consume the character.
  std::optional<std::string_view> parse_until(char c) {
    size_t offset = 0;

    while (true) {
      if (offset >= data.size())
        return std::nullopt;

      if (data[offset] == c)
        break;

      offset += 1;
    }

    std::string_view result = data.substr(0, offset);
    data = data.substr(offset);
    return result;
  }

  std::optional<char> parse_char(char c) {
    if (data.empty())
      return std::nullopt;
    if (data[0] != c)
      return std::nullopt;
    data = data.substr(1);
    return c;
  }

  std::optional<std::string_view> parse_match(std::string_view tag) {
    if (data.size() < tag.size())
      return std::nullopt;

    auto matched = data.substr(0, tag.size());
    if (matched != tag)
      return std::nullopt;

    data = data.substr(tag.size());
    return matched;
  }

public:
  std::string_view data;
};

std::string execution_root() {
  bp::ipstream pipe_stream;
  bp::child bzl(bp::search_path("bazel"), "info", "execution_root",
                bp::std_out > pipe_stream);

  std::string result;
  std::getline(pipe_stream, result);
  bzl.wait();
  return result;
}

int main(int argc, char** argv) {
  // To get useful stacktraces in case of error.
  int fake_argc = 1;
  llvm::InitLLVM llvm(fake_argc, argv);

  auto cwd = execution_root();

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
    if (action.at("mnemonic") != "CppCompile")
      continue;

    std::vector<std::string> args;
    for (auto& arg : action.at("arguments").as_array()) {
      auto& str = arg.as_string();
      std::string transformed = std::string(str);
      boost::algorithm::replace_all(transformed, std::string_view("'"),
                                    std::string_view("\\'"));

      args.push_back(std::move(transformed));
    }

    std::string cmd = "'" + boost::algorithm::join(args, "' '") + "'";

    auto it = std::find(args.begin(), args.end(), "-c");
    ++it;
    std::string file = *it;

    boost::json::object object;
    object.emplace("directory", boost::json::string_view(cwd));
    object.emplace("file", boost::json::string_view(file));
    object.emplace("command", boost::json::string_view(cmd));

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
