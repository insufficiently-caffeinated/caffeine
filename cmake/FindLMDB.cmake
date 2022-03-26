
include(FindPackageHandleStandardArgs)

find_package(LMDB QUIET NO_MODULE)

if (LMDB_FOUND)
  find_package_handle_standard_args(LMDB CONFIG_MODE)
  return()
endif()

set(_LMDB_PKG_ARGS )

if (LMDB_FIND_REQUIRED)
  list(APPEND _LMDB_PKG_ARGS REQUIRED)
endif()
if (LMDB_FIND_QUIET)
  list(APPEND _LMDB_PKG_ARGS REQUIRED)
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(LMDB
  ${_LMDB_PKG_ARGS}
  IMPORTED_TARGET GLOBAL
  lmdb
)

add_library(lmdb ALIAS PkgConfig::LMDB)

unset(_LMDB_PKG_ARGS)
