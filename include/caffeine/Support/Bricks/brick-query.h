// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * Utilities for querying data collections uniformly
 */

/*
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

#include <algorithm>
#include <numeric>
#include <type_traits>
#include <iterator>
#include <memory>
#include <vector>
#include <map>
#include <set>
#include <unordered_set>
#include <deque> // for tests
#include <cstddef>

#include <brick-assert.h>

namespace brick {
namespace query {

template< typename It >
struct _ValueType { using Type = typename It::value_type; };

template< typename T >
struct _ValueType< T * > { using Type = T; };

template< typename T, bool isConst >
struct _HasIterator {
    template< typename C > static int64_t check( typename C::iterator * );
    template< typename C > static int8_t check( ... );
    template< typename C > static int64_t checkconst( typename C::const_iterator * );
    template< typename C > static int8_t checkconst( ... );

    static constexpr bool value = isConst
        ? sizeof( checkconst< T >( nullptr ) ) == sizeof( int64_t )
        : sizeof( check< T >( nullptr ) ) == sizeof( int64_t );
};

static_assert( _HasIterator< std::vector< int >, false >::value, "" );
static_assert( !_HasIterator< int, false >::value, "" );

template< typename T, bool _false, bool isConst >
struct _GetIterator {
    using Type = typename std::conditional< isConst,
            typename std::decay< decltype( std::declval< const T & >().begin() ) >::type,
            typename std::decay< decltype( std::declval< T & >().begin() ) >::type >::type;
};

template< typename T >
struct _GetIterator< T, true, false > { using Type = typename T::iterator; };

template< typename T >
struct _GetIterator< T, true, true > { using Type = typename T::const_iterator; };

template< typename T >
using _Iterator = typename _GetIterator< T, _HasIterator< T, false >::value, false >::Type;

template< typename T >
using _ConstIterator = typename _GetIterator< T, _HasIterator< T, true >::value, true >::Type;

/* range; basically just a tuple of iterrators.
 * Use wrapper functions range/crange for construction.
 *
 * Itself behaves kind of like collection as it has begin()/end() and iterrators typedef.
 * Creating Range of Range gives range equivalent to original.
 */
template< typename InputIt >
struct Range {
    using Iterator = InputIt;
    using iterator = InputIt;
    using ValueType = typename _ValueType< InputIt >::Type;
    using value_type = ValueType;

    InputIt begin() { return _begin; }
    InputIt end() { return _end; }

    Range() = default;
    Range( InputIt begin, InputIt end ) : _begin( begin ), _end( end ) { }

    template< typename Collection,
        typename = typename std::enable_if< std::is_same< decltype( std::declval< Collection & >().begin() ), InputIt >::value >::type >
    explicit Range( Collection &col ) : Range( col.begin(), col.end() ) { }

    template< typename Collection,
        typename = typename std::enable_if< std::is_same< decltype( std::declval< const Collection & >().begin() ), InputIt >::value >::type >
    explicit Range( const Collection &col ) : Range( col.begin(), col.end() ) { }

  private:
    InputIt _begin;
    InputIt _end;
};

template< typename Collection >
auto range( Collection &col ) -> Range< _Iterator< Collection > > {
    return Range< _Iterator< Collection > >( col );
}

template< typename It >
auto range( It &&beg, It &&end ) -> Range< It > {
    return Range< It >( std::forward< It >( beg ), std::forward< It >( end ) );
}

template< typename T >
auto range( T *beg, T *end ) -> Range< T * > {
    return Range< T * >( beg, end );
}

template< typename Collection >
auto range( const Collection &col ) -> Range< _ConstIterator< Collection > > {
    return Range< _ConstIterator< Collection > >( col );
}

template< typename Collection >
auto crange( const Collection &col ) -> Range< _ConstIterator< Collection > > {
    return Range< _ConstIterator< Collection > >( col );
}

template< typename Collection >
auto reversed( Collection &col ) {
    return Range< typename Collection::reverse_iterator >( col.rbegin(), col.rend() );
}

template< typename Collection >
auto reversed( Collection &&col ) {
    struct R : Collection {
        R( Collection &&c ) : Collection( std::move( c ) ) { }

        using iterator = typename Collection::reverse_iterator;
        auto begin() { return Collection::rbegin(); }
        auto end() { return Collection::rend(); }
    };
    return R( std::move( col ) );
}

