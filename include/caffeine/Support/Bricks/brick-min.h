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

#include <cstring>
#include <cstdlib>
#include <cctype>
#include <string_view>
#include <charconv>

#ifndef __inline_opt
#define __inline_opt
#endif

namespace brq
{
    template< typename B, typename T, typename = void > struct is_printable : std::false_type {};
    template< typename B, typename T >
    struct is_printable< B, T, decltype( std::declval< B & >() << std::declval< const T & >(),
                                         void( 0 ) ) > : std::true_type {};
    template< typename B, typename T >
    constexpr bool is_printable_v = is_printable< B, T >::value;

    /* A simple string builder, similar to std::stringstream but much lighter.
     * Only works with 8-bit characters (i.e. no wchar_t or char32_t). Provides
     * a basic selection of formatting operators. To provide formatting
     * operators for custom types, the following idiom may be useful to use the
     * same definition for std::ostream and for string_builder (also works for
     * friend-style definitions):
     *
     * template< typename stream >
     * auto operator<<( stream &o, my_type t ) -> decltype( o << "" )
     * {
     *     // ...
     * }
     *
     * Besides accepting values to format, string_builder also understands
     * std::dec and std::hex IO manipulators. */

    struct string_builder
    {
        char *_buffer = nullptr;
        int32_t _capacity:30, _offset:30;
        bool _hex:1, _oom:1;

        string_builder( const string_builder & ) = delete;
        string_builder( string_builder &&o )
            : _buffer( o._buffer ), _capacity( o._capacity ), _offset( o._offset ),
              _hex( o._hex ), _oom( o._oom )
        {
            o._buffer = nullptr;
            o._capacity = 0;
            o._offset = 0;
        }

        string_builder() noexcept : _capacity( 0 ), _offset( 0 ), _hex( false ), _oom( false ) {}
        ~string_builder() noexcept { std::free( _buffer ); }

        char *pointer() noexcept { return _buffer + _offset; }
        char *buffer_end() noexcept { return _buffer + _capacity - 1; }
        const char *buffer() const noexcept { return _buffer ? _buffer : ""; }
        std::string_view data() const noexcept { return std::string_view( _buffer, _offset ); }
        operator std::string_view() const noexcept { return data(); }
        int size() const noexcept { return _offset; }
        bool truncated() const noexcept { return _oom; }
        void kill() { clear(); _oom = true; }

        string_builder &hex( bool h = true ) { _hex = h; return *this; }
        string_builder &dec() { _hex = false; return *this; }

        void clear()
        {
            std::free( _buffer );
            _buffer = nullptr;
            _capacity = _offset = 0;
            _hex = _oom = false;
        }

        bool _make_space( int sz ) noexcept
        {
            if ( _oom )
                return false;
            if ( _offset + sz < _capacity )
                return true;

            int new_capacity = _capacity + std::max( _capacity / 2, sz + 1 );
            void *mem = std::realloc( _buffer, new_capacity );
            if ( mem )
            {
                _buffer = static_cast< char * >( mem );
                _capacity = new_capacity;
            }
            else
                _oom = true;

            return !_oom;
        }

        string_builder &operator<<( std::string_view str ) noexcept
        {
            if ( !_make_space( str.size() ) ) return *this;
            std::copy( str.begin(), str.end(), pointer() );
            _offset += str.size();
            _buffer[ _offset ] = 0;
            return *this;
        }

