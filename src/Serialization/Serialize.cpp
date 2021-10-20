#include "caffeine/Serialization/Serialize.h"

#include <algorithm>

#include <capnp/message.h>
#include <capnp/serialize-packed.h>

#include "caffeine/Protos/testcase.capnp.h"

namespace caffeine {

namespace serialize {

  using caffeine::serialize::protos::Symbol;
  using caffeine::serialize::protos::TestCase;
  using caffeine::serialize::protos::Value;
  using capnp::word;
  using kj::byte;

  std::string serialize_test_case(
      const std::unordered_map<std::string, std::string>& symbols) {
    ::capnp::MallocMessageBuilder message;
    TestCase::Builder testcase = message.initRoot<TestCase>();
    ::capnp::List<Symbol>::Builder testcases =
        testcase.initSymbols(symbols.size());
    unsigned int index = 0;
    for (const auto& [name, value] : symbols) {
      Symbol::Builder v = testcases[index];
      v.setName(name.c_str());
      auto symbol = v.initSymbol();
      const byte* b = reinterpret_cast<const unsigned char*>(value.c_str());
      symbol.setArray(capnp::Data::Reader(b, value.size()));
      ++index;
    }

    kj::VectorOutputStream stream;
    ::capnp::writePackedMessage(stream, message);
    kj::ArrayPtr<byte> bytes = stream.getArray();
    std::string result(bytes.begin(), bytes.end());
    return result;
  }

  std::unordered_map<std::string, std::string>
  deserialize_test_case(std::string_view& data) {
    const byte* ptr = reinterpret_cast<const byte*>(data.data());
    kj::ArrayPtr<const byte> bufferPtr = kj::arrayPtr(ptr, sizeof(data.size()));

    kj::ArrayInputStream stream(bufferPtr);
    kj::BufferedInputStreamWrapper input(stream);
    ::capnp::PackedMessageReader message(input);
    TestCase::Reader testcase = message.getRoot<TestCase>();

    std::unordered_map<std::string, std::string> result;
    for (Symbol::Reader symbol : testcase.getSymbols()) {
      std::string name = std::string(symbol.getName().cStr());
      std::string value;
      Value::Reader val = symbol.getSymbol();
      auto array = val.getArray();
      value = std::string(array.begin(), array.end());
      result[name] = value;
    }
    return result;
  }

} // namespace serialize

} // namespace caffeine
