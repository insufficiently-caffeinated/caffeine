@0x9ef46c2155de6bed;

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("caffeine::protos");
using import "operation.capnp".Symbol;

struct Value {
  union {
    empty @0 :Void;
    array @1 :Data;
  }
}

struct TestCase {
  values @0 :List(Value);
}
