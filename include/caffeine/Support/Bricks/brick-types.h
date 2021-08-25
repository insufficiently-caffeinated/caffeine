// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * Assorted types, mostly for C++11.
 * - Maybe a = Just a | Nothing (w/ a limited variant for C++98)
 * - Unit: single-valued type (empty structure)
 * - Union: discriminated (tagged) union
 * - StrongEnumFlags
 * - type-traits: is_detected
 */

/*
 * (c) 2006, 2014 Petr Ročkai <me@mornfall.net>
 * (c) 2013-2015 Vladimír Štill <xstill@fi.muni.cz>
 * (c) 2018 Henrich Lauko <xlauko@mail.muni.cz>
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
#include "brick-string.h"

#include <memory>
#include <cstring>
#include <string>
#include <type_traits>
#include <functional>
#if __cplusplus > 201402L && __has_include(<variant>) && __has_include(<optional>) // C++17
#define BRICK_TYPES_HAS_MATCH
#include <variant>
#include <optional>
#endif

#if __cplusplus >= 201103L
#define CONSTEXPR constexpr
#else
#define CONSTEXPR
#endif

#if __cplusplus > 201103L && __GNUC__ != 4 && __GNUC_MINOR__ != 9
#define CPP1Y_CONSTEXPR constexpr // C++1y
#else
#define CPP1Y_CONSTEXPR // C++11
#endif

namespace brick {
namespace types {

struct Preferred { CONSTEXPR Preferred() { } };
struct NotPreferred { CONSTEXPR NotPreferred( Preferred ) {} };

template< typename _T >
struct Witness { using T = _T; };

namespace detail
{
    template< typename T >
    constexpr auto _has_as_tuple( Preferred )
        -> decltype( std::declval< const T & >().as_tuple(), bool() )
    { return true; }

    template< typename T >
    constexpr auto _has_as_tuple( NotPreferred ) { return false; }

    template< typename T >
    constexpr bool has_as_tuple() { return _has_as_tuple< T >( Preferred() ); }
}

// requires operator==
struct Eq { };

template< typename Trait, typename Ret, typename T >
using HasTrait = typename std::enable_if< std::is_base_of< Trait, T >::value, Ret >::type;

template< typename T >
using IsEq = HasTrait< Eq, bool, T >;

template< typename T >
IsEq< T > operator!=( const T &a, const T &b ) { return !(a == b); }

template< typename T >
auto operator==( const T &a, const T &b )
    -> std::enable_if_t< detail::has_as_tuple< T >(), IsEq< T > >
{
    return a.as_tuple() == b.as_tuple();
}

// requires operator <
struct Ord : Eq { };

template< typename T >
using IsOrd = HasTrait< Ord, bool, T >;

template< typename T >
IsOrd< T > operator>( const T &a, const T &b ) { return b < a; }

template< typename T >
IsOrd< T > operator>=( const T &a, const T &b ) { return !(a < b); }

template< typename T >
IsOrd< T > operator<=( const T &a, const T &b ) { return !(b < a); }

template< typename T >
auto operator==( const T &a, const T &b )
    -> std::enable_if_t< !detail::has_as_tuple< T >(), IsOrd< T > >
{
    return !(a < b) && !(b < a);
}

template< typename T >
auto operator<( const T &a, const T &b )
    -> std::enable_if_t< detail::has_as_tuple< T >(), IsOrd< T > >
{
    return a.as_tuple() < b.as_tuple();
}

using Comparable = Ord;

struct Unit : Ord {
    bool operator<( Unit ) const { return false; }
    bool operator==( Unit ) const { return true; }
};

struct Defer {
    template< typename F >
    Defer( F fn ) : fn( fn ), _deleted( false ) { }

    void run() {
        if ( !_deleted ) {
            fn();
            _deleted = true;
        }
    }

    bool deleted() const { return _deleted; }
    void pass() { _deleted = true; }
    ~Defer() { run(); }
  private:
    std::function< void() > fn;
    bool _deleted;
};

template< typename T >
struct StorableRef {
    T _t;
    T &t() { return _t; }
    const T &t() const { return _t; }
    StorableRef( T t ) : _t( t ) {}
};

template< typename T >
struct StorableRef< T & > {
    T *_t;
    T &t() { return *_t; }
    const T &t() const { return *_t; }
    StorableRef( T &t ) : _t( &t ) {}
};

template< typename _T >
struct Maybe : Comparable
{
    using T = _T;

    bool isNothing() const { return _nothing; }
    bool isJust() const { return !_nothing; }

    T &value() {
        ASSERT( isJust() );
        return _v.t.t();
    }

    const T &value() const {
        ASSERT( isJust() );
        return _v.t.t();
    }

    T fromMaybe( T x ) const { return isJust() ? value() : x; }

    explicit operator bool() const { return isJust() && bool( value() ); }

    static Maybe Just( const T &t ) { return Maybe( t ); }
    static Maybe Nothing() { return Maybe(); }

    Maybe( const Maybe &m ) {
        _nothing = m.isNothing();
        if ( !_nothing )
            _v.t = m._v.t;
    }

    ~Maybe() {
        if ( !_nothing )
            _v.t.~StorableRef< T >();
    }

    bool operator <( const Maybe< T > &o ) const {
        if ( isNothing() )
            return !o.nothing();
        if ( o.isNothing() )
            return false;
        return value() < o.value();
    }

protected:

    Maybe( const T &v ) : _v( v ), _nothing( false ) {}
    Maybe() : _nothing( true ) {}
    struct Empty {
        char x[ sizeof( T ) ];
    };

    union V {
        StorableRef< T > t;
        Empty empty;
        V() : empty() {}
        V( const T &t ) : t( t ) {}
        ~V() { } // see dtor of Maybe
    };
    V _v;
    bool _nothing;
};

template<>
struct Maybe< void > {
    typedef void T;
    static Maybe Just() { return Maybe( false ); }
    static Maybe Nothing() { return Maybe( true ); }
    bool isNothing() { return _nothing; }
    bool isJust() { return !_nothing; }
private:
    Maybe( bool nothing ) : _nothing( nothing ) {}
    bool _nothing;
};

#if __cplusplus >= 201403L

namespace detail {

template< class... >
using void_t = void;

template< class Default, class AlwaysVoid, template< class... > class Op, class... Args >
struct Detector {
    using value_t = std::false_type;
    using type = Default;
};

template< class Default, template< class... > class Op, class... Args >
struct Detector< Default, void_t< Op< Args... > >, Op, Args... > {
    using value_t = std::true_type;
    using type = Op< Args... >;
};

} // namespace detail

struct NoneSuch {
    NoneSuch() = delete;
    ~NoneSuch() = delete;
    NoneSuch( NoneSuch const& ) = delete;
    void operator=( NoneSuch const& ) = delete;
};

template< template< class... > class Op, class... Args >
using is_detected = typename detail::Detector< NoneSuch, void, Op, Args... >::value_t;

template< template< class... > class Op, class... Args >
constexpr bool is_detected_v = is_detected< Op, Args... >::value;

#endif

#if __cplusplus >= 201103L

template< typename E >
using is_enum_class = std::integral_constant< bool,
        std::is_enum< E >::value && !std::is_convertible< E, int >::value >;

template< typename Self >
struct StrongEnumFlags {
    static_assert( is_enum_class< Self >::value, "Not an enum class." );
    using This = StrongEnumFlags< Self >;
    using UnderlyingType = typename std::underlying_type< Self >::type;

    constexpr StrongEnumFlags() noexcept : store( 0 ) { }
    constexpr StrongEnumFlags( Self flag ) noexcept :
        store( static_cast< UnderlyingType >( flag ) )
    { }
    explicit constexpr StrongEnumFlags( UnderlyingType st ) noexcept : store( st ) { }

    constexpr explicit operator UnderlyingType() const noexcept {
        return store;
    }

    This &operator|=( This o ) noexcept {
        store |= o.store;
        return *this;
    }

    This &operator&=( This o ) noexcept {
        store &= o.store;
        return *this;
    }

    This &operator^=( This o ) noexcept {
        store ^= o.store;
        return *this;
    }

    friend constexpr This operator|( This a, This b ) noexcept {
        return This( a.store | b.store );
    }

    friend constexpr This operator&( This a, This b ) noexcept {
        return This( a.store & b.store );
    }

    friend constexpr This operator^( This a, This b ) noexcept {
        return This( a.store ^ b.store );
    }

    friend constexpr bool operator==( This a, This b ) noexcept {
        return a.store == b.store;
    }

    friend constexpr bool operator!=( This a, This b ) noexcept {
        return a.store != b.store;
    }

    constexpr bool has( Self x ) const noexcept {
        return ((*this) & x) == x;
    }

    This clear( Self x ) noexcept {
        store &= ~UnderlyingType( x );
        return *this;
    }

    explicit constexpr operator bool() const noexcept {
        return store;
    }

    constexpr This operator~() const noexcept { return This( ~store ); }

  private:
    UnderlyingType store;
};

template< typename T >
brq::parse_result from_string( std::string_view s, brick::types::StrongEnumFlags< T > &f )
{
    T val;

    for ( auto c : brq::splitter( s, ',' ) )
    {
        if ( auto r = from_string( c, val ) ; !r )
            return r;
        else
            f |= val;
    }

    return {};
}

/* implementation of Union */

