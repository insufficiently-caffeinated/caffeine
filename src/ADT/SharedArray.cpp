
#include "caffeine/ADT/SharedArray.h"
#include "caffeine/Support/Assert.h"

namespace caffeine {

SharedArray::SharedArray(const std::vector<char>& data)
    : data_(data), size_(data.size()) {}
SharedArray::SharedArray(std::vector<char>&& data) : data_(std::move(data)) {
  size_ = std::get<std::vector<char>>(data_).size();
}
SharedArray::SharedArray(const char* data, size_t size)
    : data_(std::vector<char>(data, data + size)), size_(size) {}

SharedArray::SharedArray(const SharedArray& array) {
  *this = array;
}
SharedArray::SharedArray(SharedArray&& array)
    : data_(std::move(array.data_)), modcnt_(array.modcnt_),
      size_(array.size_) {
  array.data_ = std::vector<char>();
  array.size_ = 0;
  array.modcnt_ = 0;
}

SharedArray& SharedArray::operator=(const SharedArray& array) {
  if (auto* data = std::get_if<std::vector<char>>(&array.data_)) {
    if (data->size() <= min_copy_size) {
      data_ = *data;
    } else {
      auto variant = std::make_shared<Variant>(std::move(array.data_));

      array.data_ = Modified(variant);
      data_ = Modified(variant);
    }
  } else {
    auto& mod = std::get<Modified>(array.data_);

    if (mod.changes.size() <= min_copy_size) {
      data_ = mod;
    } else {
      auto variant = std::make_shared<Variant>(std::move(array.data_));

      array.data_ = Modified(variant);
      data_ = Modified(variant);
    }
  }

  modcnt_ = array.modcnt_;
  size_ = array.size_;

  return *this;
}
SharedArray& SharedArray::operator=(SharedArray&& array) {
  data_ = std::move(array.data_);
  size_ = array.size_;
  modcnt_ = array.modcnt_;

  array.data_ = std::vector<char>();
  array.size_ = 0;
  array.modcnt_ = 0;

  return *this;
}

void SharedArray::store(size_t idx, char value) {
  CAFFEINE_ASSERT(idx < size(), "index out of bounds");

  std::visit(
      [=](auto& data) {
        using type = std::decay_t<decltype(data)>;

        if constexpr (std::is_same_v<type, std::vector<char>>) {
          data.at(idx) = value;
        } else {
          auto it = data.changes.find(idx);
          if (it != data.changes.end()) {
            it->second = value;
            return;
          }

          if (data[idx] == value)
            return;

          data.changes.insert({idx, value});
          modcnt_ += 1;

          if (modcnt_ > size() * flatten_threshold)
            flatten();
        }
      },
      data_);
}
char SharedArray::load(size_t idx) const {
  CAFFEINE_ASSERT(idx < size(), "index out of bounds");
  return std::visit([=](const auto& val) -> char { return val[idx]; }, data_);
}

void SharedArray::flatten() {
  if (is_flat())
    return;

  std::vector<char> newdata;
  newdata.reserve(size());

  for (size_t i = 0; i < size(); ++i)
    newdata.push_back(load(i));

  data_ = std::move(newdata);
}
char* SharedArray::data() {
  flatten();
  return std::get<std::vector<char>>(data_).data();
}

char SharedArray::operator[](size_t idx) const {
  return load(idx);
}
SharedArray::IndexAccessor SharedArray::operator[](size_t idx) {
  CAFFEINE_ASSERT(idx < size(), "index out of bounds");
  return IndexAccessor(this, idx);
}

bool operator==(const SharedArray& lhs, const SharedArray& rhs) {
  if (lhs.size() != rhs.size())
    return false;

  for (size_t i = 0; i < lhs.size(); ++i) {
    if (lhs[i] != rhs[i])
      return false;
  }

  return true;
}
bool operator!=(const SharedArray& lhs, const SharedArray& rhs) {
  return !(lhs == rhs);
}

llvm::hash_code hash_value(const SharedArray& array) {
  if (const auto* vec = std::get_if<std::vector<char>>(&array.data_)) {
    return llvm::hash_combine_range(vec->begin(), vec->end());
  } else {
    return llvm::hash_combine_range(array.begin(), array.end());
  }
}

} // namespace caffeine
