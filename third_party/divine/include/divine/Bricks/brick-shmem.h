// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * Utilities and data structures for shared-memory parallelism. Includes:
 * - shared memory, lock-free first-in/first-out queue (one reader + one writer)
 * - a spinlock
 * - approximate counter (share a counter between threads without contention)
 * - a weakened atomic type (like std::atomic)
 * - a derivable wrapper around std::thread
 */

/*
 * (c) 2008, 2012 Petr Ročkai <me@mornfall.net>
 * (c) 2011 Tomáš Janoušek <tomi@nomi.cz>
 * (c) 2014 Vladimír Štill <xstill@fi.muni.cz>
 */

/* Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE. */

#pragma once

#include "brick-assert.h"
#include <deque>
#include <iostream>
#include <typeinfo>

#include <atomic>
#include <future>
#include <mutex>
#include <thread>

#include <unistd.h> // alarm
#include <vector>

#ifndef BRICKS_CACHELINE
#define BRICKS_CACHELINE 64
#endif

namespace brick {
namespace shmem {

  struct ThreadBase {
    virtual void start() = 0;
    virtual void stop() = 0;
    virtual ~ThreadBase() {}
  };

  template <typename T>
  struct Thread : T, ThreadBase {
    std::unique_ptr<std::thread> _thread;
    bool _start_on_move; // :-(

    template <typename... Args>
    Thread(Args&&... args)
        : T(std::forward<Args>(args)...), _start_on_move(false) {}
    virtual ~Thread() {
      stop();
    }

    Thread(const Thread& other) : T(other) {
      if (other._thread)
        throw std::logic_error("cannot copy running thread");
    }

    Thread(Thread&& other)
        : T(other._thread
                ? throw std::logic_error("cannot move a running thread")
                : other),
          _thread(std::move(other._thread)), _start_on_move(false) {
      if (other._start_on_move)
        start();
    }

    virtual void start() {
      _thread.reset(new std::thread([this]() { this->main(); }));
    }

    virtual void stop() {
      if (_thread && _thread->joinable())
        join();
    }

    void join() {
      if (_thread) {
        _thread->join();
        _thread.reset();
      }
    }

    void detach() {
      if (_thread) {
        _thread->detach();
        _thread.reset();
      }
    }
  };

  template <typename T>
  struct LoopWrapper : T {
    std::atomic<bool> _interrupted;

    template <typename... Args>
    LoopWrapper(Args&&... args)
        : T(std::forward<Args>(args)...), _interrupted(false) {}

    LoopWrapper(const LoopWrapper&) = default;
    LoopWrapper(LoopWrapper&&) = default;

    void main() {
      while (!_interrupted)
        this->loop();
    }

    bool interrupted() const {
      return _interrupted.load(std::memory_order_relaxed);
    }

    void interrupt() {
      _interrupted.store(true, std::memory_order_relaxed);
    }
  };

  template <typename L>
  struct LambdaWrapper {
    L lambda;
    LambdaWrapper(L l) : lambda(l) {}
    void loop() {
      lambda();
    }
    void main() {
      lambda();
    }
  };

  template <typename T>
  struct AsyncLoop : Thread<LoopWrapper<T>> {
    using Super = Thread<LoopWrapper<T>>;

    template <typename... Args>
    AsyncLoop(Args&&... args) : Super(std::forward<Args>(args)...) {}

    AsyncLoop(const AsyncLoop&) = default;
    AsyncLoop(AsyncLoop&&) = default;

    virtual ~AsyncLoop() {
      stop(); /* call the correct stop(), with interrupt() */
    }

    void start() {
      this->_interrupted.store(false, std::memory_order_relaxed);
      Super::start();
    }

    void stop() {
      this->interrupt();
      Super::stop();
    }
  };

  template <typename L>
  using AsyncLambdaLoop = AsyncLoop<LambdaWrapper<L>>;

  template <typename L>
  auto async_loop(L&& l) {
    AsyncLambdaLoop<L> al(std::forward<L>(l));
    al._start_on_move = true;
    return std::move(al);
  }