namespace _impl {
    template< size_t val, typename... >
    struct MaxSizeof : std::integral_constant< size_t, val > { };

    template< size_t val, typename T, typename... Ts >
    struct MaxSizeof< val, T, Ts... > :
        MaxSizeof< ( val > sizeof( T ) ) ? val : sizeof( T ), Ts... >
    { };

    template< size_t val, typename... >
    struct MaxAlign : std::integral_constant< size_t, val > { };

    template< size_t val, typename T, typename... Ts >
    struct MaxAlign< val, T, Ts... > :
        MaxAlign< ( val > std::alignment_of< T >::value )
                      ? val : std::alignment_of< T >::value, Ts... >
    { };

    template< typename... >
    struct AllDistinct : std::true_type { };

    template< typename, typename... >
    struct In : std::false_type { };

    template< typename Needle, typename T, typename... Ts >
    struct In< Needle, T, Ts... > : std::integral_constant< bool,
        std::is_same< Needle, T >::value || In< Needle, Ts... >::value >
    { };

    template< typename, typename... >
    struct _OneConversion { };

    template< typename From, typename To, typename... >
    struct NoneConvertible { using T = To; };

    template< typename From, typename To, typename T, typename... Ts >
    struct NoneConvertible< From, To, T, Ts... > : std::conditional<
        std::is_convertible< From, T >::value,
        Unit,
        NoneConvertible< From, To, Ts... > >::type { };

    static_assert( std::is_convertible< Witness< int >, Witness< int > >::value, "is_convertible" );

    template< typename Needle, typename T, typename... Ts >
    struct _OneConversion< Needle, T, Ts... > : std::conditional<
        std::is_convertible< Needle, T >::value,
        NoneConvertible< Needle, T, Ts... >,
        _OneConversion< Needle, Ts... > >::type { };

    template< typename Needle, typename... Ts >
    struct OneConversion : std::conditional<
        In< Needle, Ts... >::value,
        Witness< Needle >,
        _OneConversion< Needle, Ts... > >::type { };

    static_assert( std::is_same< OneConversion< int, int >::T, int >::value, "OneConversion" );
    static_assert( std::is_same< OneConversion< long, int >::T, int >::value, "OneConversion" );
    static_assert( std::is_same< OneConversion< long, std::string, int >::T, int >::value, "OneConversion" );
    static_assert( std::is_same< OneConversion< long, int, long, int >::T, long >::value, "OneConversion" );

    template< typename T, typename... Ts >
    struct AllDistinct< T, Ts... > : std::integral_constant< bool,
        !In< T, Ts... >::value && AllDistinct< Ts... >::value >
    { };

template< typename F, typename T, typename Fallback, typename Check = bool >
struct _ApplyResult : Fallback {};

template< typename F, typename T, typename Fallback >
struct _ApplyResult< F, T, Fallback, decltype( std::declval< F >()( std::declval< T& >() ), true ) >
{
    using Parameter = T;
    using Result = decltype( std::declval< F >()( std::declval< T& >() ) );
};

template< typename F, typename... Ts > struct ApplyResult;

template< typename F, typename T, typename... Ts >
struct ApplyResult< F, T, Ts... > : _ApplyResult< F, T, ApplyResult< F, Ts... > > {};

template< typename F > struct ApplyResult< F > {};

}

template< typename T >
struct InPlace { };

struct NullUnion { };

namespace _impl {

template< bool AllowCopy, typename... Types >
struct Union : Comparable
{
    static_assert( sizeof...( Types ) < 0xff, "Too much unioned types, sorry" );
    static_assert( _impl::AllDistinct< Types... >::value,
            "All types in union must be distinct" );

    constexpr Union() : _discriminator( 0 ) { }
    constexpr Union( NullUnion ) : _discriminator( 0 ) { }

    Union( const Union &other ) {
        ASSERT_LEQ( size_t( other._discriminator ), sizeof...( Types ) );
        if ( other._discriminator > 0 )
            _copyConstruct< 1, Types... >( other._discriminator, other );
        _discriminator = other._discriminator;
    }