template< typename InputIt, typename UnaryPred >
bool all( InputIt first, InputIt last, UnaryPred pred ) {
    return std::all_of( first, last, pred );
}

template< typename Collection, typename UnaryPred >
bool all( const Collection &col, UnaryPred pred ) {
    return all( col.begin(), col.end(), pred );
}

template< typename InputIt, typename UnaryPred >
bool any( InputIt first, InputIt last, UnaryPred pred ) {
    return std::any_of( first, last, pred );
}

template< typename Collection, typename UnaryPred >
bool any( const Collection &col, UnaryPred pred ) {
    return any( col.begin(), col.end(), pred );
}

template< typename InputIt, typename UnaryPred >
bool none( InputIt first, InputIt last, UnaryPred pred ) {
    return std::none_of( first, last, pred );
}

template< typename Collection, typename UnaryPred >
bool none( const Collection &col, UnaryPred pred ) {
    return none( col.begin(), col.end(), pred );
}

template< typename Range, typename UnaryFn >
struct Map {
    Map() = default;
    Map( Range range, UnaryFn fn ) : _range( range ), _fn( fn ) { }

    using ValueType = decltype( std::declval< UnaryFn & >()( *std::declval< typename Range::iterator & >() ) );
    using BaseIterator = typename Range::iterator;

    struct Iterator : std::iterator< std::forward_iterator_tag, ValueType > {
        Iterator() : _map( nullptr ) { }
        Iterator( BaseIterator it, Map< Range, UnaryFn > *map ) :
            _it( it ), _map( map )
        { }

        friend bool operator==( const Iterator &a, const Iterator &b ) {
            return a._it == b._it;
        }
        friend bool operator!=( const Iterator &a, const Iterator &b ) {
            return !( a == b );
        }

        ValueType &operator*() { ASSERT( !end() ); evaluate(); return *_current; }
        ValueType *operator->() { ASSERT( !end() ); evaluate(); return _current.get(); }

        Iterator &operator++() {
            ++_it;
            _current = nullptr;
            return *this;
        }

        Iterator operator++( int ) {
            Iterator x = *this;
            ++(*this);
            return x;
        }

        void evaluate() {
            if ( !_current )
                _current = std::make_shared< ValueType >( _map->_fn( *_it ) );
        }

        bool end() const { return _it == _map->_range.end(); }

      private:
        BaseIterator _it;
        // it is kind of unfortunate to use shared_ptr here, but we have to
        // preserve instance accross copies, otherwise flatten (and possibly
        // other) will not work as nested collections/data structures would
        // be copyed.
        // This also makes Map lazy in value, which is good, but it would
        // be better if we could achieve this by Maybe/Optional.
        std::shared_ptr< ValueType > _current;
        Map< Range, UnaryFn > *_map;
    };

    Iterator begin() { return Iterator( _range.begin(), this ); }
    Iterator end() { return Iterator( _range.end(), this ); }

    using iterator = Iterator;
    using value_type = ValueType;

  private:
    Range _range;
    UnaryFn _fn;
};

template< typename Range, typename UnaryPred >
struct Filter {

    using ValueType =  typename _Iterator< Range >::value_type;
    using BaseIterator = _Iterator< Range >;

    Filter() = default;
    Filter( Range range, UnaryPred pred ) : _range( range ), _pred( pred ) { }

    struct Iterator : std::iterator< std::forward_iterator_tag, ValueType > {
        Iterator() : _filter( nullptr ) { }
        Iterator( BaseIterator it, Filter< Range, UnaryPred > *filter ) :
            _it( it ), _filter( filter )
        {
            _bump();
        }

        friend bool operator==( const Iterator &a, const Iterator &b ) {
            return a._it == b._it;
        }
        friend bool operator!=( const Iterator &a, const Iterator &b ) {
            return !( a == b );
        }

        auto operator*() -> decltype( *std::declval< BaseIterator & >() ) { return *_it; }
        auto operator->() -> decltype( std::declval< BaseIterator & >().operator->() ) { return &*_it; }

        Iterator &operator++() {
            ++_it;
            _bump();
            return *this;
        }

        Iterator operator++( int ) {
            Iterator x = *this;
            ++(*this);
            return x;
        }

        bool end() const { return _it == _filter->_range.end(); }

