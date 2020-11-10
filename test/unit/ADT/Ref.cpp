
#include "caffeine/ADT/Ref.h"

#include <gtest/gtest.h>

#include <cstdint>

using namespace caffeine;

class tracking_refcountable {
public:
  uint32_t* copy_ctr;
  uint32_t* dtor_ctr;
  mutable uint32_t refcount = 0;

  tracking_refcountable(uint32_t* copy_ctr, uint32_t* dtor_ctr)
      : copy_ctr(copy_ctr), dtor_ctr(dtor_ctr) {}
  ~tracking_refcountable() {
    if (dtor_ctr) {
      ++*dtor_ctr;
    }
  }

  tracking_refcountable(const tracking_refcountable& ref)
      : copy_ctr(ref.copy_ctr), dtor_ctr(ref.dtor_ctr) {
    if (copy_ctr) {
      ++*copy_ctr;
    }
  }
};

TEST(adt_ref, ctor_dtor_correct) {
  uint32_t cctr1 = 0, cctr2 = 0;
  uint32_t dctr1 = 0, dctr2 = 0;

  {
    auto ref1 = make_ref<tracking_refcountable>(&cctr1, &dctr1);
    auto ref2 = make_ref<tracking_refcountable>(&cctr2, &dctr2);

    // Should be able to implicitly cast to const ref
    ref<const tracking_refcountable> cref = ref1;

    ASSERT_EQ(ref1->refcount, 2);
    ASSERT_EQ(ref2->refcount, 1);
    ASSERT_NE(ref1, ref2);

    auto otherref = ref2;
    otherref = ref1;
    ref2 = ref1;

    ASSERT_EQ(dctr1, 0);
    ASSERT_EQ(dctr2, 1);
    ASSERT_EQ(ref1, ref2);
  }

  ASSERT_EQ(dctr1, 1);
  ASSERT_EQ(dctr2, 1);

  ASSERT_EQ(cctr1, 0);
  ASSERT_EQ(cctr2, 0);
}

TEST(adt_ref, take) {
  uint32_t dctr = 0;
  auto ref = make_ref<tracking_refcountable>(nullptr, &dctr);

  ASSERT_EQ(ref->refcount, 1);

  auto* raw = ref.take();

  ASSERT_EQ(dctr, 0);
  ASSERT_TRUE(!ref);
  ASSERT_TRUE(raw);
  ASSERT_EQ(raw->refcount, 1);

  delete raw;

  ASSERT_EQ(dctr, 1);
}

TEST(adt_ref, from_raw) {
  uint32_t dctr = 0;
  auto ptr = new tracking_refcountable(nullptr, &dctr);
  ptr->refcount = 1;
  auto val = ref<tracking_refcountable>::from_raw(ptr);

  ASSERT_EQ(val->refcount, 1);
  ASSERT_EQ(val.refcount(), 1);
  ASSERT_EQ(dctr, 0);

  val = nullptr;

  ASSERT_EQ(dctr, 1);
}