    Union( Union &&other ) {
        ASSERT_LEQ( size_t( other._discriminator ), sizeof...( Types ) );
        auto target = other._discriminator;
        other._discriminator = 0;
        if ( target > 0 )
            _moveConstruct< 1, Types... >( target, std::move( other ) );
        _discriminator = target;
    }

    template< typename T, typename U = typename _impl::OneConversion< T, Types... >::T >
    CPP1Y_CONSTEXPR Union( T val ) {
        new ( &storage ) U( std::move( val ) );
        _discriminator = discriminator< U >();
    }

    template< typename T, typename... Args >
    Union( InPlace< T >, Args &&... args ) : _discriminator( discriminator< T >() ) {
        new ( &storage ) T( std::forward< Args >( args )... );
    }

    // use copy and swap
    Union &operator=( Union other ) {
        swap( other );
        return *this;
    }

    ~Union() {
        if ( _discriminator )
            _destruct< 1, Types... >( _discriminator );
    }

    template< typename T >
    auto operator=( const T &other ) -> typename
        std::enable_if< std::is_lvalue_reference< T & >::value, Union & >::type
    {
        if ( is< T >() )
            unsafeGet< T >() = other;
        else
            _copyAssignDifferent( Union( other ) );
        return *this;
    }

    template< typename T >
    auto operator=( T &&other ) -> typename
        std::enable_if< std::is_rvalue_reference< T && >::value, Union & >::type
    {
        if ( is< T >() )
            unsafeGet< T >() = std::move( other );
        else
            _moveAssignDifferent( std::move( other ) );
        return *this;
    }

    void swap( Union &other ) {
        if ( _discriminator == 0 && other._discriminator == 0 )
            return;

        if ( _discriminator == other._discriminator )
            _swapSame< 1, Types... >( other );
        else
            _swapDifferent< 0, void, Types... >( other );
    }

    bool empty() const {
        return _discriminator == 0;
    }

    explicit operator bool() const
    {
        auto rv = const_cast< Union* >( this )->apply( []( const auto & x ) -> bool { return !!x; } );
        if ( rv.isNothing() )
            return false;
        return true;
    }

    template< typename T >
    bool is() const {
        return discriminator< T >() == _discriminator;
    }

    template< typename T >
    explicit operator T() const {
        return convert< T >();
    }

    template< typename T >
    T &get() {
        ASSERT( is< T >() );
        return unsafeGet< T >();
    }

    template< typename T >
    const T &get() const {
        return cget< T >();
    }

    template< typename T >
    const T &cget() const {
        ASSERT( is< T >() );
        return unsafeGet< T >();
    }

    template< typename T >
    T *asptr() { return is< T >() ? &get< T >() : nullptr; }

    template< typename T >
    const T *asptr() const { return is< T >() ? &get< T >() : nullptr; }

    template< typename T >
    const T &getOr( const T &val ) const {
        if ( is< T >() )
            return unsafeGet< T >();
        return val;
    }

    template< typename T >
    T convert() const { return _convert< T >(); }

    template< typename T >
    T &unsafeGet() {
        return *reinterpret_cast< T * >( &storage );
    }

    template< typename T >
    const T &unsafeGet() const {
        return *reinterpret_cast< const T * >( &storage );
    }

    template< typename T >
    T &&moveOut() {
        ASSERT( is< T >() );
        return unsafeMoveOut< T >();
    }

    template< typename T >
    T &&unsafeMoveOut() {
        return std::move( *reinterpret_cast< T * >( &storage ) );
    }

    template< typename F >
    using Applied = Maybe< typename _impl::ApplyResult< F, Types... >::Result >;

    // invoke `f` on the stored value if the type currently stored in the union
    // can be legally passed to that function as an argument
    template< typename F >
    auto apply( F f ) -> Applied< F > {
        return _apply< F, Types... >( Preferred(), f );
    }

    template< typename R >
    R _match() { return R::Nothing(); }

    // invoke the first function that can handle the currently stored value
    // (type-based pattern matching)
    template< typename R, typename F, typename... Args >
    R _match( F f, Args&&... args ) {
        auto x = apply( f );
        if ( x.isNothing() )
            return _match< R >( args... );
        else
            return x;
    }

    // invoke the first function that can handle the currently stored value
    // (type-based pattern matching)
    // * return value can be extracted from resuling Maybe value
    // * auto lambdas are supported an can be called on any value!
    template< typename F, typename... Args >
    Applied< F > match( F f, Args&&... args ) {
        return _match< Applied< F > >( f, args... );
    }

    bool operator==( const Union &other ) const {
        return _discriminator == other._discriminator
            && (_discriminator == 0 || _compare< std::equal_to >( other ));
    }

    bool operator<( const Union &other ) const {
        return _discriminator < other._discriminator
            || (_discriminator == other._discriminator
                    && (_discriminator == 0 || _compare< std::less >( other )) );
    }

    unsigned char discriminator() const { return _discriminator; }

    template< typename T >
    unsigned char discriminator() const {
        static_assert( _impl::In< T, Types... >::value,
                "Trying to construct Union from value of type not allowed for it." );
        return _discriminatorF< 1, T, Types... >();
    }

  private:
    static constexpr size_t size = _impl::MaxSizeof< 1, Types... >::value;
    static constexpr size_t alignment = _impl::MaxAlign< 1, Types... >::value;
    typename std::aligned_storage< size, alignment >::type storage;
    unsigned char _discriminator;

    template< unsigned char i, typename Needle, typename T, typename... Ts >
    constexpr unsigned char _discriminatorF() const {
        return std::is_same< Needle, T >::value
            ? i : _discriminatorF< i + 1, Needle, Ts... >();
    }

    template< unsigned char, typename >
    constexpr unsigned char _discriminatorF() const { return 0; /* cannot happen */ }

    template< unsigned char i, typename T, typename... Ts >
    void _copyConstruct( unsigned char d, const Union &other ) {
        if ( i == d )
            new ( &storage ) T( other.unsafeGet< T >() );
        else
            _copyConstruct< i + 1, Ts... >( d, other );
    }

    template< unsigned char >
    unsigned char _copyConstruct( unsigned char, const Union & )
    { UNREACHABLE( "invalid _copyConstruct" ); }

    template< unsigned char i, typename T, typename... Ts >
    void _moveConstruct( unsigned char d, Union &&other ) {
        if ( i == d )
            new ( &storage ) T( other.unsafeMoveOut< T >() );
        else
            _moveConstruct< i + 1, Ts... >( d, std::move( other ) );
    }

    template< unsigned char >
    unsigned char _moveConstruct( unsigned char, Union && )
    { UNREACHABLE( "invalid _moveConstruct" ); }

    void _copyAssignDifferent( const Union &other ) {
        auto tmp = _discriminator;
        _discriminator = 0;
        if ( tmp )
            _destruct< 1, Types... >( tmp );
        if ( other._discriminator )
            _copyConstruct< 1, Types... >( other._discriminator, other );
        _discriminator = other._discriminator;
    }

    void _copyAssignSame( const Union &other ) {
        ASSERT_EQ( _discriminator, other._discriminator );
        if ( _discriminator == 0 )
            return;
        _copyAssignSame< 1, Types... >( other );
    }

    template< unsigned char i, typename T, typename... Ts >
    void _copyAssignSame( const Union &other ) {
        if ( i == _discriminator )
            unsafeGet< T >() = other.unsafeGet< T >();
        else
            _copyAssignSame< i + 1, Ts... >( other );
    }

    template< unsigned char >
    void _copyAssignSame( const Union & ) { UNREACHABLE( "invalid _copyAssignSame" ); }

    template< unsigned char i, typename T, typename... Ts >
    void _destruct( unsigned char d ) {
        if ( i == d )
            unsafeGet< T >().~T();
        else
            _destruct< i + 1, Ts... >( d );
    }

    template< unsigned char >
    void _destruct( unsigned char ) { UNREACHABLE( "invalid _destruct" ); }

    void _moveAssignSame( Union &&other ) {
        ASSERT_EQ( _discriminator, other._discriminator );
        if ( _discriminator == 0 )
            return;
        _moveAssignSame< 1, Types... >( std::move( other ) );
    }

    template< unsigned char i, typename T, typename... Ts >
    void _moveAssignSame( Union &&other ) {
        if ( i == _discriminator )
            unsafeGet< T >() = other.unsafeMoveOut< T >();
        else
            _moveAssignSame< i + 1, Ts... >( std::move( other ) );
    }

    template< unsigned char >
    void _moveAssignSame( Union && ) { UNREACHABLE( "invalid _moveAssignSame" ); }

    void _moveAssignDifferent( Union &&other ) {
        auto tmp = _discriminator;
        auto target = other._discriminator;
        _discriminator = 0;
        if ( tmp )
            _destruct< 1, Types... >( tmp );
        if ( target )
            _moveConstruct< 1, Types... >( target, std::move( other ) );
        _discriminator = target;
    }

    template< typename F > Applied< F > _apply( Preferred, F ) { return Applied< F >::Nothing(); }

    template< typename F, typename T >
    auto fixvoid( F f ) ->
        typename std::enable_if< std::is_void< typename Applied< F >::T >::value, Applied< F > >::type
    {
        f( get< T >() );
        return Maybe< void >::Just();
    }

    template< typename F, typename T >
    auto fixvoid( F f ) ->
        typename std::enable_if< !std::is_void< typename Applied< F >::T >::value, Applied< F > >::type
    {
        return Applied< F >::Just( f( get< T >() ) );
    }

    template< typename F, typename T, typename... Args >
    auto _apply( Preferred, F f ) -> Maybe< typename _impl::_ApplyResult< F, T, Unit >::Result >
    {
        if ( !is< T >() )
            return _apply< F, Args... >( Preferred(), f );

        return fixvoid< F, T >( f );
    }

    template< typename F, typename T, typename... Args >
    auto _apply( NotPreferred, F f ) -> Applied< F >
    {
        return _apply< F, Args... >( Preferred(), f );
    }

    template< template< typename > class Compare, int d >
    bool _compare2( const Union & ) const { UNREACHABLE( "invalid discriminator" ); }

    template< template< typename > class Compare, int d, typename T, typename... Ts >
    bool _compare2( const Union &other ) const {
        return d == _discriminator
            ? Compare< T >()( get< T >(), other.template get< T >() )
            : _compare2< Compare, d + 1, Ts... >( other );
    }

    template< template< typename > class Compare >
    bool _compare( const Union &other ) const {
        return _compare2< Compare, 1, Types... >( other );
    }

    template< typename Target, bool anyCastPossible, int >
    Target _convert2( Preferred ) const {
        static_assert( anyCastPossible, "Cast of Union can never succeed" );
        UNREACHABLE( "wrong _convert2 in Union" );
    }

    template< typename Target, bool any, int d, typename, typename... Ts >
    Target _convert2( NotPreferred ) const {
        return _convert2< Target, any, d + 1, Ts... >( Preferred() );
    }

    template< typename Target, bool any, int d, typename T, typename... Ts >
    auto _convert2( Preferred ) const -> decltype( static_cast< Target >( this->unsafeGet< T >() ) )
    {
        if ( _discriminator == d )
            return static_cast< Target >( unsafeGet< T >() );
        return _convert2< Target, true, d + 1, Ts... >( Preferred() );
    }

    template< typename Target >
    Target _convert() const {
        return _convert2< Target, false, 1, Types... >( Preferred() );
    }

    template< unsigned char i, typename T, typename... Ts >
    void _swapSame( Union &other ) {
        if ( _discriminator == i )
            _doSwap< T >( unsafeGet< T >(), other.unsafeGet< T >(), Preferred() );
        else
            _swapSame< i + 1, Ts... >( other );
    }

    template< unsigned char i >
    void _swapSame( Union & ) { UNREACHABLE( "Invalid _swapSame" ); }

    template< typename T >
    auto _doSwap( T &a, T &b, Preferred ) -> decltype( a.swap( b ) ) {
        a.swap( b );
    }

    template< typename T >
    auto _doSwap( T &a, T &b, NotPreferred ) -> decltype( std::swap( a, b ) ) {
        std::swap( a, b );
    }

    template< unsigned char i, typename T, typename... Ts >
    void _swapDifferent( Union &other ) {
        if ( i == _discriminator )
            _swapDifferent2< i, T, 0, void, Types... >( other );
        else
            _swapDifferent< i + 1, Ts... >( other );
    }

    template< unsigned char i >
    void _swapDifferent( Union & ) { UNREACHABLE( "Invalid _swapDifferent" ); }

    template< unsigned char local, typename Local, unsigned char i, typename T, typename... Ts >
    void _swapDifferent2( Union &other ) {
        if ( i == other._discriminator )
            _doSwapDifferent< local, i, Local, T >( other );
        else
            _swapDifferent2< local, Local, i + 1, Ts... >( other );
    }

    template< unsigned char local, typename Local, unsigned char i >
    void _swapDifferent2( Union & ) { UNREACHABLE( "Invalid _swapDifferent2" ); }

    template< unsigned char l, unsigned char r, typename L, typename R >
    auto _doSwapDifferent( Union &other ) -> typename std::enable_if< l != 0 && r != 0 >::type {
        L lval( unsafeMoveOut< L >() );
        unsafeGet< L >().~L();

        new ( &unsafeGet< R >() ) R( other.unsafeMoveOut< R >() );
        other.unsafeGet< R >().~R();

        new ( &other.unsafeGet< L >() ) L( std::move( lval ) );
        std::swap( _discriminator, other._discriminator );
    }

    template< unsigned char l, unsigned char r, typename L, typename R >
    auto _doSwapDifferent( Union &other ) -> typename std::enable_if< l == 0 && r != 0 >::type {
        new ( &unsafeGet< R >() ) R( other.unsafeMoveOut< R >() );
        other.unsafeGet< R >().~R();
        std::swap( _discriminator, other._discriminator );
    }

    template< unsigned char l, unsigned char r, typename L, typename R >
    auto _doSwapDifferent( Union &other ) -> typename std::enable_if< l != 0 && r == 0 >::type {
        new ( &other.unsafeGet< L >() ) L( unsafeMoveOut< L >() );
        unsafeGet< L >().~L();
        std::swap( _discriminator, other._discriminator );
    }

    template< unsigned char l, unsigned char r, typename L, typename R >
    auto _doSwapDifferent( Union & ) -> typename std::enable_if< l == 0 && r == 0 >::type {
        UNREACHABLE( "Invalid _doSwapDifferent" );
    }
};

template< typename... Types >
struct Union< false, Types... > : Union< true, Types... >
{
    using Union< true, Types... >::Union;
    using Union< true, Types... >::operator=;

    Union( const Union & ) = delete;
    Union( Union && ) = default;
    Union() = default;
    template< typename T >
    Union &operator=( const T &other ) = delete;
    Union &operator=( Union && ) = default;
};

}

template< typename... Types >
using Union = _impl::Union< ( std::is_copy_constructible< Types >::value && ... ), Types... >;

template< typename Left, typename Right >
struct Either : Union< Left, Right > {

    using Union< Left, Right >::Union;

    bool isLeft() const { return this->template is< Left >(); }
    bool isRight() const { return this->template is< Right >(); }

    Left &left() { return this->template get< Left >(); }
    Right &right() { return this->template get< Right >(); }

    const Left &left() const { return this->template get< Left >(); }
    const Right &right() const { return this->template get< Right >(); }
};

// a pointer-like structure which can, however store values a value or a
// referrence to type T
template< typename T >
struct RefOrVal {
    static_assert( !std::is_reference< T >::value, "T must not be a reference type" );

    RefOrVal() : _store( InPlace< T >() ) { }
    RefOrVal( T &&val ) : _store( std::forward< T >( val ) ) { }
    RefOrVal( T *ref ) : _store( ref ) { }
    RefOrVal( T &ref ) : _store( &ref ) { }

    RefOrVal &operator=( const RefOrVal & ) = default;
    RefOrVal &operator=( RefOrVal && ) = default;
    RefOrVal &operator=( T &v ) { _store = v; return *this; }
    RefOrVal &operator=( T &&v ) { _store = std::move( v ); return *this; }
    RefOrVal &operator=( T *ptr ) { _store = ptr; return *this; }

    T *ptr() {
        ASSERT( !_store.empty() );
        auto *val = _store.template asptr< T >();
        return val ? val : _store.template get< T * >();
    }
    const T *ptr() const {
        ASSERT( !_store.empty() );
        const auto *val = _store.template asptr< T >();
        return val ? val : _store.template get< T * >();
    }

    T *operator->() { return ptr(); }
    T &operator*() { return *ptr(); }
    const T *operator->() const { return ptr(); }
    const T &operator*() const { return *ptr(); }

  private:
    Union< T, T * > _store;
};

template< typename Fn, typename R = typename std::result_of< Fn() >::type >
struct Lazy {

    Lazy( Fn &&fn ) : _fn( std::forward< Fn >( fn ) ), _val() { }

    R &get() {
        if ( _val.empty() )
            _val = _fn();
        return _val.template get< R >();
    }

    R &operator*() { return get(); }
    R *operator->() { return &get(); }

  private:
    Fn _fn;
    Union< R > _val;
};

template< typename Fn, typename R = typename std::result_of< Fn() >::type >
Lazy< Fn, R > lazy( Fn &&fn ) { return Lazy< Fn, R >( std::forward< Fn >( fn ) ); }

template< template< typename > class C, typename T, typename F >
using FMap = C< typename std::result_of< F( T ) >::type >;

template< typename T >
struct NewType
{
    T _value;

    template< typename X > using FMap = NewType< X >;
    NewType() noexcept {}
    NewType( const T &t ) noexcept : _value( t ) {}

    T &unwrap() { return _value; }
    const T &unwrap() const { return _value; }
};

template< typename T >
struct Wrapper : NewType< T >
{
    Wrapper() = default;
    Wrapper( const T &t ) : NewType< T >( t ) {}
    operator T() { return this->unwrap(); }
    T &value() { return this->unwrap(); }
    T &operator*() { return this->unwrap(); }
    T *operator->() { return &this->unwrap(); }
};

template< template< typename > class C, typename S, typename F >
auto fmap( F, C< S > n ) -> decltype( FMap< C, S, F >( n.unwrap() ) ) {
    return FMap< C, S, F >( n.unwrap() );
}

template< typename T >
struct IsUnion : std::false_type { };

template< typename... Ts >
struct IsUnion< Union< Ts... > > : std::true_type { };

template< typename A, typename B >
struct _OneUnion : std::enable_if<
                       ( IsUnion< A >::value || IsUnion< B >::value )
                       && !(IsUnion< A >::value && IsUnion< B >::value ),
                   bool > { };

template< typename A, typename B >
auto operator==( const A &a, const B &b ) ->
    typename std::enable_if< IsUnion< A >::value && !IsUnion< B >::value, bool >::type
{
    return a.template is< B >() && a.template get< B >() == b;
}

template< typename A, typename B >
auto operator==( const A &a, const B &b ) ->
    typename std::enable_if< !IsUnion< A >::value && IsUnion< B >::value, bool >::type
{ return b == a; }


template< typename A, typename B >
auto operator<( const A &a, const B &b ) ->
    typename std::enable_if< IsUnion< A >::value && !IsUnion< B >::value, bool >::type
{
    return a.discriminator() < a.template discriminator< B >()
        || (a.template is< B >() && a.template get< B >() < b);
}

template< typename A, typename B >
auto operator<( const A &a, const B &b ) ->
    typename std::enable_if< !IsUnion< A >::value && IsUnion< B >::value, bool >::type
{
    return b.template discriminator< A >() < b.discriminator()
        || (b.template is< A >() && a < b.template get< A >());
}

template< typename A, typename B >
auto operator!=( const A &a, const B &b ) -> typename _OneUnion< A, B >::type
{ return !(a == b); }

template< typename A, typename B >
auto operator<=( const A &a, const B &b ) -> typename _OneUnion< A, B >::type
{ return a < b || a == b; }

