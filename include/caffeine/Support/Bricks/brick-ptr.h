// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * (c) 2019 Petr Ročkai <code@fixp.eu>
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

#include "brick-assert.h"
#include <atomic>

namespace brq
{
    template< typename T, bool atomic = false >
    struct refcount_ptr
    {
        refcount_ptr() noexcept = default;
        refcount_ptr( const refcount_ptr< T, atomic > &o ) noexcept : refcount_ptr( o._ptr ) {}
        refcount_ptr( T *v ) noexcept : _ptr( v ) { _get(); }
        template< typename D, typename = std::enable_if_t< std::is_convertible_v< D *, T * > > >
        refcount_ptr( const refcount_ptr< D > &o ) noexcept : refcount_ptr( o._ptr ) {}
        ~refcount_ptr() noexcept { _put(); }
        T *operator->() const noexcept { return _ptr; }
        T &operator*() const noexcept { return *_ptr; }

        explicit operator bool() const noexcept { return ptr(); }
        bool operator !() const noexcept { return !ptr(); }

        bool operator==( const refcount_ptr &o ) const noexcept
        {
            return !( *this < o ) && !( o < *this );
        }

        bool operator!=( const refcount_ptr &o ) const noexcept
        {
            return *this < o || o < *this;
        }

        bool operator<( const refcount_ptr &o ) const noexcept
        {
            return std::less< const void * >()( ptr(), o.ptr() );
        }

        template< bool o_atomic >
        refcount_ptr< T, atomic > &operator=( const refcount_ptr< T, o_atomic > &o ) noexcept
        {
            if constexpr ( o_atomic == atomic ) /* atomic and !atomic can't alias each other */
                if ( &o == this )
                    return *this;

            _put();
            ptr( o.ptr() );
            _get();
            return *this;
        }

        refcount_ptr< T, atomic > &operator=( const refcount_ptr< T, atomic > &o ) noexcept
        {
            return operator=< atomic >( o );
        }

        T *ptr() const noexcept
        {
            if constexpr ( atomic )
            {
                auto val = uintptr_t( _ptr.load() );
                return reinterpret_cast< T * >( val & ~uintptr_t( 1 ) );
            }
            else
                return _ptr;
        }

        void ptr( T *p ) const noexcept { if constexpr ( atomic ) _ptr.store( p ); else _ptr = p; }

        void _get() const noexcept
        {
            auto p = ptr();
            if ( p )
                p->ref_get();
        }

        void _put() const noexcept
        {
            auto p = ptr();
            if ( p && !p->ref_put() )
                delete p, ptr( nullptr );
        }

        void reset( T *p = nullptr ) noexcept
        {
            if ( p )
                p->ref_get();
            _put();
            ptr( p );
        }

        bool compare_exchange_strong( refcount_ptr< T, false > &p, refcount_ptr< T, false > n )
        {
            TRACE( "cmpxchg ", ptr(), p.ptr(), n.ptr() );
            std::atomic< uintptr_t > &self = *reinterpret_cast< std::atomic< uintptr_t > * >( &_ptr );
            uintptr_t expect = self.load() & ~uintptr_t( 1 );
            uintptr_t want = expect | 1;

            while ( !self.compare_exchange_weak( expect, want ) )
                want = expect | 1, expect = expect & ~uintptr_t( 1 );

            uintptr_t self_val = want & ~uintptr_t( 1 );
            T *self_ptr = reinterpret_cast< T * >( self_val );

            if ( p.ptr() == self_ptr ) /* success, update this */
            {
                n._get();
                p._put();
                _ptr.store( n.ptr() );
                return true;
            }
            else /* failed, update p */
            {
                if ( self_ptr )
                    self_ptr->ref_get();
                p._put();
                p.ptr( self_ptr );
                _ptr.store( self_ptr );
                return false;
            }
        }

        template< typename stream >
        friend auto operator<<( stream &o, const refcount_ptr< T, atomic > &p )
            -> decltype( o << std::declval< void * >() )
        {
            return o << p.ptr();
        }

        mutable std::conditional_t< atomic, std::atomic< T * >, T * > _ptr = nullptr;
    };

    template< typename T = uint16_t, bool atomic = false >
    struct refcount_base
    {
        static constexpr const T max = std::numeric_limits< T >::max();

        void ref_get()
        {
            if ( _refcount < max )
                ++ _refcount;
        }

        bool ref_put()
        {
            ASSERT_LEQ( 1, _refcount );
            return _refcount < max && --_refcount;
        }

        ~refcount_base() { NOISE( this, "destroyed" ); }
        refcount_base() = default;
        refcount_base( const refcount_base & ) : _refcount( 0 ) {}
        refcount_base( refcount_base && ) : _refcount( 0 ) {}
        refcount_base &operator=( refcount_base ) { return *this; }

        std::conditional_t< atomic, std::atomic< T >, T > _refcount = 0;
    };

    template< typename T, typename... Args >
    refcount_ptr< T > make_refcount( Args && ... args )
    {
        return refcount_ptr< T >( new T( std::forward< Args >( args )... ) );
    }

    template< typename T, bool atomic, typename... Args >
    refcount_ptr< T, atomic > make_refcount_opt( Args && ... args )
    {
        return refcount_ptr< T, atomic >( new T( std::forward< Args >( args )... ) );
    }
}

namespace t_brq
{
    template< bool atomic >
    struct ref_test : brq::refcount_base< uint16_t, atomic >
    {
        int &cnt;
        ref_test( int &cnt ) : cnt( cnt ) { ++cnt; }
        ~ref_test() { --cnt; }
    };

    template< bool atomic_ptr, bool atomic_cnt >
    struct refcount_ptr
    {
        struct obj : brq::refcount_base< uint16_t, atomic_cnt > {};

        TEST(simple)
        {
            auto a = brq::make_refcount_opt< obj, atomic_ptr >();
            ASSERT_EQ( a->_refcount, 1 );
        }

        TEST(dtor)
        {
            auto a = brq::make_refcount_opt< obj, atomic_ptr >();
            ASSERT_EQ( a->_refcount, 1 );
            {
                auto b = a;
                ASSERT_EQ( a->_refcount, 2 );
            }
            ASSERT_EQ( a->_refcount, 1 );
        }

        TEST(assign)
        {
            auto a = brq::make_refcount_opt< obj, atomic_ptr >();
            decltype( a ) b;
            ASSERT_EQ( a->_refcount, 1 );
            b = a;
            ASSERT_EQ( a->_refcount, 2 );
            *&b = b;
            ASSERT_EQ( a->_refcount, 2 );
        }

        TEST(destroy)
        {
            int objs = 0;
            {
                auto a = brq::make_refcount_opt< ref_test< atomic_cnt >, atomic_ptr >( objs );
                ASSERT_EQ( objs, 1 );
            }
            ASSERT_EQ( objs, 0 );
        }
    };

    template struct refcount_ptr< true, true >;
    template struct refcount_ptr< false, true >;
    template struct refcount_ptr< true, false >;
    template struct refcount_ptr< false, false >;
}

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab
