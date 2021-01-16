
# Commands to define LLVM bitcode libraries.
#
# add_llvm_ir_library(<target-name> <sources>...)
#   Creates a new bitcode library using the provided source files.
#   C and C++ source files will be compiled to bitcode while IR and
#   bitcode files will just be linked in directly.
#
#   The generated target is a real library target so all the commands
#   that you would normally use for a library target will work here as
#   well.

if (NOT DEFINED LLVM_FOUND)
  find_package(LLVM REQUIRED)
endif()

function(set_if_unset FLAGNAME)
  if (NOT DEFINED ${FLAGNAME})
    set(${FLAGNAME} "${ARGN}" PARENT_SCOPE)
  endif()
endfunction()

set(CLANG_BUILD_SCRIPT "${CMAKE_SOURCE_DIR}/cmake/clang-build.cmake")
set(CLANG_LINK_SCRIPT "${CMAKE_SOURCE_DIR}/cmake/clang-link.cmake")

set_if_unset(CLANG     "${LLVM_TOOLS_BINARY_DIR}/clang")
set_if_unset(CLANGXX   "${LLVM_TOOLS_BINARY_DIR}/clang++")
set_if_unset(LLVM_LINK "${LLVM_TOOLS_BINARY_DIR}/llvm-link")

# Here we define 3 new languages:
# - LLVM_C: Compile a C source file to a bitcode file
# - LLVM_CXX: Compile a C++ source file to a bitcode file
# - BITCODE: A linker language that we use to link all the bitcode files together.
#
# Note that since these languages are no longer C and C++ cmake won't
# set up the arguments as expected (includes will just be bare paths,
# etc.) so we use a cmake script to preprocess the arguments beforehand.
#
# NOTE: The output extension of the object file is the same as the output
#       extension of the input file. I don't know how to change this 
#       within cmake so instead the linker is a script that copies them
#       to have the right extension before linking.

set_if_unset(CMAKE_LLVM_C_DEFINES             "${CMAKE_C_DEFINES}")
set_if_unset(CMAKE_LLVM_C_FLAGS               "${CMAKE_C_FLAGS}")
set(CMAKE_LLVM_C_COMPILE_OBJECT
  "${CMAKE_COMMAND} \"-DCOMPILER=${CLANG}\" \"-DOBJECT=<OBJECT>\" \"-DSOURCE=<SOURCE>\" \"-DDEFINES=<DEFINES>\" \"-DFLAGS=-S -emit-llvm <FLAGS>\" \"-DINCLUDES=<INCLUDES>\" -P \"${CLANG_BUILD_SCRIPT}\""
)

set_if_unset(CMAKE_LLVM_CXX_DEFINES           "${CMAKE_CXX_DEFINES}")
set_if_unset(CMAKE_LLVM_CXX_FLAGS             "${CMAKE_CXX_FLAGS}")
set(CMAKE_LLVM_CXX_COMPILE_OBJECT
  "${CMAKE_COMMAND} \"-DCOMPILER=${CLANGXX}\" \"-DOBJECT=<OBJECT>\" \"-DSOURCE=<SOURCE>\" \"-DDEFINES=<DEFINES>\" \"-DFLAGS=-S -emit-llvm <FLAGS>\" \"-DINCLUDES=<INCLUDES>\" -P \"${CLANG_BUILD_SCRIPT}\""
)

set(
  CMAKE_BITCODE_CREATE_SHARED_LIBRARY
  "${CMAKE_COMMAND} \"-DLINKER=${LLVM_LINK}\" \"-DFLAGS=<LINK_FLAGS> -S\" \"-DTARGET=<TARGET>\" \"-DLINK_LIBRARIES=<LINK_LIBRARIES>\" \"-DOBJECTS=<OBJECTS>\" -P \"${CLANG_LINK_SCRIPT}\""
)

set(CMAKE_SHARED_LIBRARY_PREFIX_BITCODE "")
set(CMAKE_SHARED_LIBRARY_SUFFIX_BITCODE .ll)

function(add_llvm_ir_library TARGET_NAME)
  set(TARGET_SOURCES "${ARGN}")

  # NOTE: Has to be a shared library so that the link libraries are properly passed along
  add_library(${TARGET_NAME} SHARED "${TARGET_SOURCES}")

  foreach(source "${TARGET_SOURCES}")
    get_property(source_language SOURCE "${source}" PROPERTY LANGUAGE)
    get_filename_component(source_ext "${source}" LAST_EXT)

    if(source_language STREQUAL "C")
      set_property(
        SOURCE "${source}"
        PROPERTY
        LANGUAGE LLVM_C
      )

      # If the script gets modified then we want to rebuild
      set_property(
        SOURCE "${source}"
        PROPERTY
        OBJECT_DEPENDS "${CLANG_BUILD_SCRIPT}"
      )
    elseif(source_language STREQUAL "CXX")
      set_property(
        SOURCE "${source}"
        PROPERTY
        LANGUAGE LLVM_CXX
      )

      # If the script gets modified then we want to rebuild
      set_property(
        SOURCE "${source}"
        PROPERTY
        OBJECT_DEPENDS "${CLANG_BUILD_SCRIPT}"
      )
    elseif(source_ext STREQUAL .ll OR source_ext STREQUAL .bc)
      set_property(
        SOURCE "${source}"
        PROPERTY
        LANGUAGE BITCODE
      )
      set_property(
        SOURCE "${source}"
        PROPERTY
        EXTERNAL_OBJECT TRUE
      )
    endif()
  endforeach()

  set_property(
    TARGET ${TARGET_NAME}
    PROPERTY
    LINKER_LANGUAGE BITCODE
  )

  # We want to re-run the link step if the linker script changes.
  set_property(
    TARGET ${TARGET_NAME}
    PROPERTY
    LINK_DEPENDS "${CLANG_LINK_SCRIPT}"
  )
endfunction()