template< typename A, typename B >
auto operator>( const A &a, const B &b ) -> typename _OneUnion< A, B >::type
{ return b < a; }

template< typename A, typename B >
auto operator>=( const A &a, const B &b ) -> typename _OneUnion< A, B >::type
{ return b <= a; }

template< typename... Fs >
struct Overloaded;

template< typename F, typename... Fs >
struct Overloaded< F, Fs... > : F, Overloaded< Fs... >
{
    template< typename Ff, typename... Ffs >
    Overloaded( Ff &&f, Ffs &&...fs ) :
        F( std::forward< Ff >( f ) ),
        Overloaded< Fs... >( std::forward< Ffs >( fs )... )
    { }
    using F::operator();
    using Overloaded< Fs... >::operator();
};

template< typename F >
struct Overloaded< F > : F
{
    template< typename Ff >
    Overloaded( Ff &&f ) :
        F( std::forward< Ff >( f ) )
    { }
    using F::operator();
};

template< typename F, typename... Fs >
auto overloaded( F &&f, Fs &&...fs ) {
    using O = Overloaded< std::remove_reference_t< F >, std::remove_reference_t< Fs >... >;
    return O( std::forward< F >( f ), std::forward< Fs >( fs )... );
}

#ifdef BRICK_TYPES_HAS_MATCH

/* Works similarly to std::visit, except it takes only one variant and any
 * number of callable objects which are combined together to create one
 * callable object with overloads of operator() corresponding to all given
 * callables.
 * That is, visit_alternatives( v, fs... ) calls the function from fs which best
 * matches the type stored in the variant v.
 */
template< typename Variant, typename... Fs >
auto visit_alternatives( Variant &&v, Fs &&...fs ) {
    return std::visit( overloaded( std::forward< Fs >( fs )... ), v );
}

namespace _impl {

template< typename T >
using OptV = std::conditional_t< std::is_same< T, void >::value, bool, std::optional< T > >;

template< typename, typename > struct AppliedHelper;

template< template< typename ... > class Variant, typename... Ts, typename F >
struct AppliedHelper< Variant< Ts... >, F > {
    using T = OptV< typename _impl::ApplyResult< F, Ts... >::Result >;
};

template< typename R, typename F >
struct Match1
{
    Match1( F &&f ) : f( std::forward< F >( f ) ) { }

    template< typename T,
              typename = decltype( std::declval< F >()( std::declval< T >() ) ) >
    R match( T &&x, Witness< bool >, Preferred ) {
        f( std::forward< T >( x ) );
        return true;
    }

    template< typename T, typename W,
              typename = decltype( R( std::declval< F >()( std::declval< T >() ) ) ) >
    R match( T &&x, W, Preferred ) {
        return R{ f( std::forward< T >( x ) ) };
    }

    template< typename T, typename W >
    R match( T &&, W, NotPreferred ) { return R{}; }

    template< typename T >
    R operator()( T &&x ) {
        return match( std::forward< T >( x ), Witness< R >(), Preferred() );
    }

    F f;
};

template< typename V >
bool has_value( const V &v ) { return v.has_value(); }

inline bool has_value( bool v ) { return v; }

template< typename R, typename Variant >
R match( Variant && ) { return R{}; }

template< typename R, typename Variant, typename F, typename... Fs >
R match( Variant &&v, F &&f, Fs &&...fs )
{
    auto r = std::visit( Match1< R, F >( std::forward< F >( f ) ), v );
    if ( has_value( r ) )
        return r;
    else
        return match< R >( std::forward< Variant >( v ), std::forward< Fs >( fs )... );
}

}

/* A type-based patter matching on std::variant, accepts a variant and any
 * number of callables.
 * Uses the first callable that can be called with the current value of the
 * variant.
 * The return value is derived from the fisrt callable, if it returns R, the
 * return value will be std::optional< R >, nullopt meaning no callable was
 * matched.
 * If the return value of the first callable is void, match returns bool (false
 * means not matched).
 * Compared to visit_alternatives, this function is slower as it goes through
 * the callable one by one from the first to the last.
 */
template< typename Variant, typename F, typename... Fs >
auto match( Variant &&v, F &&f, Fs &&...fs )
{
    using R = typename _impl::AppliedHelper< std::remove_reference_t< Variant >,
                                             std::remove_reference_t< F > >::T;
    return _impl::match< R >( std::forward< Variant >( v ),
                              std::forward< F >( f ), std::forward< Fs >( fs )... );
}

#endif // C++17

#endif // C++11

}
}

// don't catch integral types and classical enum!
template< typename Self, typename = typename
          std::enable_if< brick::types::is_enum_class< Self >::value >::type >
constexpr brick::types::StrongEnumFlags< Self > operator|( Self a, Self b ) noexcept {
    using Ret = brick::types::StrongEnumFlags< Self >;
    return Ret( a ) | Ret( b );
}

template< typename Self, typename = typename
          std::enable_if< brick::types::is_enum_class< Self >::value >::type >
constexpr brick::types::StrongEnumFlags< Self > operator&( Self a, Self b ) noexcept {
    using Ret = brick::types::StrongEnumFlags< Self >;
    return Ret( a ) & Ret( b );
}

namespace brick {
namespace t_types {

using namespace types;

struct Integer : Comparable
{
    int val;
    Integer( int val ) : val( val ) { }
    bool operator<( const Integer& o ) const { return val < o.val; }
};

struct IntegerEq : Eq {
    int val;
    IntegerEq( int val ) : val( val ) { }
    bool operator==( const IntegerEq& o ) const { return val == o.val; }
};

struct IntegerEqOrd : Ord {
    int val;
    IntegerEqOrd( int val ) : val( val ) { }
    bool operator==( const IntegerEqOrd& o ) const { return val == o.val; }
    bool operator<( const IntegerEqOrd& o ) const { return val < o.val; }
};

struct IntegerOrd : Ord {
    int val;
    IntegerOrd( int val ) : val( val ) { }
    bool operator<( const IntegerOrd& o ) const { return val < o.val; }
};

struct IntegerEqOrdChild : IntegerEqOrd {
    using IntegerEqOrd::IntegerEqOrd;
};

struct IntegerAsTuple : Ord {
    int val;
    explicit IntegerAsTuple( int val ) : val( val ) { }
    auto as_tuple() const { return std::tie( val ); }
};

struct Mixins {

    template< typename T >
    void eq() {
        T i10(10);
        T i10a(10);
        T i20(20);

        ASSERT(i10 != i20);
        ASSERT(!(i10 != i10a));

        ASSERT(i10 == i10a);
        ASSERT(!(i10 == i20));
    }