  template <typename L>
  auto thread(L&& l) {
    Thread<LambdaWrapper<L>> thr(std::forward<L>(l));
    thr._start_on_move = true;
    return std::move(thr);
  }

  template <typename T>
  struct ThreadSet : std::vector<Thread<T>> {
    template <typename... Args>
    ThreadSet(Args&&... args)
        : std::vector<Thread<T>>(std::forward<Args>(args)...) {}

    void start() {
      for (auto& t : *this)
        t.start();
    }
    void join() {
      for (auto& t : *this)
        t.join();
    }
  };

  /**
   * A spinlock implementation.
   *
   * One has to wonder why this is missing from the C++0x stdlib.
   */
  struct SpinLock {
    std::atomic_flag b;

    SpinLock() : b(0) {}

    void lock() {
      while (b.test_and_set())
        ;
    }

    void unlock() {
      b.clear();
    }

    SpinLock(const SpinLock&) = delete;
    SpinLock& operator=(const SpinLock&) = delete;
  };

  /**
   * Termination detection implemented as a shared counter of open (not yet
   * processed) states. This appears to be fast because the shared counter is
   * modified very rarely -- its incremented in large steps for thousands of
   * states in advance and then adjusted down to its actual value only if the
   * queue gets empty.
   *
   * Shared counter - Σ local of all threads = actual open count.
   * local ≥ 0, hence shared is an overapproximation of the actual open count.
   * This implies partial correctness.
   *
   * Termination follows from proper calls to sync().
   */
  struct ApproximateCounter {
    enum { step = 100000 };

    struct Shared {
      std::atomic<intptr_t> counter;
      Shared() : counter(0) {}

      Shared(const Shared&) = delete;
    };

    std::shared_ptr<Shared> _s;
    intptr_t _l;

    ApproximateCounter() : _s(new Shared), _l(0) {}
    ApproximateCounter(const ApproximateCounter& other) : _s(other._s), _l(0) {}
    ApproximateCounter operator=(const ApproximateCounter&) = delete;
    ~ApproximateCounter() {
      sync();
    }

    void sync() {
      intptr_t value = _s->counter;

      while (_l > 0) {
        if (value >= _l) {
          if (_s->counter.compare_exchange_weak(value, value - _l))
            _l = 0;
        } else {
          if (_s->counter.compare_exchange_weak(value, 0))
            _l = 0;
        }
      }
    }

    ApproximateCounter& operator++() {
      if (_l == 0) {
        _s->counter += step;
        _l = step;
      }

      --_l;

      return *this;
    }

    ApproximateCounter& operator--() {
      ++_l;
      return *this;
    }

    // NB. may return false spuriously; call sync() to ensure a correct result
    operator bool() {
      return _s->counter;
    }
    bool operator!() {
      return _s->counter == 0;
    }

    void reset() {
      _s->counter = 0;
    } /* fixme misleading? */
  };

  struct StartDetector {

    struct Shared {
      /*
       *  Normally these fields should be placed in different
       *  cache-lines to avoid false-sharing. This case is a
       *  little bit different since this class is a parallel
       *  reentrant barrier moreover used only on the very
       *  beginning of the verification in DIVINE.
       */
      std::atomic<unsigned short> counter;
      std::atomic<unsigned short> leaveGuard;

      Shared() : counter(0), leaveGuard(0) {}
      Shared(Shared&) = delete;
    };

    std::shared_ptr<Shared> _s;

    StartDetector() : _s(new Shared()) {}

    void waitForAll(unsigned short peers) {
      while (_s->leaveGuard)
        ;

      if (++_s->counter == peers) {
        _s->leaveGuard = peers;
        _s->counter = 0;
      }

      while (_s->counter)
        ;
      --_s->leaveGuard;
    }
  };

  /*
   * Simple wrapper around atomic with weakened memory orders.
   *
   * The WeakAtomic users consume memory order for reading and release MO for
   * writing, which should assure atomicity and consistency of given variable,
   * however it does not assure consistence of other variables written before
   * given atomic location.  Read-modify-write operations use
   * memory_order_acq_rel.
   */

  namespace _impl {

    template <typename Self, typename T>
    struct WeakAtomicIntegral {

      T operator|=(T val) {
        return self()._data.fetch_or(val, std::memory_order_acq_rel) | val;
      }

      T operator&=(T val) {
        return self()._data.fetch_and(val, std::memory_order_acq_rel) & val;
      }

      Self& self() {
        return *static_cast<Self*>(this);
      }
    };

    struct Empty {};

  } // namespace _impl

  template <typename T>
  struct WeakAtomic
      : std::conditional<
            std::is_integral<T>::value && !std::is_same<T, bool>::value,
            _impl::WeakAtomicIntegral<WeakAtomic<T>, T>, _impl::Empty>::type {
    WeakAtomic(T x) : _data(x) {}
    WeakAtomic() = default;

    operator T() const {
      return _data.load(std::memory_order_consume);
    }
    T operator=(T val) {
      _data.store(val, std::memory_order_release);
      return val;
    }

  private:
    std::atomic<T> _data;
    friend struct _impl::WeakAtomicIntegral<WeakAtomic<T>, T>;
  };

#ifndef __divine__
  template <typename T>
  constexpr int defaultNodeSize() {
    return (32 * 4096 - BRICKS_CACHELINE - sizeof(void*)) / sizeof(T);
  }
#else
  template <typename T>
  constexpr int defaultNodeSize() {
    return 3;
  }
#endif

  /*
   * A simple queue (First-In, First-Out). Concurrent access to the ends of the
   * queue is supported -- a thread may write to the queue while another is
   * reading. Concurrent access to a single end is, however, not supported.
   *
   * The NodeSize parameter defines a size of single block of objects. By
   * default, we make the node a page-sized object -- this seems to work well in
   * practice. We rely on the allocator to align the allocated blocks reasonably
   * to give good cache usage.
   */

  template <typename T, int NodeSize = defaultNodeSize<T>()>
  struct Fifo {
  protected:
    // the Node layout puts read and write counters far apart to avoid
    // them sharing a cache line, since they are always written from
    // different threads
    struct Node {
      T* read __attribute__((__aligned__(BRICKS_CACHELINE)));
      T buffer[NodeSize] __attribute__((__aligned__(BRICKS_CACHELINE)));
      T* volatile write;
      Node* next;
      Node() {
        read = write = buffer;
        next = 0;
      }
    };

    // pad the fifo object to ensure that head/tail pointers never
    // share a cache line with anyone else
    Node* head __attribute__((__aligned__(BRICKS_CACHELINE)));
    Node* volatile tail __attribute__((__aligned__(BRICKS_CACHELINE)));

  public:
    Fifo() {
      head = tail = new Node();
      ASSERT(empty());
    }

    // copying a fifo is not allowed
    Fifo(const Fifo&) {
      head = tail = new Node();
      ASSERT(empty());
    }

    ~Fifo() {
      while (head != tail) {
        Node* next = head->next;
        ASSERT(next != 0);
        delete head;
        head = next;
      }
      delete head;
    }

    void push(const T& x) {
      Node* t;
      if (tail->write == tail->buffer + NodeSize)
        t = new Node();
      else
        t = tail;

      *t->write = x;
      ++t->write;
      __sync_synchronize();

      if (tail != t) {
        tail->next = t;
        __sync_synchronize();
        tail = t;
      }
    }

    bool empty() {
      return head == tail && head->read >= head->write;
    }

    int size() {
      int size = 0;
      Node* n = head;
      do {
        size += n->write - n->read;
        n = n->next;
      } while (n);
      return size;
    }

    void dropHead() {
      Node* old = head;
      head = head->next;
      ASSERT(head);
      delete old;
    }

    void pop() {
      ASSERT(!empty());
      ++head->read;
      if (head->read == head->buffer + NodeSize) {
        if (head != tail) {
          dropHead();
        }
      }
      // the following can happen when head->next is 0 even though head->read
      // has reached NodeSize, *and* no front() has been called in the meantime
      if (head != tail && head->read > head->buffer + NodeSize) {
        dropHead();
        pop();
      }
    }

