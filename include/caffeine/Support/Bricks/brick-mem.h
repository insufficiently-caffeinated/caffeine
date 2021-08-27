// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * (c) 2015 Petr Ročkai <code@fixp.eu>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#pragma once

#include <atomic>
#include <map>
#include <memory>
#include <set>
#include <tuple>
#include <vector>

#include <iomanip>
#include <iostream>

#define NVALGRIND 1
#ifndef NVALGRIND
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wold-style-cast"
#include <memcheck.h>
#pragma GCC diagnostic pop
#endif

#include "brick-bitlevel.h"
#include "brick-hash.h"
#include "brick-mmap.h"
#include "brick-ptr.h"
#include "brick-shmem.h"
#include "brick-string.h"
#include "brick-types.h"

namespace brick {

namespace mem {

  constexpr inline int align(int v, int a) {
    return (v % a) ? (v + a - (v % a)) : v;
  }

  struct Empty {
    operator int() const {
      return 0;
    }
    bool operator==(Empty) const {
      return true;
    }
    Empty(int = 0) {}
  };

  struct StatCounter {
    int64_t used = 0, held = 0;
    StatCounter& operator+=(const StatCounter& add) {
      used += add.used;
      held += add.held;
      return *this;
    }
  };

  struct StatItem {
    mutable StatCounter bytes, count;
    int64_t size;
    StatItem(int64_t s) : size(s) {}
    bool operator<(StatItem o) const {
      return size < o.size;
    }
  };

  struct Stats : std::set<StatItem> {
    StatItem total = StatItem(-1);
    const StatItem& operator[](int64_t s) {
      return *insert(s).first;
    }
  };

  struct DefaultPoolPointerRep {
#ifdef __divine__
    static const int slab_bits = 6, chunk_bits = 4, tag_bits = 1;
#else
    static const int slab_bits = 16, chunk_bits = 15, tag_bits = 1;
#endif
    uint16_t slab : slab_bits, chunk : chunk_bits;
    uint16_t tag : 1;
  };

  template <typename Self, typename Pointer>
  struct PoolMixin {
    Self& self() {
      return *static_cast<Self*>(this);
    }

    template <typename T>
    T* machinePointer(Pointer p, int off = 0) {
      return reinterpret_cast<T*>(self().dereference(p) + off);
    }

    auto& header(Pointer p) {
      return self().header(p.slab());
    }
    auto& header(int b) {
      ASSERT(self()._s);
      ASSERT_LEQ(b, Self::blockcount);
      ASSERT_LEQ(0, b);
      ASSERT(self()._s->block[b]);
      return *(self()._s->block[b]);
    }
  };

  template <typename _Rep>
  struct PoolPointer : brick::types::Comparable {
    using Rep = _Rep;
    using Raw = bitlevel::bitvec<8 * sizeof(Rep)>;
    using SlabT = decltype(Rep::slab);
    using ChunkT = decltype(Rep::chunk);
    using TagT = decltype(Rep::tag);

    static const int tag_bits = Rep::tag_bits;
    Rep _rep;

    auto slab() const {
      return _rep.slab;
    }
    auto chunk() const {
      return _rep.chunk;
    }
    auto tag() const {
      return _rep.tag;
    }

    void slab(SlabT s) {
      _rep.slab = s;
    }
    void chunk(ChunkT c) {
      _rep.chunk = c;
    }
    void tag(TagT t) {
      _rep.tag = t;
    }

    explicit PoolPointer(SlabT s = 0, ChunkT c = 0) noexcept {
      _rep.slab = s;
      _rep.chunk = c;
      _rep.tag = 0;
    }

    Raw raw() const {
      return bitlevel::bitcast<Raw>(_rep);
    }
    void raw(Raw r) {
      bitlevel::bitcast(r, _rep);
    }

    explicit operator bool() const {
      return slab();
    }
    bool operator!() const {
      return !slab();
    }
    bool operator<(PoolPointer o) const {
      return intptr() < o.intptr();
    }
    Raw intptr() const {
      return (Raw(slab()) << Rep::chunk_bits) | chunk();
    }
  };

