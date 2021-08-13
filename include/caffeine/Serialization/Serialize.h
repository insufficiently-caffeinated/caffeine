#pragma once

#include <string>
// #include <mutex> // TODO remove
#include <unordered_map>
#include <vector>


namespace caffeine {

namespace serialize {

std::vector<char> serialize_test_case(const std::unordered_map<std::string, std::string>& symbols);
std::unordered_map<std::string, std::string> deserialize_test_case(std::vector<char>& data);

} // namespace serialize

} // namespace caffeine