    T& front(bool wait = false) {
      while (wait && empty())
        ;
      ASSERT(head);
      ASSERT(!empty());
      // last pop could have left us with empty queue exactly at an
      // edge of a block, which leaves head->read == NodeSize
      if (head->read == head->buffer + NodeSize) {
        dropHead();
      }
      return *head->read;
    }
  };

  /*
   * A very simple spinlock-protected queue based on std::deque.
   */

  template <typename T>
  struct LockedQueue {
    typedef brick::shmem::SpinLock Mutex;
    Mutex m;
    brick::shmem::WeakAtomic<bool> _empty;
    std::deque<T> q;
    using element = T;

    LockedQueue(void) : _empty(true) {}

    bool empty() const {
      return _empty;
    }

    void push(const T& x) {
      std::lock_guard<Mutex> lk(m);
      q.push_back(x);
      _empty = false;
    }

    void push(T&& x) {
      std::lock_guard<Mutex> lk(m);
      q.push_back(std::move(x));
      _empty = false;
    }

    /**
     * Pops a whole chunk, to be processed by one thread as a whole.
     */
    T pop() {
      T ret = T();

      /* Prevent threads from contending for a lock if the queue is empty. */
      if (empty())
        return ret;

      std::lock_guard<Mutex> lk(m);

      if (q.empty())
        return ret;

      ret = std::move(q.front());
      q.pop_front();

      if (q.empty())
        _empty = true;

      return ret;
    }

    void clear() {
      std::lock_guard<Mutex> guard{m};
      q.clear();
      _empty = true;
    }

    LockedQueue(const LockedQueue&) = delete;
    LockedQueue& operator=(const LockedQueue&) = delete;
  };

  template <template <typename> class Q, typename T>
  struct Chunked {
    using Chunk = std::deque<T>;
    using ChQ = Q<Chunk>;
    std::shared_ptr<ChQ> q;
    unsigned chunkSize;

    Chunk outgoing;
    Chunk incoming;

    void push(T t) {
      outgoing.push_back(t);
      if (outgoing.size() >= chunkSize)
        flush();
    }

    T pop() {
      if (incoming.empty())
        incoming = q->pop();
      if (incoming.empty())
        UNREACHABLE("attempted to pop an empty queue");
      auto x = incoming.front();
      incoming.pop_front();
      return x;
    }

    void flush() {
      if (!outgoing.empty()) {
        Chunk tmp;
        std::swap(outgoing, tmp);
        q->push(std::move(tmp));

        /* A quickstart trick -- make first few chunks smaller. */
        if (chunkSize < 64)
          chunkSize = std::min(2 * chunkSize, 64u);
      }
    }

    bool empty() {
      if (incoming.empty()) /* try to get a fresh one */
        incoming = q->pop();
      return incoming.empty();
    }

    Chunked() : q(new ChQ()), chunkSize(2) {}
  };

  template <typename T>
  using SharedQueue = Chunked<LockedQueue, T>;

  namespace {

    using steady_time = std::chrono::time_point<std::chrono::steady_clock>;

    static inline steady_time later(int ms) {
      return std::chrono::steady_clock::now() + std::chrono::milliseconds(ms);
    }

    template <typename I, typename F>
    std::future_status wait(I b, I e, F cleanup,
                            steady_time until = later(500)) try {
      int total = 0, ready = 0;
      for (auto i = b; i != e; ++i) {
        if (!i->valid())
          continue;
        ++total;
        if (i->wait_until(until) == std::future_status::ready) {
          ++ready;
          i->get(); /* throw any exceptions */
        }
      }
      if (total == ready) {
        cleanup();
        return std::future_status::ready;
      }
      return std::future_status::timeout;
    } catch (...) {
      cleanup();
      throw;
    };

  } // namespace

} // namespace shmem

namespace t_shmem {

  using namespace ::brick::shmem;

#ifdef __divine__
  static constexpr int size = 16;
  static void timeout() {}
#else
  static constexpr int size = 128 * 1024;
#endif

#if defined(__unix) || defined(POSIX)
  static void timeout() {
    alarm(5);
  }
#endif

  struct ThreadTest {
    TEST(async_loop) {
      timeout();
      std::atomic<int> x(0);
      auto t = shmem::async_loop([&]() { x = 1; });
      while (!x)
        ;
      t.stop();
    }

    TEST(thread) {
      timeout();
      std::atomic<int> x(0);
      auto t = shmem::thread([&]() { x = 1; });
      while (!x)
        ;
      t.join();
    }
  };

  struct FifoTest {
    template <typename T>
    struct Checker {
      Fifo<T> fifo;
      int terminate;
      int n;

      void main() {
        std::vector<int> x;
        x.resize(n);
        for (int i = 0; i < n; ++i)
          x[i] = 0;

        while (true) {
          while (!fifo.empty()) {
            int i = fifo.front();
            ASSERT_EQ(x[i % n], i / n);
            ++x[i % n];
            fifo.pop();
          }
          if (terminate > 1)
            break;
          if (terminate)
            ++terminate;
        }
        terminate = 0;
        for (int i = 0; i < n; ++i)
          ASSERT_EQ(x[i], size);
      }

      Checker(int _n = 1) : terminate(0), n(_n) {}
    };

    TEST(stress) {
      Thread<Checker<int>> c;
      for (int j = 0; j < 5; ++j) {
        c.start();
        for (int i = 0; i < size; ++i)
          c.fifo.push(i);
        c.terminate = true;
        c.join();
      }
    }
  };

#ifdef __divine__
  namespace {
    const int peers = 3;
  }
#else
  namespace {
    const int peers = 12;
  }
#endif

  struct Utils {

    struct DetectorWorker {
      StartDetector detector;
      int rep;

      DetectorWorker(StartDetector sh, int repeat)
          : detector(sh), rep(repeat) {}

      void main() {
        for (int i = 0; i < rep; ++i)
          detector.waitForAll(peers);
      }
    };

    void processDetector(int repeat) {
      StartDetector sh;
      ThreadSet<DetectorWorker> threads(peers, DetectorWorker{sh, repeat});

      timeout();

      for (int i = 0; i != 4; ++i) {
        threads.start();
        threads.join();
        ASSERT_EQ(sh._s->counter.load(), 0);
      }
    }

    TEST(startDetectorSimple) {
      processDetector(1);
    }

    TEST(startDetectorReentrant) {
      processDetector(4);
    }

    struct CounterWorker {
      StartDetector detector;
      ApproximateCounter counter;
      int produce;
      int consume;

      CounterWorker(StartDetector det, ApproximateCounter ctr)
          : detector(det), counter(ctr), produce(0), consume(0) {}

      void main() {
        detector.waitForAll(peers);

        while (produce--)
          ++counter;
        counter.sync();

        detector.waitForAll(peers);

        while (consume--)
          --counter;
        counter.sync();
      }
    };

    TEST(approximateCounter) {
      StartDetector det;
      ApproximateCounter ctr;

      ThreadSet<CounterWorker> threads(peers, CounterWorker{det, ctr});

      timeout();

      // set consume and produce limits to each worker
      int i = 1;
      for (auto& w : threads) {
        w.produce = i;
        // let last worker consume the rest of produced values
        w.consume = peers - i;
        if (w.consume == 0)
          w.consume = peers; // also initials
        ++i;
      }

      threads.start();
      threads.join();
      ASSERT_EQ(ctr._s->counter.load(), 0);
    }
  };

} // namespace t_shmem

} // namespace brick

#ifdef BRICK_BENCHMARK_REG

#ifdef BRICKS_HAVE_TBB
#include <tbb/concurrent_queue.h>
#endif

#include <brick-benchmark>
#include <random>

namespace brick_test {
namespace shmem {

  template <typename T>
  struct Naive {
    std::deque<T> q;
    std::mutex m;

    void push(T x) {
      std::lock_guard<std::mutex> __l(m);
      q.push_back(x);
    }

    void pop() {
      std::lock_guard<std::mutex> __l(m);
      q.pop_front();
    }