  /*
   * A pool keeps track of memory in a compact, fast, thread-optimised fashion.
   * It is organised into slabs of chunks of a single size. The Pointer type
   * can be cheaply converted into an actual pointer or to the size of the
   * object it points to. Both pointers and their dereferences are stable (no
   * object moving happens). Freelists are inline and used in LIFO order, to
   * minimise cache turnaround. Excess free memory is linked into a global
   * freelist which is used when the thread-local lists and partial blocks run
   * out.
   *
   * A single item is limited to 2^24 bytes (16M). Total memory use is capped at
   * roughly 16T (more if you use big objects), but can be easily extended. If
   * compiled in debug mode, (without -DNVALGRIND), destroying a pool will give
   * you some usage statistics. During runtime, valgrind will be kept up to date
   * about memory use and accessibility.
   *
   * The pointers are always 3 pieces, the slab, the chunk and the tag. The
   * layout is customisable (so that the tag bits, which are reserved for the
   * Pool's clients, can be positioned as needed within the pointer).
   */
  template <typename PointerRep = DefaultPoolPointerRep>
  struct Pool : PoolMixin<Pool<PointerRep>, PoolPointer<PointerRep>> {
    static const int slab_bits = PointerRep::slab_bits,
                     chunk_bits = PointerRep::chunk_bits;

    using Self = Pool<PointerRep>;
    using Pointer = PoolPointer<PointerRep>;

    using PoolMixin<Self, Pointer>::header;

    struct BlockHeader {
      uint64_t total : 20;
      uint64_t allocated : 20;
      uint64_t itemsize : 24;
      char data[0];
    };

    struct FreeList {
      Pointer head;
      FreeList* next;
      int32_t count;
      FreeList() : next(nullptr), count(0) {}
    };

    struct SizeInfo {
      int active, blocksize;
      FreeList touse, tofree;
      int perm_active, perm_blocksize;
      SizeInfo() : active(-1), blocksize(4096), perm_active(-1) {}
      ~SizeInfo() {}
    };

    static void nukeList(FreeList* f) {
      while (f) {
        auto d = f;
        f = f->next;
        delete d;
      }
    }

    static constexpr int blockcount = 1 << slab_bits;
    static constexpr int blocksize = 4 << chunk_bits;

    using FreeListPtr = std::atomic<FreeList*>;

    struct VHandle {
      std::atomic<int> handle;
      std::atomic<bool> allocated;
      VHandle() : handle(-1), allocated(false) {}
    };

    struct Shared : brq::refcount_base<uint16_t, true> {
      BlockHeader* block[blockcount];
      std::atomic<int> usedblocks;
      FreeListPtr _freelist[4096];
      std::atomic<FreeListPtr*> _freelist_big[4096];
#ifndef NVALGRIND
      std::atomic<VHandle*> vhandles[blockcount]; /* one for each block */
#endif

      void freelist_return(int size, const FreeList& fl) {
        if (!fl.count)
          return;
        std::atomic<FreeList*>& fhead = freelist(size);
        auto newfl = new FreeList(fl);
        newfl->next = fhead;
        while (!fhead.compare_exchange_weak(newfl->next, newfl))
          ;
      }

      std::atomic<FreeList*>& freelist(int size) {
        if (size < 4096)
          return _freelist[size];

        std::atomic<FreeList*>*chunk, *newchunk;
        if (!(chunk = _freelist_big[size / 4096])) {
          if (_freelist_big[size / 4096].compare_exchange_strong(
                  chunk, newchunk = new FreeListPtr[4096]()))
            chunk = newchunk;
          else
            delete newchunk;
        }
        ASSERT(chunk);
        return chunk[size % 4096];
      }

#ifndef NVALGRIND

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wold-style-cast"

