// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * (c) 2018 Henrich Lauko
 * (c) 2014-2018 Vladimír Štill
 * (c) 2014, 2015 Petr Ročkai
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

#ifdef BRICKS_HAVE_LLVM

#ifndef __STDC_LIMIT_MACROS
#define __STDC_LIMIT_MACROS
#endif
#ifndef __STDC_CONSTANT_MACROS
#define __STDC_CONSTANT_MACROS
#endif

#ifdef DIVINE_RELAX_WARNINGS
DIVINE_RELAX_WARNINGS
#endif

#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/IR/CallSite.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Intrinsics.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Object/IRObjectFile.h>
#include <llvm/Support/Error.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/raw_os_ostream.h>
#include <llvm/Support/raw_ostream.h>

#ifdef DIVINE_RELAX_WARNINGS
DIVINE_UNRELAX_WARNINGS
#endif

#include <memory>

#include "brick-assert.h"
#include "brick-fs.h"
#include "brick-string.h"
#include "brick-types.h"

namespace brick::llvm {

#if __cplusplus >= 201703L

template <typename T>
using get_operand_t =
    decltype(std::declval<T&>().getOperand(std::declval<int>()));

template <typename Value>
struct LLVMTransformer {
  using value_type =
      typename std::conditional<std::is_pointer_v<Value>, Value, Value*>::type;

  constexpr LLVMTransformer(const value_type& val) : state(val) {}
  constexpr LLVMTransformer(value_type&& val) : state(std::move(val)) {}

  template <typename F>
  constexpr decltype(auto) apply(F f) noexcept {
    using R = decltype(f(state));
    if (state)
      return LLVMTransformer<R>(f(state));
    else
      return LLVMTransformer<R>(nullptr);
  }

  constexpr decltype(auto) operand(size_t idx) noexcept {
    if constexpr (brick::types::is_detected_v<get_operand_t,
                                              std::remove_pointer_t<Value>>) {
      return apply([idx](const auto& v) { return v->getOperand(idx); });
    } else {
      return LLVMTransformer<value_type>(nullptr);
    }
  }

  template <typename T>
  constexpr decltype(auto) cast() noexcept {
    return apply([](const auto& v) { return ::llvm::dyn_cast<T>(v); });
  }

  constexpr value_type freeze() noexcept {
    return state;
  }

private:
  value_type state;
};

template <typename T>
decltype(auto) transformer(T val) {
  return LLVMTransformer<T>(val);
}

#endif // c++17

struct Annotation : brick::types::Eq {
  Annotation() = default;
  explicit Annotation(const std::string& anno) {
    size_t oldoff = 0, off = 0;
    do {
      off = anno.find('.', oldoff);
      _parts.emplace_back(anno.substr(oldoff, off - oldoff));
      oldoff = off + 1;
    } while (off != std::string::npos);
  }
  template <typename It>
  Annotation(It begin, It end) : _parts(begin, end) {}

  std::string name() const {
    return _parts.back();
  }
  Annotation ns() const {
    return Annotation(_parts.begin(), _parts.end() - 1);
  }
  std::string toString() const {
    brq::string_builder ss;
    for (auto& n : _parts)
      ss << n << ".";
    return std::string(ss.data(), 0, ss.data().size() - 1);
  }

  bool inNamespace(Annotation ns) const {
    return ns._parts.size() < _parts.size() &&
           std::equal(ns._parts.begin(), ns._parts.end(), _parts.begin());
  }

  Annotation dropNamespace(Annotation ns) const {
    return inNamespace(ns)
               ? Annotation(_parts.begin() + ns.size(), _parts.end())
               : *this;
  }

  size_t size() const {
    return _parts.size();
  }