        string_builder &operator<<( std::u32string_view us ) noexcept
        {
            while ( !us.empty() )
            {
                if ( !_make_space( 4 ) ) return *this;

                uint32_t wc = us.front();

                if ( ( wc & 0xFFFFF800 ) == 0x00D800 || wc > 0x10FFFF )
                    continue; /* skip the character */

                if ( wc < 0x000080 )
                {
                    _buffer[ _offset++ ] = static_cast< uint8_t >( wc ); 
                }
                else if ( wc < 0x000800 )
                {
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0xC0 | ( wc >> 6 ) );
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0x80 | ( wc & 0x03F ) );
                }
                else if ( wc < 0x010000 )
                {
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0xE0 |   ( wc >> 12 ) );
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0x80 | ( ( wc & 0x0FC0 ) >> 6 ) );
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0x80 |   ( wc & 0x003F ) );
                }
                else // if (wc < 0x110000)
                {
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0xF0 |   ( wc >> 18 ) );
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0x80 | ( ( wc & 0x03F000 ) >> 12 ) );
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0x80 | ( ( wc & 0x000FC0 ) >> 6 ) );
                    _buffer[ _offset++ ] = static_cast< uint8_t >( 0x80 |   ( wc & 0x00003F ) );
                }

                us.remove_prefix( 1 );
            }

            return *this;
        }

        string_builder &operator<<( char c ) noexcept
        {
            *this << int( c );
            if ( std::isprint( c ) )
            {
                if ( !_make_space( 3 ) ) return *this;
                _buffer[ _offset++ ] = '\'';
                _buffer[ _offset++ ] = c;
                _buffer[ _offset++ ] = '\'';
                _buffer[ _offset ] = 0;
            }
            return *this;
        }

        string_builder &operator<<( const void *ptr ) noexcept
        {
            auto was_hex = _hex;
            _hex = true;
            (*this) << uintptr_t( ptr );
            _hex = was_hex;
            return *this;
        }

        string_builder &operator<<( const char *str ) noexcept
        {
            return (*this) << ( str ? std::string_view( str ) : "<nullptr>" );
        }

        template< typename C >
        auto operator<<( const C &c ) noexcept
            -> std::enable_if_t< !std::is_convertible_v< C, std::string_view > &&
                                 !std::is_convertible_v< C, std::u32string_view >,
                                 decltype( c.has_value(), *this << *c ) >
        {
            if ( c.has_value() )
                return *this << "[ " << *c << " ]";
            else
                return *this << "<null>";
        }

        template< typename C >
        auto operator<<( const C &c ) noexcept
            -> std::enable_if_t< !std::is_convertible_v< C, std::string_view > &&
                                 !std::is_convertible_v< C, std::u32string_view > &&
                                 is_printable_v< string_builder, decltype( *c.begin() ) > &&
                                 is_printable_v< string_builder, decltype( *c.end() ) >,
                                 string_builder & >
        {
            bool first = true;
            *this << "[";
            for ( const auto &e : c )
                *this << ( first ? first = false, " " : ", " ) << e;
            *this << ( first ? "]" : " ]" );
            return *this;
        }

        template< typename P >
        auto operator<<( const P &p ) noexcept -> decltype( *this << p.first << p.second )
        {
            return *this << "[" << p.first << ", " << p.second << "]";
        }

        template< typename F >
        auto operator<<( const F &f ) noexcept
            -> decltype( f( *this ), *this )
        {
            return f( *this ), *this;
        }

        template< typename V >
        auto operator<<( const V &val ) noexcept
            -> decltype( std::to_chars( _buffer, _buffer, val ), *this )
        {
            int cap = 16;
            std::to_chars_result result;
            do {
                if ( !_make_space( cap ) ) return *this;
                if constexpr ( std::is_integral< V >::value )
                    result = std::to_chars( pointer(), buffer_end(), val, _hex ? 16 : 10 );
                else
                    result = std::to_chars( pointer(), buffer_end(), val );
                cap *= 2;
            } while ( result.ec == std::errc::value_too_large );

            _offset = result.ptr - _buffer;
            _buffer[ _offset ] = 0;
            return *this;
        }
    };

    struct fallback
    {
        template< typename T >
        constexpr fallback( const T & ) {}
    };

    struct primary_t {};
    static constexpr primary_t primary;

    /* Format a bunch of values into a stream, separated by spaces. Values that
     * don't have a string_builder formatting operator are printed as
     * <unknown>, because TRACE statements can include values whose types
     * depend on template parameters and we don't want TRACE uses to cause
     * unexpected instantiation failures (especially for cases where the user
     * doesn't care about the trace output). */

    template< typename stream, typename T >
    auto format_nofail( stream &acc, const T &t ) noexcept -> decltype( acc << t, void(0) )
    {
        acc << t;
    }

    template< typename stream >
    void format_nofail( stream &acc, fallback ) noexcept
    {
        acc << "<unknown>";
    }

    template< bool nofail = false, typename stream >
    void format_args( const char *, stream & ) noexcept {}

    template< bool nofail = false, typename stream, typename A, typename... Args >
    void format_args( const char *sep, stream &acc, const A &a, const Args & ... as ) noexcept
    {
        int mark = acc.size();
        if constexpr ( nofail )
            format_nofail( acc, a );
        else
            acc << a;

        if ( mark != acc.size() )
            acc << sep;
        format_args< nofail >( sep, acc, as... );
    }

    using split_view = std::pair< std::string_view, std::string_view >;

    static inline split_view split( std::string_view p, char d, bool reverse = false ) noexcept
    {
        auto s = reverse ? p.rfind( d ) : p.find( d );
        if ( s == p.npos )
            return reverse ? split_view{ "", p } : split_view{ p, "" };
        auto q = p;
        q.remove_prefix( s + 1 );
        p.remove_suffix( p.size() - s );
        return { p, q };
    }

    static inline bool starts_with( std::string_view s, std::string_view t ) noexcept
    {
        if ( s.size() >= t.size() )
        {
            s.remove_suffix( s.size() - t.size() );
            return s.compare( t ) == 0;
        }
        else
            return false;
    }

    static inline bool ends_with( std::string_view s, std::string_view t ) noexcept
    {
        if ( s.size() >= t.size() )
        {
            s.remove_prefix( s.size() - t.size() );
            return s.compare( t ) == 0;
        }
        else
            return false;
    }
}
