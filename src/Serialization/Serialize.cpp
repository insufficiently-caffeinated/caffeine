#include "caffeine/Serialization/Serialize.h"

#include <algorithm>

#include <capnp/message.h>
#include <capnp/serialize-packed.h>

#include "caffeine/Protos/testcase.capnp.h"

namespace caffeine {

namespace serializer {

using caffeine::serializer::protos::TestCase;
using caffeine::serializer::protos::Symbol;
using caffeine::serializer::protos::Value;
using capnp::word;
using kj::byte;


std::vector<char> serialize_test_case(const std::unordered_map<std::string, std::string>& symbols)
{
    ::capnp::MallocMessageBuilder message;
    TestCase::Builder testcase = message.initRoot<TestCase>();
    ::capnp::List<Symbol>::Builder testcases = testcase.initSymbols(symbols.size());
    unsigned int index = 0;
    for (const auto& [name, value] : symbols) {
        Symbol::Builder v = testcases[index];
        v.setName(name.c_str());
        auto symbol = v.initSymbol();
        const byte * b = reinterpret_cast<const unsigned char *>(value.c_str());
        symbol.setArray(capnp::Data::Reader(b, value.size()));
        ++index;
    }

    kj::VectorOutputStream stream;
    ::capnp::writePackedMessage(stream, message);
    kj::ArrayPtr<byte> bytes = stream.getArray();
    std::vector<char> result(bytes.size());
    std::copy(bytes.begin(), bytes.end(), result.begin());
    return result;
}

std::unordered_map<std::string, std::string> deserialize_test_case(std::vector<char>& data)
{
    byte * ptr = reinterpret_cast<byte *>(data.data());
    kj::ArrayPtr<byte> bufferPtr = kj::arrayPtr(ptr, sizeof(data.size()));

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

} // namespace serializer

} // namespace caffeine