      void valgrind_alloc(Pointer p, const char* mem, int size) {
        VALGRIND_MALLOCLIKE_BLOCK(mem, size, 0, 1);
        ASSERT_LT(p.slab(), blockcount);
        ASSERT_LT(p.chunk(), block[p.slab()]->total);

        VHandle *h = vhandles[p.slab()], *alloc;
        if (!h) {
          if (vhandles[p.slab()].compare_exchange_strong(
                  h, alloc = new VHandle[block[p.slab()]->total]))
            h = alloc;
          else
            delete[] alloc;
        }

        ASSERT(h);
        ASSERT(!h[p.chunk()].allocated);
        VALGRIND_DISCARD(h[p.chunk()].handle);
        h[p.chunk()].handle = VALGRIND_CREATE_BLOCK(
            mem, size,
            brq::format("blob ", p.slab(), p.chunk(), " @ ",
                        static_cast<const void*>(mem))
                .buffer());
        h[p.chunk()].allocated = true;
      }

      void valgrind_dealloc(Pointer p, const char* mem, int size) {
        VALGRIND_FREELIKE_BLOCK(mem, 0);
        VALGRIND_MAKE_MEM_NOACCESS(mem, size);

        ASSERT(vhandles[p.slab()].load());
        ASSERT(vhandles[p.slab()][p.chunk()].allocated);

        VALGRIND_DISCARD(vhandles[p.slab()][p.chunk()].handle);
        vhandles[p.slab()][p.chunk()].handle = VALGRIND_CREATE_BLOCK(
            mem, size,
            brq::format("blob ", p.slab(), p.chunk(), " @ ",
                        static_cast<const void*>(mem))
                .buffer());
        vhandles[p.slab()][p.chunk()].allocated = false;
      }

      void valgrind_newblock(int b, int bytes) {
        VALGRIND_MAKE_MEM_NOACCESS(block[b] + sizeof(BlockHeader), bytes);
        VALGRIND_CREATE_MEMPOOL(block[b], 0, 0);
      }

      void valgrind_init() {
        for (int i = 0; i < blockcount; ++i)
          vhandles[i] = nullptr;
      }

      void valgrind_fini() {
        for (int i = 0; i < usedblocks; ++i) {
          if (vhandles[i])
            delete[] vhandles[i].load();
          if (block[i])
            VALGRIND_DESTROY_MEMPOOL(block[i]);
        }
      }
#pragma GCC diagnostic pop
#else
      void valgrind_alloc(Pointer, const char*, int) {}
      void valgrind_dealloc(Pointer, const char*, int) {}
      void valgrind_newblock(int, int) {}
      void valgrind_fini() {}
      void valgrind_init() {}
#endif

      ~Shared() {
        finalize(this);
      }
    };

    struct Local {
      std::vector<int> emptyblocks;
      SizeInfo* size;
      SizeInfo** size_big;
      //        int ephemeral_block;
      //        int ephemeral_offset;
    } _l;

    brq::refcount_ptr<Shared> _s;

#ifdef NVALGRIND

#define VALGRIND_MAKE_MEM_DEFINED(x, y)
#define VALGRIND_MAKE_MEM_NOACCESS(x, y)
#define VALGRIND_MAKE_MEM_UNDEFINED(x, y)

#endif

    int freelist_count(FreeList* fl) {
      return fl ? fl->count + freelist_count(fl->next) : 0;
    }

    Stats stats() {
      Stats s;

      for (int i = 0; i < _s->usedblocks; ++i)
        if (_s->block[i]) {
          int64_t is = header(i).itemsize;
          s[is].count.used += header(i).allocated;
          s[is].count.held += header(i).total;
        }

      for (auto& i : s)
        i.count.used -= freelist_count(_s->freelist(i.size).load());

      for (auto& i : s)
        i.bytes.used = i.count.used * i.size,
        i.bytes.held = i.count.held * align(i.size, sizeof(Pointer));

      for (auto& i : s)
        s.total.bytes += i.bytes, s.total.count += i.count;

      return s;
    }

    static void finalize(Shared* s) {
      s->valgrind_fini();

      for (int i = 0; i < 4096; ++i) {
        nukeList(s->_freelist[i]);
        if (s->_freelist_big[i]) {
          for (int j = 0; j < 4096; ++j)
            nukeList(s->_freelist_big[i][j]);
          delete[] s->_freelist_big[i].load();
        }
      }

      for (int i = 0; i < blockcount; ++i) {
        if (!s->block[i])
          continue;
        auto size = s->block[i]->total
                        ? s->block[i]->total * align(s->block[i]->itemsize,
                                                     sizeof(Pointer)) +
                              sizeof(BlockHeader)
                        : blocksize;
        brick::mmap::MMap::drop(s->block[i], size);
      }
    }