    T& front() {
      std::lock_guard<std::mutex> __l(m);
      return q.front();
    }

    bool empty() {
      std::lock_guard<std::mutex> __l(m);
      return q.empty();
    }
  };

  template <typename T, int size = 512>
  struct Ring {
    volatile int reader;
    T q[size];
    volatile int writer;

    void push(T x) {
      while ((writer + 1) % size == reader)
        ; // full; need to wait
      q[writer] = x;
      writer = (writer + 1) % size;
    }

    T& front() {
      return q[reader];
    }

    void pop() {
      reader = (reader + 1) % size;
    }

    bool empty() {
      return reader == writer;
    }

    Ring() : reader(0), writer(0) {}
  };

  template <typename T>
  struct Student {
    static const int width = 64;
    static const int size = 8;

    volatile int writer;
    T q[width * size];
    int reader;
    volatile int free_lines __attribute__((aligned(64)));

    void push(T x) {
      q[writer] = x;
      writer = (writer + 1) % (size * width);
      if (writer % size == 0) {
        __sync_fetch_and_sub(&free_lines, 1);
        // NOTE: (free_lines < 0) can happen!
        while (free_lines <= 0)
          ;
      }
    }

    T& front() {
      return q[reader];
    }

    void pop() {
      reader = (reader + 1) % (width * size);
      if (reader % size == 0) {
        __sync_fetch_and_add(&free_lines, 1);
      }
    }

    bool empty() {
      // NOTE: (free_lines > width) can happen!
      return free_lines >= width && reader == writer;
    }

    Student() : writer(0), reader(0), free_lines(width) {}
  };

  template <typename T>
  struct Linked {
    using element = T;
    struct Node {
      T value;
      Node* next;
    };

    Node* volatile reader;
    char _separation[128];
    Node* volatile writer;

    void push(T x) {
      Node* n = new Node;
      n->value = x;
      writer->next = n; // n->next = (Node *) writer;
      writer = n;
    }

    T& front() {
      return reader->value;
    }

    void pop() {
      Node volatile* n = reader;
      ASSERT(reader->next);
      reader = reader->next;
      delete n;
    }

    bool empty() {
      return reader == writer;
    }

    Linked() {
      reader = writer = new Node();
      reader->next = 0;
    }
  };

#ifdef BRICKS_HAVE_TBB

  template <typename T>
  struct LocklessQueue {
    tbb::concurrent_queue<T> q;
    using element = T;

    void push(T x) {
      q.push(x);
    }

    T pop() {
      T res;
      q.try_pop(res); /* does nothing to res on failure */
      return res;
    }

    bool empty() {
      return q.empty();
    }

    LocklessQueue() {}
  };

#endif

  template <typename Q>
  struct Shared {
    using T = typename Q::element;
    std::shared_ptr<Q> q;
    void push(T t) {
      q->push(t);
    }
    T pop() {
      return q->pop();
    }
    bool empty() {
      return q->empty();
    }
    void flush() {}
    Shared() : q(new Q()) {}
  };

  template <typename Q>
  struct InsertThread : Thread {
    Q* q;
    int items;
    std::mt19937 rand;
    std::uniform_int_distribution<> dist;

    InsertThread() {}

    void main() {
      ASSERT(q);
      for (int i = 0; i < items; ++i)
        q->push(rand());
    };
  };

  template <typename Q>
  struct WorkThread {
    Q q;
    std::atomic<bool>* stop;
    int items;
    int id, threads;

    WorkThread() {}

    void main() {
      int step = items / 10;
      for (int i = 1; i <= step; ++i)
        if (id == i % threads)
          q.push(i);
      while (!stop->load()) {
        while (!q.empty()) {
          int i = q.pop();
          if (!i)
            continue;
          if (i == items)
            stop->store(true);
          if (i + step <= items) {
            q.push(i + step);
            q.push(i + step + items);
          }
        }
        q.flush();
      }
    }
  };

  template <int size>
  struct padded {
    int i;
    char padding[size - sizeof(int)];
    operator int() {
      return i;
    }
    padded(int i) : i(i) {}
    padded() : i(0) {}
  };

