#ifndef CAFFEINE_ADT_SHAREDARRAY_H
#define CAFFEINE_ADT_SHAREDARRAY_H

#include <memory>
#include <unordered_map>
#include <variant>
#include <vector>

namespace caffeine {

/**
 * Efficiently copiable array.
 *
 * This class will automatically track modifications to a base array. This is
 * meant to allow efficient cloning of the array while still allowing for
 * modifications to be made. Note that this will get more inefficient as more
 * levels are added to the modification chain.
 *
 * To avoid degenerate cases SharedArray will copy the backing data when the
 * number of elements/modifications is low.
 *
 * Safety
 * ======
 * Due to internal implementation details it is UB to copy from a flat
 * SharedArray concurrently from multiple threads (as it needs to convert the
 * copied-from instance to a shared instance).
 *
 * TODOs
 * =====
 * If you happen to need these then go ahead and implement them :)
 * - Iterators (both const and non-const). These should use load and store and
 *   may find it easiest to take advantage of IndexAccessor.
 */
class SharedArray {
  // Needed so that tests can use the internal thresholds instead of hardcoding
  // them. Shouldn't normally be set.
#ifdef CAFFEINE_SHAREDARRAY_TEST_EXPOSE_INTERNALS
public:
#else
private:
#endif
  /**
   * For sizes <= to this one we'll just copy the inner data instead of turning
   * it into a shared reference.
   *
   * TODO: Tune this to see what works best at runtime.
   */
  static constexpr size_t min_copy_size = 64;
  /**
   * If the fraction of modified items is greater than this then we'll flatten
   * the SharedArray into a single vector.
   *
   * TODO: Tune this to balance memory usage with performance.
   */
  static constexpr double flatten_threshold = 0.8;

private:
  struct Modified;

  using Variant = std::variant<std::vector<char>, Modified>;

  struct Modified {
    std::shared_ptr<Variant> variant;
    std::unordered_map<size_t, char> changes;

    Modified(const std::shared_ptr<Variant>& var) : variant(var) {}

    const char& operator[](size_t idx) const {
      const Modified* current = this;

      while (true) {
        auto it = current->changes.find(idx);
        if (it != current->changes.end())
          return it->second;

        if (const auto* data =
                std::get_if<std::vector<char>>(current->variant.get()))
          return data->at(idx);

        current = &std::get<Modified>(*current->variant);
      }
    }
  };

  mutable Variant data_;
  size_t modcnt_ = 0;
  size_t size_ = 0;

public:
  // Proxy class for non-const element access
  class IndexAccessor {
  private:
    SharedArray* array;
    size_t idx;

    IndexAccessor(SharedArray* array, size_t idx) : array(array), idx(idx) {}

    friend class SharedArray;

    IndexAccessor() = delete;
    IndexAccessor(const IndexAccessor&) = delete;
    IndexAccessor(IndexAccessor&&) = delete;
    IndexAccessor& operator=(const IndexAccessor&) = delete;
    IndexAccessor& operator=(IndexAccessor&&) = delete;

  public:
    operator char() const {
      return array->load(idx);
    }

    IndexAccessor& operator=(char value) {
      array->store(idx, value);
      return *this;
    }
  };

public:
  SharedArray() = default;
  ~SharedArray() = default;

  SharedArray(const std::vector<char>& data);
  SharedArray(std::vector<char>&& data);
  SharedArray(const char* data, size_t size);

  template <typename It>
  SharedArray(It begin, It end) : data_(std::vector<char>(begin, end)) {}

  SharedArray(const SharedArray& array);
  SharedArray(SharedArray&& array);

  SharedArray& operator=(const SharedArray& array);
  SharedArray& operator=(SharedArray&& array);

  size_t size() const {
    return size_;
  }

  bool is_shared() const {
    return data_.index() == 1;
  }
  bool is_flat() const {
    return data_.index() == 0;
  }

  void store(size_t idx, char value);
  char load(size_t idx) const;

  char operator[](size_t idx) const;
  IndexAccessor operator[](size_t idx);

  void flatten();

  /**
   * Access the internal data as an array.
   *
   * Note that this will flatten the shared array. Unless you need the data as
   * an array it is preferable to use the indexing accessors.
   */
  char* data();
};

bool operator==(const SharedArray& lhs, const SharedArray& rhs);
bool operator!=(const SharedArray& lhs, const SharedArray& rhs);

} // namespace caffeine

#endif
