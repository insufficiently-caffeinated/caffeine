#pragma once

#include <cstdint>
#include <type_traits>
#include <vector>

namespace caffeine {

template<typename T = size_t>
class UnionFind {
public:
  UnionFind() = default;

  T make_set() {
    T id = parents.size();
    parents.push_back(id);
    return id;
  }

  size_t size() const {
    return parents.size();
  }

  const T& parent(T query) const {
    return parents.at(static_cast<size_t>(query));
  }
  T& parent(T query) {
    return parents.at(static_cast<size_t>(query));
  }

  T update(T current) {
    while (true) {
      T p = parent(current);

      if (current == p)
        break;

      auto gp = parent(p);
      parent(current) = gp;
      current = gp;
    }

    return current;
  }

  T find(T current) const {
    while (current != parent(current)) {
      current = parent(current);
    }

    return current;
  }
  T find(T current) {
    return update(current);
  }

  T do_union(T root1, T root2) {
    parent(root2) = root1;
    return root1;
  }

#ifdef CAFFEINE_EXPOSE_FOR_TESTING
public:
#else
private:
#endif
  std::vector<T> parents;
};

} // namespace caffeine
