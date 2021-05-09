@0xe1240261ad88790c;

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("caffeine::tracing");

struct TraceSpan @0x9a020f3b6538255f {
  start @0 :UInt64; # Starting time of this span
  end   @1 :UInt64; # Ending time of this span
  name  @2 :Text;   # Name associated with this span

  annotations @3 :List(Annotation);
  # Arbitrary annotations added by the implementation. Semantically this is a
  # map but the implementation doesn't guarantee that names don't repeat.

  struct Annotation {
    name  @0 :Text;
    value @1 :Text;
  }
}
