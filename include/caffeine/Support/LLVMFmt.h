#pragma once

#include <fmt/format.h>
#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APInt.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/raw_ostream.h>
#include <string_view>
#include <type_traits>

namespace caffeine {

template <typename It>
class LLVMFmtRawOstream final : public llvm::raw_ostream {
private:
  uint64_t pos_ = 0;

public:
  It it;

public:
  explicit LLVMFmtRawOstream(It it) : it(it) {
    this->SetBuffered();
  }

private:
  void write_impl(const char* ptr, size_t size) override {
    std::string_view view{ptr, size};

    pos_ += size;
    it = fmt::format_to(it, FMT_STRING("{}"), view);
  }

  uint64_t current_pos() const override {
    return pos_;
  }
};

template <typename T>
class LLVMTypeFormatter {
private:
  bool debug_ = false;

public:
  constexpr auto parse(fmt::format_parse_context& ctx) {
    auto it = ctx.begin();
    auto end = ctx.end();

    if (it != end && *it == 'd') {
      debug_ = true;
      ++it;
    }

    if (it != end && *it != '}')
      throw fmt::format_error("invalid format for LLVM type");

    return it;
  }

  template <typename FormatContext>
  auto format(const T& val, FormatContext& ctx) {
    LLVMFmtRawOstream os{ctx.out()};
    val.print(os, debug_);
    os.flush();

    return os.it;
  }
};

template <>
class LLVMTypeFormatter<llvm::APFloat> {
public:
  constexpr auto parse(fmt::format_parse_context& ctx) {
    auto it = ctx.begin();
    if (it != ctx.end() && *it != '}')
      throw fmt::format_error("invalid format specifier for llvm::APInt");

    return it;
  }

  template <typename FormatContext>
  auto format(const llvm::APFloat& val, FormatContext& ctx) {
    llvm::SmallVector<char, 64> str;
    val.toString(str);
    return fmt::format_to(ctx.out(), FMT_STRING("{}"),
                          std::string_view(str.data(), str.size()));
  }
};

template <>
class LLVMTypeFormatter<llvm::APInt> {
private:
  bool signed_ = false;
  unsigned radix_ = 10;

public:
  constexpr auto parse(fmt::format_parse_context& ctx) {
    auto it = ctx.begin();
    auto end = ctx.end();

    if (it == end || *it == '}')
      return it;

    if (*it == 'i' || *it == 'u')
      signed_ = *it++ == 'i';

    unsigned radix = 0;
    while (it != end && *it != '}') {
      if (!('0' <= *it || *it <= '9'))
        throw fmt::format_error("invalid format specifier for llvm::APInt");

      radix *= 10;
      radix += *it++ - '0';
    }

    if (radix != 0)
      radix_ = radix;

    if (it != ctx.end() && *it != '}')
      throw fmt::format_error("invalid format specifier for llvm::APInt");

    return it;
  }

  template <typename FormatContext>
  auto format(const llvm::APInt& val, FormatContext& ctx) {
    llvm::SmallVector<char, 64> str;
    val.toString(str, radix_, signed_);
    return fmt::format_to(ctx.out(), FMT_STRING("{}"),
                          std::string_view(str.data(), str.size()));
  }
};

} // namespace caffeine

#define CAFFEINE_DEF_LLVM_DERIVED_FMT(type)                                    \
  template <typename T>                                                        \
  struct fmt::formatter<T, std::enable_if_t<std::is_base_of_v<type, T>, char>> \
      : private ::caffeine::LLVMTypeFormatter<type> {                          \
    constexpr formatter() {}                                                   \
                                                                               \
    using ::caffeine::LLVMTypeFormatter<type>::parse;                          \
                                                                               \
    template <typename FormatContext>                                          \
    auto format(const T& val, FormatContext& ctx) {                            \
      return ::caffeine::LLVMTypeFormatter<type>::format(val, ctx);            \
    }                                                                          \
  }

// If you'd like to add printing for a new LLVM type _hierarchy_ then put the
// class type of the highest type within the hierarchy that has the print method
// here.

CAFFEINE_DEF_LLVM_DERIVED_FMT(llvm::Value);
CAFFEINE_DEF_LLVM_DERIVED_FMT(llvm::Type);
CAFFEINE_DEF_LLVM_DERIVED_FMT(llvm::APFloat);
CAFFEINE_DEF_LLVM_DERIVED_FMT(llvm::APInt);

#undef CAFFEINE_DEF_LLVM_DERIVED_FMT
