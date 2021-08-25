// -*- mode: C++; indent-tabs-mode: nil; c-basic-offset: 4 -*-

/*
 * mmap support using C++11
 *
 * mmaped file can be shared across threads without memory overhead,
 * but obviously it is not thread safe. It has shared_ptr semantics.
 */

/*
 * (c) 2013, 2015 Vladimír Štill <xstill@fi.muni.cz>
 * (c) 2013, 2015 Jiří Weiser <xweiser1@fi.muni.cz>
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

#if __cplusplus < 201103L
#error "brick-mmap is only supported with c++11 or newer"
#endif

#include <memory>
#include <string>
#include <stdexcept>

#ifdef _WIN32

#include <windows.h>
#include <io.h>     /* _get_osfhandle */

#else

#include <type_traits>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>

#endif

#ifndef MAP_ANONYMOUS
#define MAP_ANONYMOUS MAP_ANON
#endif

#include "brick-assert.h"
#include "brick-types.h"

namespace brick {
namespace mmap {

struct SystemException : std::exception {
    // make sure we don't override errno accidentaly when constructing std::string
    explicit SystemException( std::string what ) : SystemException{ errno, what } { }
    explicit SystemException( const char *what ) : SystemException{ errno, what } { }

    virtual const char *what() const noexcept override { return _what.c_str(); }

  private:
    std::string _what;

    explicit SystemException( int _errno, std::string what ) {
        _what = "System error: " + std::string( std::strerror( _errno ) ) + ", when " + what;
    }
};

enum class ProtectMode {
    Read = 0x1, Write = 0x2, Execute = 0x4,
    Shared = 0x8, Private = 0x10
};

struct MMap
{
    using ProtectModeFlags = ::brick::types::StrongEnumFlags< ProtectMode >;
#define DEFAULT_MODE (ProtectMode::Read | ProtectMode::Shared)
#define MALLOC_MODE (ProtectMode::Read | ProtectMode::Write | ProtectMode::Private)

    MMap() : _size( 0 ) { }
    MMap( const std::string &file, ProtectModeFlags flags = DEFAULT_MODE ) :
        _flags( flags ), _size( 0 )
    {
        _map( file );
    }

    MMap( int fd, ProtectModeFlags flags ) : _flags( flags ), _size( 0 ) {
        _map( fd );
    }

    void map( const std::string &file, ProtectModeFlags flags = DEFAULT_MODE ) {
        _flags = flags;
        _map( file );
    }

    void map( int fd, ProtectModeFlags flags = DEFAULT_MODE ) {
        _flags = flags;
        _map( fd );
    }

    void unmap() {
        _ptr = nullptr;
        _size = 0;
    }

    static void *alloc( size_t size, ProtectModeFlags flags = MALLOC_MODE ) {
        return _alloc( size, flags );
    }
    static void drop( void *ptr, size_t size ) {
        _drop( ptr, size );
    }

#undef MALLOC_MODE
#undef DEFAULT_MODE

    size_t size() { return _size; }
    explicit operator bool() { return bool( _ptr ); }
    bool valid() { return bool( _ptr ); }
    ProtectModeFlags mode() { return _flags; }

    // get value on beginning offset bites
    template< typename T >
    T &get( size_t offset ) {
        return *reinterpret_cast< T * >(
                reinterpret_cast< char * >( _ptr.get() ) + offset );
    }

    template< typename T >
    const T &cget( size_t offset ) const {
        return *reinterpret_cast< T * >(
                reinterpret_cast< char * >( _ptr.get() ) + offset );
    }

    template< typename T >
    const T &get( size_t offset ) const { return cget< T >( offset ); }

    template< typename T >
    T *asArrayOf() {
        return reinterpret_cast< T * >( _ptr.get() );
    }

    template< typename T >
    const T *asConstArrayOf() const {
        return reinterpret_cast< const T * >( _ptr.get() );
    }

    template< typename T >
    const T *asArrayOf() const {
        return asConstArrayOf< T >();
    }

    char &operator[]( size_t offset ) {
        return asArrayOf< char >()[ offset ];
    }

    const char &operator[]( size_t offset ) const {
        return asArrayOf< char >()[ offset ];
    }

    const char *cdata() const { return asConstArrayOf< char >(); }
    const char *data() const { return asConstArrayOf< char >(); }
    char *data() { return asArrayOf< char >(); }

  private:
    std::shared_ptr< void > _ptr;
    ProtectModeFlags _flags;
    size_t _size;

#ifdef _WIN32

    static void *_alloc( size_t size, ProtectModeFlags ) {
        void *ptr = VirtualAlloc( nullptr, size, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE );
        if ( !ptr )
            throw SystemException( "VirtualAlloc failed" );
        return ptr;
    }
    static void _drop( void *ptr, size_t size ) {
        VirtualFree( ptr, size, MEM_RELEASE );
    }

    void _map( int fd ) {

        _map( HANDLE( _get_osfhandle( fd ) ), INVALID_HANDLE_VALUE );
    }

    void _map( HANDLE handle, HANDLE file ) {
        HANDLE mapping = CreateFileMapping(
            handle,
            nullptr,
            _mmapProt(),
            0, 0,
            nullptr
        );
        if ( !mapping )
            throw SystemException( "CreateFileMapping failed" );

        types::Defer d( [mapping] { CloseHandle( mapping ); } );

        void *ptr = MapViewOfFile( mapping, _mmapMap(), 0, 0, 0 );
        if ( !ptr )
            throw SystemException( "MapViewOfFile failed" );
        d.pass();

        _ptr = std::shared_ptr< void >(
            ptr,
            [mapping, file]( void *h ) {
                UnmapViewOfFile( h );
                CloseHandle( mapping );
                if ( file != INVALID_HANDLE_VALUE )
                    CloseHandle( file );
            }
        );
    }

    void _map( const std::string &name ) {
        HANDLE handle = CreateFileA(
            name.c_str(),
            _mmapAccess(),
            FILE_SHARE_READ,
            nullptr,
            OPEN_EXISTING,
            FILE_ATTRIBUTE_NORMAL,
            nullptr
        );
        if ( handle == INVALID_HANDLE_VALUE )
            throw SystemException( "CreateFile failed" );

        types::Defer d( [handle]{ CloseHandle( handle ); } );
        _map( handle, handle );
        d.pass();
    }

    int _mmapAccess() {
        int access = 0;
        if ( _flags.has( ProtectMode::Execute ) ) access |= GENERIC_EXECUTE;
        if ( _flags.has( ProtectMode::Read ) ) access |= GENERIC_READ;
        if ( _flags.has( ProtectMode::Write ) ) access |= GENERIC_WRITE;
        return access;
    }

    int _mmapMap() {
        int access = FILE_MAP_READ;
        if ( _flags.has( ProtectMode::Write ) ) access = FILE_MAP_WRITE;
        if ( _flags.has( ProtectMode::Execute ) ) access |= FILE_MAP_EXECUTE;
        return access;
    }
    static int _mmapProt( ProtectModeFlags flags ) {
        int prot = 0;
        if ( flags.has( ProtectMode::Execute ) ) {
            if ( flags.has( ProtectMode::Read ) &&
                flags.has( ProtectMode::Write ) )
                prot |= PAGE_EXECUTE_READWRITE;
            else if ( flags.has( ProtectMode::Read ) )
                prot |= PAGE_EXECUTE_READ;
            else
                prot |= PAGE_EXECUTE_WRITECOPY;
        }
        else {
            if ( flags.has( ProtectMode::Read ) &&
                flags.has( ProtectMode::Write ) )
                prot |= PAGE_READWRITE;
            else if ( flags.has( ProtectMode::Read ) )
                prot |= PAGE_READONLY;
            else
                prot |= PAGE_WRITECOPY;
        }
        return prot;
    }

#else

    static void *_alloc( size_t size, ProtectModeFlags flags ) {
        void *ptr = ::mmap( nullptr, size, _mmapProt( flags ), _mmapFlags( flags ) | MAP_ANONYMOUS, -1, 0 );
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wold-style-cast"
        if ( ptr == MAP_FAILED )
            throw SystemException( "anonymous mmap for " + std::to_string( size )  + " bytes failed" );
#pragma GCC diagnostic pop
        return ptr;
    }
    static void _drop( void *ptr, size_t size ) {
        ::munmap( ptr, size );
    }

    void _map( int fd ) {
        struct stat st;
        if ( fstat( fd, &st ) != 0 )
            throw SystemException( "stat failed while mmaping" );
        size_t size = _size = st.st_size;

        void *ptr = ::mmap( nullptr, _size, _mmapProt(), _mmapFlags(), fd, 0 );
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wold-style-cast"
        if ( ptr == MAP_FAILED )
            throw SystemException( "mmaping file failed" );
#pragma GCC diagnostic pop

        _ptr = std::shared_ptr< void >( ptr,
            [ fd, size ]( void *h ) {
                ::munmap( h, size );
                ::close( fd );
            } );
    }

    void _map( const std::string &file ) {
        int fd = ::open( file.c_str(), _openFlags() );
        if ( fd < 0 )
            throw SystemException( "opening file failed: " + file );
        _map( fd );
    }

    static int _mmapProt( ProtectModeFlags flags ) {
        int prot = 0;
        if ( flags.has( ProtectMode::Read ) ) prot |= PROT_READ;
        if ( flags.has( ProtectMode::Write ) ) prot |= PROT_WRITE;
        if ( flags.has( ProtectMode::Execute ) ) prot |= PROT_EXEC;
        return prot;
    }
    static int _mmapFlags( ProtectModeFlags flags ) {
        int mf = 0;
        if ( flags.has( ProtectMode::Shared ) ) mf |= MAP_SHARED;
        if ( flags.has( ProtectMode::Private ) ) mf |= MAP_PRIVATE;
        return mf;
    }
    int _mmapFlags() {
        return _mmapFlags( _flags );
    }
    int _openFlags() {
        if ( _flags.has( ProtectMode::Read ) &&
                _flags.has( ProtectMode::Write ) )
            return O_RDWR;
        if ( _flags.has( ProtectMode::Read ) )
            return O_RDONLY;
        if ( _flags.has( ProtectMode::Write ) )
            return O_WRONLY;
        UNREACHABLE( "No open flags specified" );
    }

#endif

    int _mmapProt() {
        return _mmapProt( _flags );
    }


};

}

namespace t_mmap {

struct MMapTest {
    TEST(read) {
#if __cplusplus >= 201103L

        const char *toMap =
#ifdef _WIN32
            "c:\\windows\\system32\\cmd.exe";
#else
            "/bin/sh";
#endif
        mmap::MMap map;
        ASSERT_EQ( map.size(), 0U );
        ASSERT( !map );
        ASSERT( !map.valid() );
        ASSERT( !map.mode() );

        map.map( toMap );
        ASSERT_NEQ( map.size(), 0U );
        ASSERT( map.mode() == (mmap::ProtectMode::Read | mmap::ProtectMode::Shared) );
        ASSERT( map.valid() );
#ifdef _WIN32
        ASSERT_EQ( map[ 0 ], 'M' );
        ASSERT_EQ( map[ 1 ], 'Z' );
        ASSERT_EQ( map[ 2 ], '\x90' );
#elif defined( __unix )
        ASSERT_EQ( map[ 1 ], 'E' );
        ASSERT_EQ( map[ 2 ], 'L' );
        ASSERT_EQ( map[ 3 ], 'F' );
#endif

        mmap::MMap map1 = map; // shared_ptr semantics
        ASSERT_EQ( map.size(), map.size() );
        ASSERT_EQ( map.asArrayOf< char >(), map1.asArrayOf< char >() );
        ASSERT( map.mode() == map1.mode() );

#ifdef _WIN32
        ASSERT_EQ( map1.get< char >( 0 ), 'M' );
        ASSERT_EQ( map1.get< char >( 1 ), 'Z' );
        ASSERT_EQ( map1.get< char >( 2 ), '\x90' );
#elif defined( __unix )
        ASSERT_EQ( map1.get< char >( 1 ), 'E' );
        ASSERT_EQ( map1.get< char >( 2 ), 'L' );
        ASSERT_EQ( map1.get< char >( 3 ), 'F' );
#endif

        map1.unmap();
        ASSERT_EQ( map1.size(), 0U );
        ASSERT( !map1 );
#ifdef _WIN32
        ASSERT_EQ( map.cget< char >( 0 ), 'M' );
        ASSERT_EQ( map.cget< char >( 1 ), 'Z' );
        ASSERT_EQ( map.cget< char >( 2 ), '\x90' );
#elif defined( __unix )
        ASSERT_EQ( map.cget< char >( 1 ), 'E' );
        ASSERT_EQ( map.cget< char >( 2 ), 'L' );
        ASSERT_EQ( map.cget< char >( 3 ), 'F' );
#endif

        ASSERT( map.valid() );

        map.unmap();
        ASSERT_EQ( map.size(), 0U );
        ASSERT( !map );
#endif
    }

    TEST(alloc) {
        void *data = mmap::MMap::alloc( 1024 );
        unsigned char *ptr = static_cast< unsigned char * >( data );
        for ( int i = 0; i < 1024; ++i )
            ptr[ i ] = i % 256;

        for ( int i = 0; i < 1024; ++i )
            ASSERT_EQ( ptr[ i ], i % 256 );
        mmap::MMap::drop( ptr, 1024 );
    }
};

}
}

// vim: syntax=cpp tabstop=4 shiftwidth=4 expandtab
