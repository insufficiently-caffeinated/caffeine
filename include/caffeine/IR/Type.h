#ifndef CAFFEINE_IR_TYPE_H
#define CAFFEINE_IR_TYPE_H

#include <cstdint>

namespace llvm {
  class APInt;
  class APFloat;
}

namespace caffeine {
  
/**
 * TODO: Figure out representation here.
 */
class Type {
private:
public:
  bool is_int() const;
  bool is_fp() const;
  bool is_pointer() const;

  static Type int_ty(uint32_t bitwidth);
  static Type void_ty();
  static Type fp_ty(uint32_t exponent, uint32_t mantissa);

  static Type type_of(const llvm::APInt& apint);
  static Type type_of(const llvm::APFloat& apfloat);
};

bool operator==(const Type& a, const Type& b);
bool operator!=(const Type& a, const Type& b);

}

#endif
