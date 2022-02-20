@0xa5a2c19ddf8b8759;

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("caffeine::protos");

struct Constant {
  name  @0 :Text;
  value @1 :Data;
}

struct TestCase {
  constants @0 :List(Constant);
  message   @1 :Text;
  backtrace @2 :Text;
}