  bool operator==(const Annotation& o) const {
    return o.size() == size() &&
           std::equal(_parts.begin(), _parts.end(), o._parts.begin());
  }

private:
  std::vector<std::string> _parts;
};

template <typename Value, typename Yield>
void enumerateAnnos(::llvm::Module& m, Yield&& yield) {
  using ConstantArray = ::llvm::ConstantArray;
  const auto annos = m.getNamedGlobal("llvm.global.annotations");
  if (auto arr = transformer(annos).operand(0).cast<ConstantArray>().freeze()) {
    for (const auto& op : arr->operands()) {
      auto cs = transformer(op.get()).cast<::llvm::ConstantStruct>();
      if (auto val = cs.operand(0).operand(0).cast<Value>().freeze()) {
        auto anno = cs.operand(1)
                        .operand(0)
                        .cast<::llvm::GlobalVariable>()
                        .operand(0)
                        .cast<::llvm::ConstantDataArray>()
                        .freeze();
        yield(val, Annotation(anno->getAsCString()));
      }
    }
  }
}

template <typename Value, typename Yield>
void enumerateAnnosInNs(Annotation ns, ::llvm::Module& m, Yield&& yield) {
  enumerateAnnos<Value>(m, [&](const auto& val, Annotation anno) {
    if (anno.inNamespace(ns))
      yield(val, anno.dropNamespace(ns));
  });
}

template <typename Value, typename Yield>
void enumerateAnnosInNs(const std::string& ns, ::llvm::Module& m,
                        Yield&& yield) {
  enumerateAnnosInNs<Value>(Annotation(ns), m, std::forward<Yield>(yield));
}

template <typename Value, typename Yield>
void enumerateForAnno(Annotation anno, ::llvm::Module& m, Yield&& yield) {
  enumerateAnnos<Value>(m, [&](const auto& val, Annotation ann) {
    if (ann == anno)
      yield(val);
  });
}

template <typename Value, typename Yield>
void enumerateForAnno(const std::string& anno, ::llvm::Module& m,
                      Yield&& yield) {
  enumerateForAnno<Value>(Annotation(anno), m, std::forward<Yield>(yield));
}

template <typename Yield>
void enumerateFunctionsForAnno(const std::string& anno, ::llvm::Module& m,
                               Yield&& yield) {
  enumerateForAnno<::llvm::Function>(anno, m, std::forward<Yield>(yield));
}

template <typename Yield>
void enumerateFunctionAnnos(::llvm::Module& m, Yield&& yield) {
  enumerateAnnos<::llvm::Function>(m, std::forward<Yield>(yield));
}

template <typename Yield>
void enumerateFunctionAnnosInNs(const std::string& ns, ::llvm::Module& m,
                                Yield&& yield) {
  enumerateAnnosInNs<::llvm::Function>(ns, m, std::forward<Yield>(yield));
}

template <typename Yield>
void enumerateFunctionsForAttribute(const std::string& attr, ::llvm::Module& m,
                                    Yield&& yield) {
  for (auto& fn : m)
    if (fn.hasFnAttribute(attr))
      yield(fn);
}

inline void verifyModule(::llvm::Module* module) {
  std::string err;
  ::llvm::raw_string_ostream serr(err);
  if (::llvm::verifyModule(*module, &serr)) {
    throw std::runtime_error("Invalid bitcode: " + serr.str());
  }
}

static void _throwLLVMError(std::error_code ec) {
  throw std::runtime_error("LLVM Error: " + ec.message());
}

static void _throwLLVMError(::llvm::Error& e) {
  throw std::runtime_error("LLVM Error: " + toString(std::move(e)));
}

static void _throwLLVMError(::llvm::Error&& e) {
  throw std::runtime_error("LLVM Error: " + toString(std::move(e)));
}

inline void writeModule(::llvm::Module* m, std::string out) {
  verifyModule(*m);
  std::error_code serr;
  brq::create_file(out);
  ::llvm::raw_fd_ostream fs(out.c_str(), serr, ::llvm::sys::fs::F_None);
  if (serr)
    _throwLLVMError(serr);
  WriteBitcodeToFile(*m, fs);
}

inline std::unique_ptr<::llvm::Module> load_bc(const std::string& str,
                                               ::llvm::LLVMContext* ctx) {
  std::unique_ptr<::llvm::MemoryBuffer> input =
      std::move(::llvm::MemoryBuffer::getFile(str).get());
  auto bc_input = ::llvm::object::IRObjectFile::findBitcodeInMemBuffer(
      input->getMemBufferRef());

  if (!bc_input)
    UNREACHABLE("Could not load bitcode file");
  auto module = ::llvm::parseBitcodeFile(bc_input.get(), *ctx);

  if (!module)
    UNREACHABLE("Error parsing input model; probably not a valid bc file.");

  return std::move(module.get());
}

inline std::string getModuleBytes(::llvm::Module* m) {
  std::string s;
  verifyModule(*m);
  {
    ::llvm::raw_string_ostream fs(s);
    WriteBitcodeToFile(*m, fs);
  }
  return s;
}

inline int intrinsic_id(::llvm::Value* v) {
  auto insn = ::llvm::dyn_cast<::llvm::Instruction>(v);
  if (!insn || insn->getOpcode() != ::llvm::Instruction::Call)
    return ::llvm::Intrinsic::not_intrinsic;
  ::llvm::CallSite CS(insn);
  auto f = CS.getCalledFunction();
  if (!f)
    return ::llvm::Intrinsic::not_intrinsic;
  return f->getIntrinsicID();
}

} // namespace brick::llvm

namespace llvm {
template <typename stream, typename T>
auto operator<<(stream& o, const T& v)
    -> std::enable_if_t<!std::is_convertible_v<stream&, raw_ostream&>,
                        decltype(v.print(std::declval<raw_ostream&>()),
                                 o << "")> {
  std::string s;
  raw_string_ostream lstream(s);
  lstream << v;
  return o << lstream.str();
}
} // namespace llvm

#endif // BRICKS_HAVE_LLVM

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab ft=cpp
