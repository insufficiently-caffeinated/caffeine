@0xf54292a58fc34e9a;

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("caffeine::protos");

struct Symbol {
  union {
    name @0 :Text;
    number @1 :UInt64;
  }
}
