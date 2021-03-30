#pragma once

#include "caffeine/ADT/Span.h"

namespace caffeine {

class Context;
  
/**
 * A store of Contexts that are not currently being executed.
 *
 * Note that when executing in a multithreaded fashion this may be accessed
 * concurrently from multiple threads.
 */
class ExecutionContextStore {
public:
  ExecutionContextStore() = default;
  virtual ~ExecutionContextStore() = default;

  // Add a context to the store so that it can be retrieved later.
  virtual void add_context(Context&& ctx) = 0;
  // Get the next available context in the store
  virtual Context next_context() = 0;

  // Add multiple contexts to the store at once.
  //
  // By default this will just call add_context in a loop.
  virtual void add_context_multi(Span<Context> contexts);

protected:
  ExecutionContextStore(ExecutionContextStore&&) = default;
  ExecutionContextStore(const ExecutionContextStore&) = default;

  ExecutionContextStore& operator=(ExecutionContextStore&&) = default;
  ExecutionContextStore& operator=(const ExecutionContextStore&) = default;
};

}