    /*
     * NB. We set usedblocks to 8, so that we both keep reasonable alignment
     * and make (0, 0) Pointer invalid; this may change in the future, when
     * Extensions, which tend to contain Pointers, are no longer zeroed, but
     * constructed instead (as they should)
     */
    Pool() : _s(new Shared()) {
      _s->usedblocks = 8;
      for (int i = 0; i < 4096; ++i)
        _s->_freelist[i] = nullptr;
      for (int i = 0; i < 4096; ++i)
        _s->_freelist_big[i] = nullptr;
      for (int i = 0; i < blockcount; ++i)
        _s->block[i] = nullptr;
      _s->valgrind_init();
      initL();
    }

    void sync() {
      for (int i = 0; i < 4096; ++i) {
        auto& si = _l.size[i];
        _s->freelist_return(i, si.tofree);
        _s->freelist_return(i, si.touse);
        si.tofree = FreeList();
        si.touse = FreeList();

        if (_l.size_big[i])
          for (int j = 0; j < 4096; ++j) {
            auto& si = _l.size_big[i][j];
            _s->freelist_return(i * 4096 + j, si.tofree);
            _s->freelist_return(i * 4096 + j, si.touse);
            si.tofree = FreeList();
            si.touse = FreeList();
          }
      }
    }

    ~Pool() {
      sync();
      for (int i = 0; i < 4096; ++i)
        delete[] _l.size_big[i];
      delete[] _l.size_big;
      delete[] _l.size;

      /* shared state is destroyed in finalize() */
    }

    Pool(const Pool& o) : _s(o._s) {
      initL();
    }
    Pool& operator=(const Pool& o) {
      if (_s != o._s) {
        _s = o._s;
        initL();
      }
      return *this;
    }

    void initL() {
      _l.size = new SizeInfo[4096];
      _l.size_big = new SizeInfo*[4096];
      for (int i = 0; i < 4096; ++i)
        _l.size_big[i] = nullptr;
      _l.size[0].blocksize = blocksize;
      _l.emptyblocks.clear();
    }

    int& ephemeralSize(Pointer p) {
      return *reinterpret_cast<int*>(dereference(p) - sizeof(int));
    }

#if 0
    Pointer ephemeralAllocate( int sz )
    {
        /* TODO valgrind */
        ASSERT_LEQ( 0, _l.ephemeral_block );
        ASSERT_LEQ( _l.ephemeral_offset + sz, blocksize );
        Pointer p( _l.ephemeral_block, _l.ephemeral_offset + sizeof( int ) );
        _l.ephemeral_offset += align( sz, 4 ) + sizeof( int );
        ephemeralSize( p ) = sz;
        return p;
    }

    void ephemeralClear()
    {
        /* TODO valgrind */
        _l.ephemeral_offset = 0;
    }
#endif

    bool valid(Pointer p) {
      return p.slab();
    }

    int size(Pointer p) {
#if 0
        if( int( p.slab() ) == _l.ephemeral_block )
        {
            ASSERT_LEQ( p.chunk(), _l.ephemeral_offset );
            return ephemeralSize( p );
        }
#endif

      ASSERT(header(p).total > 0 &&
             "invalid size() call on a foreign ephemeral block");
      ASSERT(header(p).itemsize);
      return header(p).itemsize;
    }

    Pointer& freechunk(Pointer p) {
      return *reinterpret_cast<Pointer*>(dereference(p));
    }

    Pointer fromFreelist(SizeInfo& si) {
      ASSERT(si.touse.count);
      ASSERT(valid(si.touse.head));
      --si.touse.count;
      Pointer p = si.touse.head;
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wold-style-cast"
      VALGRIND_MAKE_MEM_DEFINED(dereference(p), sizeof(Pointer));
      si.touse.head = freechunk(p);
      VALGRIND_MAKE_MEM_NOACCESS(dereference(p), sizeof(Pointer));
#pragma GCC diagnostic pop
      return p;
    }