      private:
        BaseIterator _it;
        Filter< Range, UnaryPred > *_filter;

        void _bump() {
            while ( !end() && !_filter->_pred( *_it ) )
                ++_it;
        }
    };

    Iterator begin() { return Iterator( _range.begin(), this ); }
    Iterator end() { return Iterator( _range.end(), this ); }

    using iterator = Iterator;
    using value_type = ValueType;

  private:
    Range _range;
    UnaryPred _pred;
};

template< typename Range >
struct Flatten {

    using BaseIterator = typename Range::iterator;
    using SubIterator = _Iterator< typename Range::value_type >;
    using ValueType = typename _ValueType< SubIterator >::Type;

    Flatten() = default;
    Flatten( Range range ) : _range( range ) { }

    struct Iterator : std::iterator< std::forward_iterator_tag, ValueType > {
        Iterator() : _flatten( nullptr ) { }
        Iterator( BaseIterator it, Flatten< Range > *flatten ) :
            _it( it ), _flatten( flatten )
        {
            if ( !end() ) {
                _sub = _it->begin();
                _bump();
            }
        }

        friend bool operator==( const Iterator &a, const Iterator &b ) {
            return ( a.end() && b.end() ) || ( a._it == b._it && a._sub == b._sub );
        }
        friend bool operator !=( const Iterator &a, const Iterator &b ) {
            return !( a == b );
        }

        ValueType &operator*() { return *_sub; }
        const ValueType &operator*() const { return *_sub; }
        ValueType *operator->() { return &*_sub; }
        const ValueType *operator->() const { return &*_sub; }

        Iterator &operator++() {
            ++_sub;
            _bump();
            return *this;
        }

        Iterator operator++( int ) {
            Iterator x = *this;
            ++(*this);
            return x;
        }

        bool end() const { return _it == _flatten->_range.end(); }

      private:
        BaseIterator _it;
        SubIterator _sub;
        Flatten< Range > *_flatten;

        void _bump() {
            while ( !end() && _sub == _it->end() ) {
                ++_it;
                if ( !end() )
                    _sub = _it->begin();
            }
        }
    };

    Iterator begin() { return Iterator( _range.begin(), this ); }
    Iterator end() { return Iterator( _range.end(), this ); }

    using iterator = Iterator;
    using value_type = ValueType;

  private:
    Range _range;
};

template< typename Container >
Flatten< Range< typename Container::iterator > > flatten( Container &r ) {
    return { { r.begin(), r.end() } };
}


template< typename Container,
    typename = typename std::enable_if< std::is_rvalue_reference< Container && >::value >::type >
Flatten< Container > flatten( Container &&r ) { return { std::move( r ) }; }

template< typename It >
Flatten< Range< It > > flatten( Range< It > r ) { return { r }; }

template< typename It >
Flatten< Range< It > > flatten( It begin, It end ) {
    return { { begin, end } };
}

template< typename Range1, typename Range2 >
struct Append {

    using It1 = typename Range1::iterator;
    using It2 = typename Range2::iterator;
    static_assert( std::is_same< typename Range1::value_type, typename Range2::value_type >::value,
                   "Both ranges in append must have same value_type" );
    using ValueType = typename Range1::value_type;

    Append() = default;
    Append( Range1 range1, Range2 range2 ) : _range1( range1 ), _range2( range2 ) { }

    struct Iterator : std::iterator< std::forward_iterator_tag, ValueType > {
        Iterator() : _append( nullptr ) { }
        Iterator( const Iterator &o ) :
            _it1( o._it1 ? new It1( *o._it1 ) : nullptr ),
            _it2( o._it2 ? new It2( *o._it2 ) : nullptr ),
            _append( o._append )
        { }

        Iterator( It1 it1, It2 it2, Append *append ) :
            _it1( new It1( it1 ) ), _it2( new It2( it2 ) ), _append( append )
        {
            if ( it1 == _append->_range1.end() )
                _it1.reset();
        }
        Iterator( It2 it2, Append *append ) :
            _it1( nullptr ), _it2( new It2( it2 ) ), _append( append )
        { }

        friend bool operator==( const Iterator &a, const Iterator &b ) {
            return peq( a._it1, b._it1 ) && peq( a._it2, b._it2 );
        }
        friend bool operator !=( const Iterator &a, const Iterator &b ) {
            return !( a == b );
        }

