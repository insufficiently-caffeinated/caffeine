// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * (c) 2006-2019 Petr Ročkai <code@fixp.eu>
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

#include "brick-trace.h"
#include <unistd.h>

#ifdef __divine__
#include <sys/fault.h>
#endif

/* This file provides an assortment of assertion macros which provide
 * additional information about the circumstances of assertion failures, for
 * instance ASSERT_EQ will print both the source code statement and the actual
 * values that unexpectedly compared inequal.
 *
 * The assertion failure mechanism is currently implemented as an exception,
 * with the intention to be catchable, if the user so desires. This can be used
 * to e.g. print additional context information relevant to the failure, as the
 * stack is being unwound.
 *
 * Additionally, this files provides a stub version of the TEST() macro, a real
 * version of which is implemented in brick-unittest. This allows unit test
 * suites to be included in header files along with the code that they test
 * (without the testcases being actually registered or instantiatied unless the
 * unit testsuite is being built). */

#ifndef TEST
#define TEST(n)         template< bool > void n()
#endif

#define BRICK_SHARP_FIRST(x, ...) #x
#define BRICK_ASSERT(t,l,...) ::brq::assert_ ## t ## _fn( BRICK_LOCATION( l ), __VA_ARGS__ )

#ifdef NDEBUG

#define ASSERT(...)      static_cast< decltype(__VA_ARGS__, void(0)) >(0)
#define ASSERT_PRED(...) static_cast< decltype(__VA_ARGS__, void(0)) >(0)
#define ASSERT_EQ(...)   static_cast< decltype(__VA_ARGS__, void(0)) >(0)
#define ASSERT_LEQ(...)  static_cast< decltype(__VA_ARGS__, void(0)) >(0)
#define ASSERT_LT(...)   static_cast< decltype(__VA_ARGS__, void(0)) >(0)
#define ASSERT_NEQ(...)  static_cast< decltype(__VA_ARGS__, void(0)) >(0)

#else

#define BRICK_ASSERT_BIN(op, inv, x, ...)                                       \
    BRICK_ASSERT( bin,                                                          \
                  #x " "  #op " " BRICK_SHARP_FIRST( __VA_ARGS__, ignored ),    \
                  []( const auto &a, const auto &b ) { return a op b; },        \
                  #op, #inv, x, __VA_ARGS__ )

#define ASSERT(...)     BRICK_ASSERT( bool, BRICK_SHARP_FIRST( __VA_ARGS__, ignored ), __VA_ARGS__ )
#define ASSERT_P(p, x)  BRICK_ASSERT( pred, #p "( " #x " )", x, p( x ) )
#define ASSERT_EQ(...)  BRICK_ASSERT_BIN( ==, !=, __VA_ARGS__ )
#define ASSERT_LT(...)  BRICK_ASSERT_BIN(  <, >=, __VA_ARGS__ )
#define ASSERT_LEQ(...) BRICK_ASSERT_BIN( <=, >,  __VA_ARGS__ )
#define ASSERT_NEQ(...) BRICK_ASSERT_BIN( !=, ==, __VA_ARGS__ )

#endif

/* you must #include <brick-string> to use UNREACHABLE_F */
#define UNREACHABLE(...)   BRICK_ASSERT( die, "", __VA_ARGS__ )
#define NOT_IMPLEMENTED()  BRICK_ASSERT( die, "", "missing implementation" )

#define BRICK_LOCATION(stmt) ::brq::trace_location{ __LINE__, __FILE__, stmt }

namespace brq
{
    struct assert_failed : string_builder
    {
        struct fail_ref
        {
            assert_failed &ref;
            explicit fail_ref( assert_failed &f ) : ref( f ) {}
        };

        template< typename X >
        friend inline auto operator<<( fail_ref f, const X &x )
            -> decltype( std::declval< string_builder & >() << x, f.ref )
        {
            f.ref << x;
            return f.ref;
        }

        assert_failed( const trace_location &l, const char *expected = "expected" )
        {
            std::string_view file( l._file );
            int slashes = 0;

            for ( auto c : file )
                if ( c == '/' )
                    ++ slashes;

            while ( slashes >= 3 )
            {
                file.remove_prefix( file.find( "/" ) + 1 );
                -- slashes;
            }

            if ( file != l._file )
                (*this) << ".../";
            (*this) << file << ": " << l.line;
            (*this) << ":\n  " << expected << " " << l.statement();
        }

#ifdef BRICKS_NOTHROW_ASSERTS
        assert_failed( assert_failed &&o )
        {
            ::write( 2, o.buffer(), o._offset );
            abort();
        }
#endif

        const char *what() const noexcept { return buffer(); }
    };

    [[noreturn]] static inline void assert_signal( assert_failed &err )
    {
#if defined(__divine__)
        if ( err.truncated() )
            __vm_cancel();
        __dios_fault( _VM_F_Assert, err.what() );
        __builtin_trap();
#else
        throw std::move( err );
#endif
    }

    template< typename X, typename... Y >
    void assert_bool_fn( const trace_location &l, const X &x, const Y & ... y  )
    {
        if ( x )
            return;
        assert_failed f( l );
        format_args< true >( " ", f, y... );
        assert_signal( f );
        trace_fn< true >( 4, l, "assert:", l._statement, y... );
    }

    template< typename... T >
    __attribute__((noreturn))
    void assert_die_fn( const trace_location &l, const T & ... args )
    {
        assert_failed f( l, "unreachable executed:" );
        format_args< true >( " ", f, args... );
        assert_signal( f );
    }

    template< typename Op, typename A, typename B, typename... T >
    void assert_bin_fn( const trace_location &l, Op op, std::string_view op_str, std::string_view inv,
                        const A &a, const B &b, const T & ... args )
    {
        bool pass;

        if constexpr ( std::is_integral_v< A > && std::is_integral_v< B > )
            pass = op( static_cast< std::common_type_t< A, B > >( a ),
                       static_cast< std::common_type_t< A, B > >( b ) );
        else
            pass = !!op( a, b );

        if ( !pass )
        {
            assert_failed f( l );
            f << "\n   but got " << a << " " << inv << " " << b << "\n";
            format_args< true >( " ", f, args... );
            assert_signal( f );
        }

        trace_fn< true >( 4, l, "assert:", l._statement, "[", a, op_str, b, "]", args... );
    }

    template< typename X >
    __boring void assert_pred_fn( const trace_location &l, X x, bool p )
    {
        if ( !p )
        {
            assert_failed f( l );
            f << "\n   but got x = " << x << "\n";
            assert_signal( f );
        }
    }
}

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab
