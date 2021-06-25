#pragma once

#include <string>
#include <mutex>
#include <vector>

namespace caffeine {

namespace serializer {

struct TestCaseValue {
    std::string name;
    char * bytes;
};

class Serializer {
    std::string filepath;
    std::mutex file_mutex;
    std::vector<TestCaseValue> symbols;

    void write_test_case(int fd);
    void load_test_case(int fd);

public:
    Serializer(std::string filepath);
    ~Serializer();

    void add_symbol(std::string & name, char * data);
    void save_file();

    void load_file();

    std::vector<TestCaseValue> get_symbols();

};

} // namespace serializer

} // namespace caffeine

