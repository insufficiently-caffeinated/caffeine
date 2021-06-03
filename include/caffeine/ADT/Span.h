#pragma once

#include <algorithm>
#include <array>
#include <cassert>
#include <climits>
#include <cstddef>
#include <initializer_list>
#include <iterator>
#include <string>
#include <type_traits>
#include <vector>

#include <llvm/ADT/SmallVector.h>

namespace caffeine {

/**
 * Non-constant span type. A reference to a flat array of elements somewhere
 * that such that the elements can be modified.
 *
 * This is similar to a slice in rust.
 */
template <typename T>
class Span {
private:
  T* data_;
  size_t size_;

public:
  using value_type = T;
  using pointer = T*;
  using reference = T&;
  using size_type = size_t;
  using difference_type = std::ptrdiff_t;

  using iterator = T*;
  using reverse_iterator = std::reverse_iterator<T*>;

public:
  constexpr Span() : data_(nullptr), size_(0) {}
  constexpr Span(T* data, size_t size) : data_(data), size_(size) {}

  template <typename A>
  constexpr Span(std::vector<T, A>& vec) : Span(vec.data(), vec.size()) {}
  template <size_t N>
  constexpr Span(std::array<T, N>& array) : Span(array.data(), array.size()) {}
  template <size_t N>
  constexpr Span(T (&array)[N]) : Span(array, N) {}
  constexpr Span(llvm::SmallVectorImpl<T>& vec)
      : Span(vec.data(), vec.size()) {}
  template <typename Traits, typename Alloc>
  constexpr Span(std::basic_string<T, Traits, Alloc>& str)
      : Span(str.data(), str.size()) {}
  template <typename Traits, bool is_const = std::is_const_v<T>,
            typename U = std::enable_if_t<is_const>>
  constexpr Span(std::basic_string_view<std::remove_const_t<T>, Traits> view)
      : Span(view.data(), view.size()) {}

  constexpr size_t size() const {
    return size_;
  }
  constexpr T* data() const {
    return data_;
  }

  constexpr bool empty() const {
    return size() == 0;
  }

  constexpr const T& front() const {
    return (*this)[0];
  }
  constexpr T& front() {
    return (*this)[0];
  }

  constexpr const T& back() const {
    return (*this)[size() - 1];
  }
  constexpr T& back() {
    return (*this)[size() - 1];
  }

  constexpr T& operator[](size_t idx) const {
    assert(idx < size());
    return data()[idx];
  }

  constexpr T* begin() const {
    return data();
  }
  constexpr T* end() const {
    return data() + size();
  }

  constexpr reverse_iterator rbegin() const {
    return std::make_reverse_iterator(end());
  }
  constexpr reverse_iterator rend() const {
    return std::make_reverse_iterator(begin());
  }

  constexpr std::basic_string_view<T> view() const {
    return std::basic_string_view<T>(data(), size());
  }
  constexpr operator std::basic_string_view<T>() const {
    return view();
  }

  // Get a new span that is a subsection of this span.
  //
  // If length would go beyond the end of the span then the length is truncated
  // so that the new span does not extend beyond the end of the current one.
  constexpr Span<T> subslice(size_t start, size_t len = SIZE_MAX) const {
    size_t offset = std::min(start, size());
    size_t length = std::min(size() - offset, len);

    return Span<T>(data() + offset, length);
  }

  // Check if this span starts with the provided prefix.
  template <typename U>
  constexpr bool starts_with(Span<U> prefix) const {
    if (prefix.size() > size())
      return false;

    return std::equal(begin(), begin() + prefix.size(), prefix.begin(),
                      prefix.end());
  }
  // Check if this span ends with the provided suffix.
  template <typename U>
  constexpr bool ends_with(Span<U> suffix) const {
    if (suffix.size() > size())
      return false;

    return std::equal(rbegin(), rbegin() + suffix.size(), suffix.rbegin(),
                      suffix.rend());
  }
};

// This isn't strictly necessary but it helps make sure that everything compiles
// properly.
extern template class Span<char>;

} // namespace caffeine