    template< typename T >
    void ord() {
        T i10(10);
        T i10a(10);
        T i20(20);

        ASSERT(i10 <= i10a);
        ASSERT(i10a <= i10);
        ASSERT(i10 <= i20);
        ASSERT(! (i20 <= i10));

        ASSERT(i10 < i20);
        ASSERT(!(i20 < i10));
        ASSERT(!(i10 < i10a));

        ASSERT(i20 > i10);
        ASSERT(!(i10 > i20));
        ASSERT(!(i10 > i10a));

        ASSERT(i10 >= i10a);
        ASSERT(i10a >= i10);
        ASSERT(i20 >= i10);
        ASSERT(! (i10 >= i20));
    }

    TEST(comparable) {
        eq< Integer >();
        ord< Integer >();
    }

    TEST(eq) {
        eq< IntegerEq >();
    }

    TEST(ord) {
        eq< IntegerOrd >();
        ord< IntegerOrd >();
    }

    TEST(eqord) {
        eq< IntegerEqOrd >();
        ord< IntegerEqOrd >();
    }

    TEST(eqord_child) {
        eq< IntegerEqOrdChild >();
        ord< IntegerEqOrdChild >();
    }

    TEST(eqod_as_tuple) {
        eq< IntegerAsTuple >();
        ord< IntegerAsTuple >();
    }
};

#if __cplusplus >= 201103L

struct A { };
struct B { B() { }; ~B() { } };
struct C { int x; C( int x ) : x( x ) {} C() : x( 0 ) {} };

static_assert( _impl::In< int, int >::value, "" );
static_assert( _impl::In< A, A, B >::value, "" );
static_assert( _impl::In< A, B, A >::value, "" );

// test instances
struct UnionInstances {
    Union<> a;
    Union< int, long > b;
    Union< int, long, A > c;
    Union< int, long, A, B > d;
    Union< int, long, A, B, std::string > e;
};

struct UnionTest
{
    TEST(basic)
    {
        Union< int > u( 1 );
        ASSERT( !u.empty() );
        ASSERT( u.template is< int >() );
        ASSERT_EQ( u.template get< int >(), 1 );
        u = 2; // move
        ASSERT( !u.empty() );
        ASSERT_EQ( u.template get< int >(), 2 );
        int i = 3;
        u = i; // copy
        ASSERT( !u.empty() );
        ASSERT_EQ( u.template get< int >(), 3 );
        u = types::Union< int >( 4 );
        ASSERT( u.template is< int >() );
        ASSERT_EQ( u.get< int >(), 4 );
        u = types::Union< int >();
        ASSERT( u.empty() );
        ASSERT( !u.template is< int >() );
        u = 5;
        ASSERT( !u.empty() );
        ASSERT( u.template is< int >() );
        ASSERT_EQ( u.template get< int >(), 5 );
    }

    TEST(moveNoCopy) {
        // if one of contained structures does not define copy ctor+assignment
        // move should still be available
        struct Move {
            Move() = default;
            Move( const Move & ) = delete;
            Move( Move && ) = default;

            Move &operator=( Move ) { return *this; }
        };
        Union< long, Move > wierd;
        ASSERT( wierd.empty() );

        wierd = 2L;
        ASSERT( !wierd.empty() );
        ASSERT( wierd.template is< long >() );
        ASSERT_EQ( wierd.template get< long >(), 2L );

        wierd = Move();
        ASSERT( !wierd.empty() );
        ASSERT( wierd.template is< Move >() );
    }

    TEST(ctorCast) {
        ASSERT( ( Union< int, long >{ int( 1 ) }.template is< int >() ) );
        ASSERT( ( Union< int, long >{ long( 1 ) }.template is< long >() ) );

        ASSERT( ( Union< long, std::string >{ int( 1 ) }.template is< long >() ) );

        struct A { operator int(){ return 1; } };
        ASSERT( ( Union< int, A >{ A() }.template is< A >() ) );
        ASSERT( ( Union< int, std::string >{ A() }.template is< int >() ) );

        struct B { B( int ) { } B() = default; };
        ASSERT( ( Union< int, B >{ B() }.template is< B >() ) );
        ASSERT( ( Union< int, B >{ 1 }.template is< int >() ) );
        ASSERT( ( Union< B, std::string >{ 1 }.template is< B >() ) );
    }

    static C idC( C c ) { return c; }
    static C constC( B ) { return C( 32 ); }
    static C refC( C &c ) { return c; }

    TEST(apply) {
        Union< B, C > u;
        u = B();

        Maybe< C > result = u.match( idC, constC );
        ASSERT( !result.isNothing() );
        ASSERT_EQ( result.value().x, 32 );

        u = C( 12 );
        result = u.match( idC, constC );
        ASSERT( !result.isNothing() );
        ASSERT_EQ( result.value().x, 12 );

        result = u.match( constC );
        ASSERT( result.isNothing() );

        result = u.match( refC );
        ASSERT_EQ( result.value().x, 12 );
    }

    TEST(eq) {
        Union< int, long > u{ 1 };
        Union< int, long > v{ 2 };
        Union< int, long > w{ 2l };

        ASSERT( u == u );
        ASSERT( u != v );
        ASSERT( v != w );
        ASSERT( u != w );

        ASSERT( u == 1 );
        ASSERT( v == 2 );
        ASSERT( w == 2l );

        ASSERT( u != 1l );
        ASSERT( v != 2l );
        ASSERT( w != 2 );
    }

    TEST(ord) {
        Union< int, long > u{ 1 };
        Union< int, long > v{ 2 };
        Union< int, long > w{ 2l };

        ASSERT( u < v );
        ASSERT( !(v < u) );
        ASSERT( u < w );
        ASSERT( !(w < u) );
        ASSERT( v < w );
        ASSERT( !(w < v) );

        ASSERT( u <= 1 );
        ASSERT( v > 1 );
        ASSERT( w > 1 );

        ASSERT( u < 1l );
        ASSERT( v < 1l );
        ASSERT( w > 1l );

        ASSERT( u < 2 );
        ASSERT( v <= 2 );
        ASSERT( w > 2 );

        ASSERT( u < 2l );
        ASSERT( v < 2l );
        ASSERT( w <= 2l );
    }

    struct TrackDtor {
        TrackDtor( int *cnt ) : cnt( cnt ) { }
        ~TrackDtor() { ++*cnt; }
        int *cnt;
    };

    TEST(dtor) {
        int cnt = 0;
        {
            Union< int, TrackDtor > u;
            u = TrackDtor( &cnt );
            cnt = 0;
        }
        ASSERT_EQ( cnt, 1 );
    }

