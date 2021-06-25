#include <capnp/message.h>
#include <capnp/serialize-packed.h>

#include "Serializer.h"
#include "test-serializer/Protos/testcase.capnp.h"

#include <cstdio>

namespace caffeine {

namespace serializer {

using caffeine::serializer::protos::TestCase;
using caffeine::serializer::protos::Symbol;
using caffeine::serializer::protos::Value;
using kj::byte;

void Serializer::write_test_case(int fd) {
    ::capnp::MallocMessageBuilder message;
    TestCase::Builder testcase = message.initRoot<TestCase>();
    ::capnp::List<Symbol>::Builder testcases = testcase.initSymbols(symbols.size());

    for( unsigned int i = 0; i < symbols.size(); i++ ) {
        Symbol::Builder v = testcases[i];
        v.setName(symbols[i].name.c_str());
        auto value = v.initSymbol();
        const byte * b = reinterpret_cast<const unsigned char *>(symbols[i].bytes);
        size_t size = strlen(symbols[i].bytes);
        value.setArray(capnp::Data::Reader(b, size));
    }

    writePackedMessageToFd(fd, message);
}


void Serializer::load_test_case(int fd) {
    ::capnp::PackedFdMessageReader message(fd);
    TestCase::Reader testcase = message.getRoot<TestCase>();

    symbols.clear();
    for (Symbol::Reader symbol : testcase.getSymbols()) {
        TestCaseValue tc;
        std::string name = std::string(symbol.getName().cStr());
        Value::Reader val = symbol.getSymbol();
        switch (val.which()) {
            case Value::Which::ARRAY:
            {
                auto array = val.getArray();
                tc.bytes = new char[array.size()];
                // this should work??
                memcpy(tc.bytes, array.begin(), array.size());
                break;
            }
            default:
                tc.bytes = nullptr;
                break;
        }
        symbols.push_back(tc);
    }
}

void Serializer::add_symbol(std::string & name, char * data) {
    symbols.emplace_back(TestCaseValue{name, data});
}

void Serializer::save_file() {
    std::FILE * file = std::fopen(filepath.c_str(), "w");
    int fd = fileno(file);
    write_test_case(fd);
}

void Serializer::load_file() {
    std::FILE * file = std::fopen(filepath.c_str(), "r");
    int fd = fileno(file);
    load_test_case(fd);
}

std::vector<TestCaseValue> Serializer::get_symbols() {
    return symbols;
}


} // namespace serializer

} // namespace caffeine