        ValueType &operator*() { return _it1 ? **_it1 : **_it2; }
        const ValueType &operator*() const { return _it1 ? **_it1 : **_it2; }
        ValueType *operator->() { return &**this; }
        const ValueType *operator->() const { return &**this; }

        Iterator &operator++() {
            if ( _it1 ) {
                ++(*_it1);
                if ( *_it1 == _append->_range1.end() )
                    _it1.reset();
            } else {
                ASSERT( !!_it2 );
                ASSERT( *_it2 != _append->_range2.end() );
                ++(*_it2);
            }
            return *this;
        }

        Iterator operator++( int ) {
            Iterator x = *this;
            ++(*this);
            return x;
        }

      private:
        std::unique_ptr< It1 > _it1;
        std::unique_ptr< It2 > _it2;
        Append *_append;

        template< typename P >
        static bool peq( const P &a, const P &b ) {
            return (!a && !b) || (a && b && *a == *b);
        }
    };

    Iterator begin() { return Iterator( _range1.begin(), _range2.begin(), this ); }
    Iterator end() { return Iterator( _range2.end(), this ); }

    using iterator = Iterator;
    using value_type = ValueType;

  private:
    Range1 _range1;
    Range2 _range2;
};

template< typename Range >
struct Query {
    Query() = default;
    Query( const Query & ) = default;
    Query( Query & ) = default; // avoid vararg constructor to precede non-const copy
    Query( Query && ) = default;

    template< typename... Args >
    Query( Args &&... args ) : _range( std::forward< Args >( args )... ) { }

    using Iterator = typename Range::iterator;
    using iterator = Iterator;
    using ValueType = typename Range::value_type;
    using value_type = ValueType;

    template< typename UnaryPred >
    bool all( UnaryPred pred ) {
        return query::all( _range.begin(), _range.end(), pred );
    }

    template< typename UnaryPred >
    bool any( UnaryPred pred ) {
        return query::any( _range.begin(), _range.end(), pred );
    }

    template< typename UnaryPred >
    bool none( UnaryPred pred ) {
        return query::none( _range.begin(), _range.end(), pred );
    }

    template< typename UnaryFn >
    auto map( UnaryFn fn ) -> Query< Map< Range, UnaryFn > > {
        return Query< Map< Range, UnaryFn > >( _range, fn );
    }

    template< typename UnaryPred >
    auto filter( UnaryPred pred ) -> Query< Filter< Range, UnaryPred > > {
        return Query< Filter< Range, UnaryPred > >( _range, pred );
    }

    auto flatten() -> Query< Flatten< Range > > {
        return Query< Flatten< Range > >( _range );
    }

    template< typename Range2 >
    auto append( Range2 range ) -> Query< Append< Range, Range2 > > {
        return Query< Append< Range, Range2 > >( _range, range );
    }

    template< typename UnaryFn >
    auto concatMap( UnaryFn fn ) -> Query< Flatten< Map< Range, UnaryFn > > > {
        return map( fn ).flatten();
    }

    auto freeze() -> std::vector< ValueType > {
        // slower vector creation, but guarantees range is iterated only once
        std::vector< ValueType > vec;
        std::copy( begin(), end(), std::back_inserter( vec ) );
        return vec;
    }

    template< typename Target >
    auto freezeAs() -> Target {
        return Target( _range.begin(), _range.end() );
    }

    ptrdiff_t size() { return std::distance( begin(), end() ); }

    template< typename UnaryFn >
    Query &forall( UnaryFn fn ) {
        for ( auto &a : _range )
            fn( a );
        return *this;
    }

    template< typename KeySelect,
        typename Key = typename std::result_of< KeySelect( ValueType & ) >::type >
    auto groupBy( KeySelect fn ) -> Query< std::map< Key, std::vector< ValueType > > >
    {
        std::map< Key, std::vector< ValueType > > map;
        for ( auto &a : _range )
            map[ fn( a ) ].push_back( a );
        return Query< std::map< Key, std::vector< ValueType > > >( std::move( map ) );
    }

    template< typename T, typename BinaryOperation >
    T fold( T init, BinaryOperation op ) {
        return std::accumulate( begin(), end(), init, op );
    }

    template< typename VT = ValueType, typename = decltype( VT( 0 ) + VT( 0 ) ) >
    VT sum() {
        return fold( VT( 0 ), []( const VT &acc, const VT &val ) { return acc + val; } );
    }

    template< typename X >
    using Copyable = typename std::enable_if< std::is_copy_constructible< X >::value >::type;

    template< typename VT = ValueType, typename = Copyable< VT > >
    VT minOr( VT x ) {
        auto it = std::min_element( begin(), end() );
        if ( it == end() )
            return x;
        return *it;
    }

    template< typename VT = ValueType, typename = Copyable< VT > >
    VT maxOr( VT x ) {
        auto it = std::max_element( begin(), end() );
        if ( it == end() )
            return x;
        return *it;
    }
/*
    auto sort() -> Query< std::set< ValueType > > {
        return Query< std::set< ValueType > >( begin(), end() );
    }

    ValueType median() {
        auto sorted = sort();
        auto la = sorted.begin(),
             ib = la++,
             ie = sorted.end();
        --ie;
        while ( ib != ie && la != ie ) {
            --ie;
            ib = la++;
        }
        if ( ib == ie )
            return *ib;
        return (*ib + *ie) / ValueType( 2 );
    }
    */

    auto unstableUnique() -> Query< std::unordered_set< ValueType > > {
        return Query< std::unordered_set< ValueType > >( begin(), end() );
    }

    template< typename VT = ValueType, typename = Copyable< VT > >
    VT average() {
        ValueType sum;
        ptrdiff_t size;
        std::tie( sum, size ) = fold( { ValueType(), 0 },
                []( std::tuple< ValueType, ptrdiff_t > acc, const ValueType &val ) {
                    return std::make_tuple( std::get< 0 >( acc ) + val, std::get< 1 >( acc ) + 1 );
                } );
        return sum / ValueType( size );
    }

    template< typename VT = ValueType, typename = Copyable< VT > >
    VT min() { return *std::min_element( begin(), end() ); }
    template< typename VT = ValueType, typename = Copyable< VT > >
    VT max() { return *std::max_element( begin(), end() ); }

    template< typename Map, typename FindResult, typename R = typename std::result_of< Map( ValueType & ) >::type >
    struct FindMapResult {
        FindMapResult( FindResult find, Map map ) : find( find ), map( map ) { }

        FindResult find;
        Map map;

        R get() { return map( find.get() ); }
        R getOr( R x ) { return find.found ? get() : x; }
    };

    struct FindResult {
        FindResult( Iterator it, long pos ) : iter( it ), pos( pos ), found( true ) { }
        explicit FindResult( Iterator end ) : iter( end ), pos( -1 ), found( false ) { }

        Iterator iter;
        const long pos;
        const bool found;

        ValueType &get() { return *iter; }
        ValueType getOr( ValueType x ) { return found ? get() : x; }

        template< typename Map >
        FindMapResult< Map, FindResult > map( Map map ) {
            return FindMapResult< Map, FindResult >{ *this, map };
        }
    };

    template< typename Pred >
    FindResult find( Pred pred ) {
        return find( pred, begin(), end() );
    }

    template< typename Pred >
    FindResult find( Pred pred, Iterator i, const Iterator e ) {
        long pos = 0;
        for ( ; i != e; ++i  ) {
            if ( pred( *i ) )
                return FindResult{ i, pos };
            ++pos;
        }
        return FindResult{ end() };
    }

    // find first occurence satisfying 'what' strictly before first occurence
    // satisfying 'before', if occurence satisfying 'before' is not found
    // this is equivalent to 'find'
    template< typename What, typename Before >
    FindResult findBefore( What what, Before before ) {
        return find( what, begin(), find( before ).iter );
    }

    FindResult singleton() {
        if ( !empty() && std::next( begin() ) == end() )
            return FindResult{ begin(), 0 };
        return FindResult{ end() };
    }

    bool empty() { return begin() == end(); }

    Iterator begin() { return _range.begin(); }
    Iterator end() { return _range.end(); }

  protected:
    Range _range;
};

template< typename Collection >
auto query( Collection &col ) -> Query< Range< _Iterator< Collection > > > {
    return Query< Range< _Iterator< Collection > > >( range( col ) );
}

template< typename Collection >
auto query( const Collection &col ) -> Query< Range< _ConstIterator< Collection > > > {
    return Query< Range< _ConstIterator< Collection > > >( crange( col ) );
}