  struct ShQueue : BenchmarkGroup {
    ShQueue() {
      x.type = Axis::Quantitative;
      x.name = "threads";
      x.min = 1;
      x.max = 16;
      x.step = 1;

      y.type = Axis::Qualitative;
      y.name = "type";
      y.min = 0;
      y.step = 1;
#ifdef BRICKS_HAVE_TBB
      y.max = 3;
#else
      y.max = 1;
#endif
      y._render = [](int i) {
        switch (i) {
        case 0:
          return "spinlock";
        case 1:
          return "lockless";
        case 2:
          return "chunked";
        case 3:
          return "hybrid";
        default:
          abort();
        }
      };
    }

    std::string describe() {
      return "category:shmem category:shqueue";
    }

    template <typename Q>
    void scale() {
      Q fifo;
      auto* t = new Thread<WorkThread<Q>>[p];
      std::atomic<bool> stop(false);

      for (int i = 0; i < p; ++i) {
        t[i].q = fifo;
        t[i].items = 1000;
        t[i].id = i;
        t[i].threads = p;
        t[i].stop = &stop;
      }

      for (int i = 0; i < p; ++i)
        t[i].start();

      for (int i = 0; i < p; ++i)
        t[i].join();
    }

    template <typename T>
    void param() {
      switch (q) {
      case 0:
        return scale<Shared<LockedQueue<T>>>();
      case 1:
        return scale<Chunked<LockedQueue, T>>();
#ifdef BRICKS_HAVE_TBB
      case 2:
        return scale<Shared<LocklessQueue<T>>>();
      case 3:
        return scale<Chunked<LocklessQueue, T>>();
#endif
      default:
        ASSERT_UNREACHABLE_F("bad q = %d", q);
      }
    }

    BENCHMARK(p_int) {
      param<int>();
    }
    BENCHMARK(p_intptr) {
      param<intptr_t>();
    }
    BENCHMARK(p_64b) {
      param<padded<64>>();
    }
  };

  struct FIFO : BenchmarkGroup {
    FIFO() {
      x.type = Axis::Disabled;
      /* x.name = "p";
      x.unit = "items";
      x.min = 8;
      x.max = 4096;
      x.log = true;
      x.step = 8; */

      y.type = Axis::Qualitative;
      y.name = "type";
      y.min = 0;
      y.step = 1;
      y.max = 4;
      y._render = [](int i) {
        switch (i) {
        case 0:
          return "mutex";
        case 1:
          return "spin";
        case 2:
          return "linked";
        case 3:
          return "ring";
        case 4:
          return "hybrid";
        case 5:
          return "student";
        default:
          ASSERT_UNREACHABLE_F("bad i = %d", i);
        }
      };
    }

    std::string describe() {
      return "category:shmem category:fifo";
    }

    template <typename Q>
    void length_() {
      Q fifo;
      InsertThread<Q> t;
      t.q = &fifo;
      t.items = 1024 * 1024;

      t.start();

      for (int i = 0; i < t.items; ++i) {
        while (fifo.empty())
          ;
        fifo.pop();
      }
      ASSERT(fifo.empty());
    }

    template <typename T>
    void param() {
      switch (q) {
      case 0:
        return length_<Naive<T>>();
      case 1:
        return length_<LockedQueue<T>>();
      case 2:
        return length_<Linked<T>>();
      case 3:
        return length_<Ring<T>>();
      case 4:
        return length_<Fifo<T>>();
      case 5:
        return length_<Student<T>>();
      default:
        ASSERT_UNREACHABLE_F("bad q = %d", q);
      }
    }

    BENCHMARK(p_char) {
      param<char>();
    }
    BENCHMARK(p_int) {
      param<int>();
    }
    BENCHMARK(p_intptr) {
      param<intptr_t>();
    }
    BENCHMARK(p_16b) {
      param<padded<16>>();
    }
    BENCHMARK(p_64b) {
      param<padded<64>>();
    }
  };

} // namespace shmem
} // namespace brick_test

#endif

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab
