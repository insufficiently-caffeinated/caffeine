@0xa5a2c19ddf8b8759;

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("caffeine::serializer::protos");

enum Type {
  void @0;
  int @1;
  float @2;
  array @3;
}

struct Value {
  union {
    empty @0 :Void;
    array @1 :Data;
  }
}

struct Symbol {
  name @0 :Text;
  symbol @1 :Value;
}

struct TestCase {
  symbols @0 :List(Symbol);
}
