#include "caffeine/Memory/MemHeap.h"

#include <fmt/format.h>
#include <fmt/ostream.h>
#include <iostream>
#include <magic_enum.hpp>

namespace caffeine {

void Allocation::DebugPrint() const {
  fmt::print(std::cout,
             FMT_STRING("Allocation {{\n"
                        "  address: {}\n"
                        "  size:    {}\n"
                        "  data:    {}\n"
                        "  kind:    {}\n"
                        "}}\n"),
             *address_, *size_, *data_, magic_enum::enum_name(kind_));
}

void Pointer::DebugPrint() const {
  fmt::print(std::cout,
             FMT_STRING("Pointer {{\n"
                        "  alloc:  {}\n"
                        "  offset: {}\n"
                        "}}\n"),
             alloc_.first, *offset_);
}

void MemHeap::DebugPrint() const {
  std::cout << "MemHeap [\n";
  for (const auto& alloc : allocs_) {
    alloc.DebugPrint();
  }
  std::cout << "]" << std::endl;
}

} // namespace caffeine