    Pointer allocate(int size) {
      ASSERT(size);
      Pointer p;
      bool clear = false;

      auto& si = sizeinfo(size);
      /* try our private freelist first */

      if (!si.touse.count && si.tofree.count) {
        si.touse = si.tofree;
        si.tofree = FreeList();
      }

      if (si.touse.count) {
        p = fromFreelist(si);
        clear = true;
      } else { /* nope. try a partially filled block */
        if (si.active >= 0 && usable(si.active)) {
          p.slab(si.active);
          p.chunk(header(p).allocated++);
        } else { /* still nothing. try nicking something from the shared
                    freelist */
          std::atomic<FreeList*>& fhead = _s->freelist(size);
          FreeList* fb = fhead;
          while (fb && !fhead.compare_exchange_weak(fb, fb->next))
            ;
          if (fb) {
            si.touse = *fb;
            si.touse.next = nullptr;
            delete fb;
            p = fromFreelist(si);
            clear = true;
          } else { /* give up and allocate a fresh block */
            p.slab(newblock(size));
            p.chunk(header(p).allocated++);
          }
        }
      }

      _s->valgrind_alloc(p, dereference(p), size);
      if (clear)
        ::memset(dereference(p), 0, size);
      TRACE(_s, "allocated", p, "size =", size, "clear =", clear);
      return p;
    }

    void free(Pointer p) {
      if (!valid(p))
        return;

      TRACE(_s, "free", p);
      ASSERT(header(p).total > 0 && "trying to free ephemeral block");

      _s->valgrind_dealloc(p, dereference(p), size(p));

      auto& si = sizeinfo(size(p));
      FreeList* fl = si.touse.count < 4096 ? &si.touse : &si.tofree;
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wold-style-cast"
      VALGRIND_MAKE_MEM_UNDEFINED(dereference(p), sizeof(Pointer));
#pragma GCC diagnostic pop
      freechunk(p) = fl->head;
      fl->head = p;
      ++fl->count;

      /* if there's a lot on our freelists, give some to the pool */
      if (fl == &si.tofree && fl->count >= 4096) {
        _s->freelist_return(size(p), si.tofree);
        si.tofree = FreeList();
      }
    }

    char* dereference(Pointer p) {
      auto& h = header(p);
      return h.data + p.chunk() * align(h.itemsize, sizeof(Pointer));
    }

    bool usable(int b) {
      return _s->block[b] && header(b).allocated < header(b).total;
    }

    SizeInfo& sizeinfo(int index) {
      if (index < 4096)
        return _l.size[index];
      if (!_l.size_big[index / 4096])
        _l.size_big[index / 4096] = new SizeInfo[4096];
      return _l.size_big[index / 4096][index % 4096];
    }

    int newblock(int size) {
      int b = 0;

      if (_l.emptyblocks.empty()) {
        b = _s->usedblocks.fetch_add(16);
        for (int i = b + 1; i < b + 16; ++i)
          _l.emptyblocks.push_back(i);
      } else {
        b = _l.emptyblocks.back();
        _l.emptyblocks.pop_back();
      }

      auto& si = sizeinfo(size);

      const int overhead = sizeof(BlockHeader);
      const int allocsize = align(size, sizeof(Pointer));
      si.blocksize = std::max(allocsize + overhead, si.blocksize);
      const int total = allocsize ? (si.blocksize - overhead) / allocsize : 0;
      const int allocate = allocsize ? overhead + total * allocsize : blocksize;

      auto mem = brick::mmap::MMap::alloc(allocate);
      _s->block[b] = static_cast<BlockHeader*>(mem);
      header(b).itemsize = size;
      header(b).total = total;
      header(b).allocated = 0;
      _s->valgrind_newblock(b, total);
      si.blocksize = std::min(4 * si.blocksize, int(blocksize));
      return si.active = b;
    }
  };