template< typename Collection >
auto cquery( const Collection &col ) -> Query< Range< _ConstIterator< Collection > > > {
    return Query< Range< _ConstIterator< Collection > > >( crange( col ) );
}

template< typename It >
auto query( It &&begin, It &&end ) -> Query< Range< It > > {
    return Query< Range< It > >( std::forward< It >( begin ), std::forward< It >( end ) );
}

template< typename Collection >
auto owningQuery( typename std::remove_reference< Collection >::type &&col )
    -> Query< typename std::remove_reference< Collection >::type >
{
    return Query< typename std::remove_reference< Collection >::type >(
            std::forward< Collection >( col ) );
}

template< typename Collection >
auto owningQuery( Collection col ) -> Query< Collection > {
    return Query< typename std::remove_reference< Collection >::type >(
            std::forward< Collection >( col ) );
}


}

namespace t_query {

struct Range {
    TEST(range) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        auto range = query::range( vec );
        static_assert( std::is_same< int, decltype( range )::iterator::value_type >::value, "types" );
        auto rit = range.begin();
        for ( auto i : vec ) {
            ASSERT_EQ( i, *rit );
            ++rit;
        }
        auto vit = vec.begin();
        for ( auto i : range ) {
            ASSERT_EQ( i, *vit );
            ++vit;
        }
    }
};

struct Query {

    struct Id { template< typename T > T operator()( T t ) const { return t; } };
    struct ConstTrue { template< typename T > bool operator()( T ) const { return true; } };
    struct ConstFalse { template< typename T > bool operator()( T ) const { return false; } };

    TEST(query) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        auto query = query::query( vec );
        static_assert( std::is_same< int, decltype( query )::iterator::value_type >::value, "types" );
        auto qit = query.begin();
        for ( auto i : vec ) {
            ASSERT_EQ( i, *qit );
            ++qit;
        }
        auto vit = vec.begin();
        for ( auto i : query ) {
            ASSERT_EQ( i, *vit );
            ++vit;
        }
    }

    // freeze . query == id
    TEST(freeze_id) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        ASSERT( query::query( vec ).freeze() == vec );
    }

    TEST(freeze_id_deque) {
        std::deque< int > deq = { 1, 2, 3, 4 };
        ASSERT( query::query( deq ).template freezeAs< std::deque< int > >() == deq );
    }

    // freeze . map( id ) . query == id
    TEST(map_id) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        ASSERT( query::query( vec ).map( Id() ).freeze() == vec );
    }

    TEST(map_it) {
        std::vector< int > vec = { 1, 2 };
        auto q = query::query( vec ).map( Id() );
        ASSERT( !q.begin().end() );
        ASSERT( q.end().end() );
        ASSERT( !(++q.begin()).end() );
        ASSERT( (++(++q.begin())).end() );
    }

    TEST(map) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        std::vector< int > doubles = { 2, 4, 6, 8 };
        auto dbl = []( int x ) { return x * 2; };
        ASSERT( query::query( vec ).map( dbl ).freeze() == doubles );
    }

    // freeze . filter( const_true ) . query == id
    TEST(filter_id) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        ASSERT( query::query( vec ).filter( ConstTrue() ).freeze() == vec );
    }

    TEST(filter_it) {
        std::vector< int > vec = { 1, 2 };
        auto q = query::query( vec ).filter( ConstTrue() );
        ASSERT( !q.begin().end() );
        ASSERT( q.end().end() );
        ASSERT( !(++q.begin()).end() );
        ASSERT( (++(++q.begin())).end() );
    }

    TEST(filter) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        std::vector< int > odd = { 1, 3 };
        auto isodd = []( int x ) { return x % 2 == 1; };
        ASSERT( query::query( vec ).filter( isodd ).freeze() == odd );
        std::vector< int > empty = { };
        ASSERT( query::query( vec ).filter( ConstFalse() ).freeze() == empty );
    }

    TEST(flatten_it) {
        std::vector< std::vector< int > > vec = { { }, { 1 }, { }, { }, { 2 }, { }, { } };
        auto q = query::query( vec ).flatten();
        ASSERT( !q.begin().end() );
        ASSERT( q.end().end() );
        ASSERT( !(++q.begin()).end() );
        ASSERT( (++(++q.begin())).end() );
    }

    TEST(flatten_map_it) {
        std::vector< std::vector< int > > vec = { };
        ASSERT( query::query( vec ).map( Id() ).flatten().begin().end() );

        vec = { { }, { 1 }, { }, { }, { 2 }, { }, { } };
        auto q = query::query( vec ).map( Id() ).flatten();

        ASSERT( !q.begin().end() );
        ASSERT( q.end().end() );
        ASSERT( !(++q.begin()).end() );
        ASSERT( (++(++q.begin())).end() );
    }

    TEST(flatten) {
        std::vector< std::vector< int > > vec = { { }, { }, { 1, 2 }, { 3 }, { }, { }, { }, { 4 }, { }, { }, { }, { } };
        std::vector< int > target = { 1, 2, 3, 4 };

        ASSERT_EQ( query::query( vec ).flatten().size(), 4 );
        ASSERT( query::query( vec ).flatten().freeze() == target );
    }

    TEST(size) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        auto iseven = []( int x ) { return x % 2 == 0; };
        ASSERT_EQ( query::query( vec ).size(), 4 );
        ASSERT_EQ( query::query( vec ).map( Id() ).size(), 4 );
        ASSERT_EQ( query::query( vec ).filter( ConstTrue() ).size(), 4 );
        ASSERT_EQ( query::query( vec ).filter( ConstFalse() ).size(), 0 );
        ASSERT_EQ( query::query( vec ).filter( iseven ).size(), 2 );

        std::vector< std::vector< int > > dvec = { { 1 } };
        ASSERT_EQ( query::query( dvec ).map( Id() ).flatten().size(), 1 );
        ASSERT_EQ( query::query( dvec ).flatten().map( Id() ).size(), 1 );

        dvec = { { 1 }, { 2, 3 }, { }, { 4 } };
        ASSERT_EQ( query::query( dvec ).map( Id() ).flatten().size(), 4 );
        ASSERT_EQ( query::query( dvec ).flatten().map( Id() ).size(), 4 );
    }

    TEST(map_flatten) {
        std::vector< std::deque< int > > vec = { { }, { }, { 1, 2 }, { 3 }, { }, { }, { }, { 4 }, { }, { }, { }, { } };
        std::vector< int > target = { 1, 2, 3, 4 };

        ASSERT_EQ( query::query( vec ).map( Id() ).flatten().size(), 4 );
        ASSERT( query::query( vec ).map( Id() ).flatten().freeze() == target );
    }

    TEST(filter_flatten) {
        std::vector< std::deque< int > > vec = { { }, { }, { 1, 2 }, { 3 }, { }, { }, { }, { 4 }, { }, { }, { }, { } };
        std::vector< int > target = { 1, 2 };

        auto evensized = []( std::deque< int > x ) { return x.size() % 2 == 0; };
        ASSERT( query::query( vec ).filter( evensized ).flatten().freeze() == target );
    }

    TEST(flatten_flatten) {
        std::vector< std::deque< std::vector< int > > > vec = { { }, { { }, { } }, { { 1, 2 } }, { { 3 }, { } }, { { 4 } }, };
        std::vector< int > target = { 1, 2, 3, 4 };

        ASSERT( query::query( vec ).flatten().flatten().freeze() == target );
    }

    TEST(complicated) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        std::string str = query::query( vec )
            .map( []( int x ) -> std::deque< int > {
                    std::deque< int > d;
                    for ( int i = 0; i < x; ++i )
                        d.push_back( i );
                    return d;
                    } )
            .flatten()
            .filter( []( int x ) { return x % 2 == 0; } )
            .concatMap( []( int x ) { return  x ? std::string( "" ) : std::string( "aa" ); } )
            .template freezeAs< std::string >();
    }

    TEST(forall) {
        std::vector< int > vec = { 1, 2, 3, 4 };
        int sum = 0;
        query::query( vec ).forall( [&]( int i ) { sum += i; } );
        ASSERT_EQ( sum, 10 );
    }

    TEST(groupBy) {
        std::vector< int > vec = { 1, 2, 2, 3, 3, 3, 4, 4, 4, 4 };
        query::query( vec )
            .groupBy( Id() )
            .forall( []( std::pair< int, std::vector< int > > p ) {
                    ASSERT_EQ( int( p.second.size() ), p.first );
                    for ( auto x : p.second )
                        ASSERT_EQ( x, p.first );
                } );
    }

};

}
}

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab ft=cpp
