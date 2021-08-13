@0xa5a2c19ddf8b8759;

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("caffeine::serialize::protos");

struct Value {
  array @0 :Data;
}

struct Symbol {
  name @0 :Text;
  symbol @1 :Value;
}

struct TestCase {
  symbols @0 :List(Symbol);
}