  template <typename Master_>
  struct SlavePool : PoolMixin<SlavePool<Master_>, typename Master_::Pointer> {
    using Master = Master_;
    static constexpr int blockcount = Master::blockcount;

    struct BlockHeader {
      uint32_t itemsize;
      char data[0];
    };

    struct Shared : brq::refcount_base<uint16_t, true> {
      BlockHeader* block[blockcount];
    };

    brq::refcount_ptr<Shared> _s;
    brq::refcount_ptr<typename Master::Shared> _m;

    using Pointer = typename Master::Pointer;

    explicit SlavePool(const Master& m) : _s(new Shared()), _m(m._s) {
      for (int i = 0; i < blockcount; ++i)
        _s->block[i] = nullptr;
    }

    SlavePool() = default;

    void attach(const Master& m) {
      if (_m != m._s) {
        _s.reset(new Shared());
        _m = m._s;
      }
    }

    void materialise(Pointer p, int size, bool clear = true) {
      int b = p.slab();
      if (!_s->block[b]) {
        auto mb = _m->block[p.slab()];
        const int overhead = sizeof(BlockHeader);
        const int allocsize = size > 1 ? align(size, 4) : 1;
        const int allocate = overhead + mb->total * allocsize;
        auto mem = brick::mmap::MMap::alloc(allocate);
        _s->block[b] = static_cast<BlockHeader*>(mem);
        this->header(b).itemsize = size;
      }
      if (clear)
        ::memset(this->dereference(p), 0, size);
    }

    char* dereference(Pointer p) {
      auto& h = this->header(p);
      return h.data +
             p.chunk() * (h.itemsize > 1 ? align(h.itemsize, 4) : h.itemsize);
    }
  };

  template <typename Master, typename T = uint16_t, bool atomic = false>
  struct RefPool : SlavePool<Master> {
    using Pointer = typename Master::Pointer;
    using SlavePool<Master>::SlavePool;
    using counter = std::conditional_t<atomic, std::atomic<T>, T>;

    counter& count(Pointer p) {
      this->materialise(p, sizeof(counter), false);
      return *this->template machinePointer<counter>(p);
    }

    void get(Pointer p) {
      if (p.slab() && count(p) < std::numeric_limits<T>::max())
        count(p)++;
    }

    static bool _no_cb(Pointer, T) {
      return true;
    }

    template <typename F = decltype(_no_cb)>
    void put(Pointer p, F cb = _no_cb) {
      if (!p.slab())
        return;

      if (count(p) == std::numeric_limits<T>::max())
        return; /* counter saturation makes the object immortal */

      ASSERT_LEQ(1, count(p));
      auto rc = --count(p);

      if (!cb(p, rc))
        return;

      if (!rc) /* TODO refactor */
      {
        TRACE(this->_m, "refcount for", p, "dropped to 0");
        typename Master::FreeList fl;
        fl.count = 1;
        fl.head = p;
        auto block = this->_m->block[p.slab()];
        int sz = block->itemsize;
        const char* mem =
            block->data + p.chunk() * (sz > 1 ? align(sz, 4) : sz);
        this->_m->valgrind_dealloc(p, mem, sz);
        this->_m->freelist_return(sz, fl);
      }
    }
  };

  /* An object which holds a reference to a pool object (preventing the object
   * from being freed). Basically the pool equivalent of a reference-counting
   * pointer (like std::shared_ptr or brq::refcount_ptr). Works in tandem with
   * RefPool. */

  template <typename Master, typename T = uint16_t>
  struct RefCnt {
    using Pointer = typename Master::Pointer;

    RefPool<Master, T> _pool;
    Pointer _ptr;

    void get() {
      _pool.get(_ptr);
    }
    void put() {
      _pool.put(_ptr);
    }
    T count() {
      return _pool.count(_ptr);
    }

    RefCnt() {}
    RefCnt(RefPool<Master, T>& s, Pointer p) : _pool(s), _ptr(p) {
      get();
    }
    RefCnt(const RefCnt& o) : _pool(o._pool), _ptr(o._ptr) {
      get();
    }