    TEST(assing_dtor) {
        int cnt = 0;
        Union< int, TrackDtor > u;
        u = TrackDtor( &cnt );
        cnt = 0;
        u = 1;
        ASSERT_EQ( cnt, 1 );
    }
};

enum class FA : unsigned char  { X = 1, Y = 2, Z = 4 };
enum class FB : unsigned short { X = 1, Y = 2, Z = 4 };
enum class FC : unsigned       { X = 1, Y = 2, Z = 4 };
enum class FD : unsigned long  { X = 1, Y = 2, Z = 4 };

struct StrongEnumFlagsTest {
    template< typename Enum >
    void testEnum() {
        StrongEnumFlags< Enum > e1;
        StrongEnumFlags< Enum > e2( Enum::X );

        ASSERT( !e1 );
        ASSERT( e2 );

        ASSERT( e1 | e2 );
        ASSERT( Enum::X | Enum::Y );
        ASSERT( e2 | Enum::Z );
        ASSERT( e2.has( Enum::X ) );

        ASSERT( e2 & Enum::X );
        ASSERT( !( Enum::X & Enum::Y ) );

        ASSERT( Enum::X | Enum::Y | Enum::Z );
        ASSERT( !( Enum::X & Enum::Y & Enum::Z ) );
        ASSERT( ( Enum::X | Enum::Y | Enum::Z ) & Enum::X );
    }

    // we don't want to break classical enums and ints by out operators
    TEST(regression) {
        enum Classic { C_X = 1, C_Y = 2, C_Z = 4 };

        ASSERT( C_X | C_Y | C_Z );
        ASSERT( 1 | 2 | 4 );
        ASSERT( C_X & 1 );
    }

    TEST(enum_uchar) { testEnum< FA >(); }
    TEST(enum_ushort) { testEnum< FB >(); }
    TEST(enum_uint) { testEnum< FC >(); }
    TEST(enum_ulong) { testEnum< FD >(); }
};

struct OverloadedTest {

    TEST(basic) {
        auto x = overloaded( []( int x ) { return x + 1; } )( 0 );
        ASSERT_EQ( x, 1 );
        ASSERT( std::is_same< decltype( x ), int >::value );

        auto f = overloaded( []( int ) -> int { return 0; },
                             []( long ) -> long { return 1; },
                             []( short ) -> short { return 2; } );
        ASSERT_EQ( f( 0 ), 0 );
        ASSERT_EQ( f( long( 0 ) ), 1 );
        ASSERT_EQ( f( short( 0 ) ), 2 );

        ASSERT( std::is_same< decltype( f( int( 0 ) ) ), int >::value );
        ASSERT( std::is_same< decltype( f( long( 0 ) ) ), long >::value );
        ASSERT( std::is_same< decltype( f( short( 0 ) ) ), short >::value );
    }

    TEST(cast) {
        auto f1 = overloaded( []( long ) { return 0; },
                              []( std::string ) { return 1; } );
        ASSERT_EQ( f1( 0 ), 0 );
        ASSERT_EQ( f1( "ahoj" ), 1 );

        auto f2 = overloaded( []( long ) { return 0; },
                              []( auto && ) { return 1; } );
        ASSERT_EQ( f2( 0 ), 1 );
        ASSERT_EQ( f2( long( 0 ) ), 0 );
    }
};

#ifdef BRICK_TYPES_HAS_MATCH

struct VisitAlternativesTest {
    TEST(basic_void) {
        using namespace std::literals;

        std::variant< int, std::string > v{ "ahoj" };
        int m = 0;
        visit_alternatives( v, [&m]( int ) { m = 1; ASSERT( false ); },
                               [&m]( std::string &x ) { m = 2; ASSERT_EQ( x, "ahoj"s ); } );
        ASSERT_EQ( m, 2 );

        m = 0;
        visit_alternatives( v, [&m]( std::string &x ) { m = 2; ASSERT_EQ( x, "ahoj"s ); },
                               [&m]( int ) { m = 1; ASSERT( false ); } );
        ASSERT_EQ( m, 2 );
    }

    TEST(basic_ret) {
        using namespace std::literals;

        std::variant< int, std::string > v{ "ahoj" };
        auto x = visit_alternatives( v, []( int ) { ASSERT( false ); return 1; },
                                        []( std::string &x ) { ASSERT_EQ( x, "ahoj"s ); return 2; } );
        ASSERT_EQ( x, 2 );

        x = visit_alternatives( v, []( std::string &x ) { ASSERT_EQ( x, "ahoj"s ); return 2; },
                                   []( int ) { ASSERT( false ); return 1; } );
        ASSERT_EQ( x, 2 );
    }

    TEST(templated) {
        std::variant< int, long, std::string > v{ long( 1 ) };
        auto x = visit_alternatives( v, []( int ) { return 1; },
                                        []( std::string & ) { return 2; },
                                        []( auto && ) { return 3; } );
        ASSERT_EQ( x, 3 );

        v = 1;
        x = visit_alternatives( v, []( int ) { return 1; },
                                   []( std::string & ) { return 2; },
                                   []( auto && ) { return 3; } );
        ASSERT_EQ( x, 1 );
    }
};

struct MatchTest {

    TEST(basic_void) {
        using namespace std::literals;

        std::variant< int, std::string > v{ "ahoj" };
        int m = 0;
        auto x = match( v, [&m]( int ) { m = 1; ASSERT( false ); },
                           [&m]( std::string &x ) { m = 2; ASSERT_EQ( x, "ahoj"s ); } );
        ASSERT_EQ( m, 2 );
        ASSERT( std::is_same< decltype( x ), bool >::value );
        ASSERT( x );

        m = 0;
        x = match( v, [&m]( std::string &x ) { m = 2; ASSERT_EQ( x, "ahoj"s ); },
                      [&m]( int ) { m = 1; ASSERT( false ); } );
        ASSERT_EQ( m, 2 );
        ASSERT( x );
    }

    TEST(basic_ret) {
        using namespace std::literals;

        std::variant< int, std::string > v{ "ahoj" };
        auto x = match( v, []( int ) { ASSERT( false ); return 1; },
                           []( std::string &x ) { ASSERT_EQ( x, "ahoj"s ); return 2; } );
        ASSERT( x.has_value() );
        ASSERT_EQ( x.value(), 2 );

        x = match( v, []( std::string &x ) { ASSERT_EQ( x, "ahoj"s ); return 2; },
                      []( int ) { ASSERT( false ); return 1; } );
        ASSERT( x.has_value() );
        ASSERT_EQ( x.value(), 2 );
    }

    TEST(order) {
        std::variant< long, int, std::string > v{ 1 };
        auto x = match( v, []( std::string & ) { return 1; },
                           []( long ) { return 2; },
                           []( int ) { return 3; } );
        ASSERT( x.has_value() );
        ASSERT_EQ( x.value(), 2 );
    }
};

#endif // BRICK_TYPES_HAS_MATCH

#endif // C++11

}
}


// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab ft=cpp
