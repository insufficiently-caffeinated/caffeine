#pragma once

#include <string>
#include <string_view>
#include <unordered_map>

namespace caffeine {

namespace serialize {

  std::string serialize_test_case(
      const std::unordered_map<std::string, std::string>& symbols);
  std::unordered_map<std::string, std::string>
  deserialize_test_case(std::string_view& data);

} // namespace serialize

} // namespace caffeine