    RefCnt& operator=(const RefCnt& r) {
      if (&r == this)
        return *this;

      put();
      _pool = r._pool;
      _ptr = r._ptr;
      get();
      return *this;
    }

    ~RefCnt() {
      put();
    }
  };

  template <typename stream, typename P>
  static inline auto operator<<(stream& o, P p) -> decltype(p.slab(), o << "") {
    return o << p.slab() << ":" << p.chunk() << " 0x" << std::hex << p.tag()
             << std::dec;
  }

} // namespace mem

namespace t_mem {

  template <typename Rep>
  struct Pool {
    using _Pool = mem::Pool<Rep>;

    struct Checker {
      char padding[128];
      _Pool m_pool;
      std::deque<typename _Pool::Pointer> ptrs;
      int limit;
      unsigned seedp;
      int terminate;
      char padding2[128];

      _Pool& pool() {
        return m_pool;
      }

      bool decide(int i) {
        int j = rand() % limit;
        if (i + j > limit)
          return false;
        return true;
      }

      void main() {
        limit = 32 * 1024;
#ifdef __divine__
        limit = 16;
#endif
        int state = 0;

        for (int i = 0; i < limit; ++i) {
          ASSERT(state >= 0);
          if (decide(i) || ptrs.empty()) {
            ++state;
            ptrs.push_back(pool().allocate(32));
          } else {
            --state;
            pool().free(ptrs.front());
            ptrs.pop_front();
          }
        }

        while (!ptrs.empty()) {
          pool().free(ptrs.front());
          ptrs.pop_front();
        }
      }

      Checker() : terminate(0) {}
    };

    TEST(align) {
      ASSERT_EQ(mem::align(2, 4), 4);
      ASSERT_EQ(mem::align(3, 4), 4);
      ASSERT_EQ(mem::align(5, 4), 8);
      ASSERT_EQ(mem::align(0, 4), 0);
    }

    TEST(sequential) {
      Checker c;
      c.main();
    }

    TEST(materialise) {
      int limit = 100;
#ifdef __divine__
      limit = 10;
#endif
      _Pool a;
      mem::SlavePool<_Pool> b(a);
      typename _Pool::Pointer p[limit];
      for (int i = 0; i < limit; ++i) {
        p[i] = a.allocate(8);
        *a.template machinePointer<int>(p[i]) = i;
        b.materialise(p[i], 4);
        *b.template machinePointer<int>(p[i]) = i;
      }
      for (int i = 0; i < limit; ++i) {
        ASSERT_EQ(*a.template machinePointer<int>(p[i]), i);
        ASSERT_EQ(*b.template machinePointer<int>(p[i]), i);
      }
    }

    TEST(refcnt) {
      using RP = mem::RefPool<_Pool>;

      _Pool pool;
      RP refpool(pool);

      auto p = pool.allocate(10);
      {
        mem::RefCnt<_Pool> ref(refpool, p);
        ASSERT_EQ(ref.count(), 1);
        {
          auto ref2 = ref;
          ASSERT_EQ(ref.count(), 2);
        }
        ASSERT_EQ(ref.count(), 1);
        ASSERT_EQ(pool.stats().total.bytes.used, 10);
      }
      ASSERT_EQ(pool.stats().total.bytes.used, 0);
    }

    TEST(parallel) {
      shmem::ThreadSet<Checker> c;
      Checker x;
#ifdef __divine__
      int tc = 2, repeat = 2;
#else
      int tc = 3, repeat = 5;
#endif

      for (int i = 0; i < tc; ++i)
        c.emplace_back(x);
      for (int j = 0; j < repeat; ++j) {
        c.start();
        c.join();
      }
    }
  };

  struct R1 {
    static const int slab_bits = 16, chunk_bits = 16, tag_bits = 32;
    uint16_t slab;
    uint16_t chunk;
    uint32_t tag;
  };
  struct R2 {
    static const int slab_bits = 8, chunk_bits = 16, tag_bits = 8;
    uint16_t slab : slab_bits, tag : tag_bits, chunk;
  };

  template struct Pool<R1>;
  template struct Pool<R2>;

} // namespace t_mem

} // namespace brick

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab
