
if (NOT magic_enum_NO_PACKAGE_FOUND)
  find_package(magic_enum 0.7.2 QUIET)
endif()

if (NOT magic_enum_FOUND)
  include(FetchContent)

  FetchContent_Declare(
    magic_enum
    GIT_REPOSITORY https://github.com/Neargye/magic_enum.git
    GIT_TAG        v0.7.2
    GIT_SHALLOW TRUE
  )

  FetchContent_MakeAvailable(magic_enum)

  set(magic_enum_NO_PACKAGE_FOUND TRUE CACHE INTERNAL "")
endif()
