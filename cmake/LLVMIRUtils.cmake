
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

set(CLANG_LINK_SCRIPT "${CMAKE_SOURCE_DIR}/cmake/clang-link.cmake")

set_if_unset(CLANG     "${LLVM_TOOLS_BINARY_DIR}/clang")
set_if_unset(CLANGXX   "${LLVM_TOOLS_BINARY_DIR}/clang++")
set_if_unset(LLVM_LINK "${LLVM_TOOLS_BINARY_DIR}/llvm-link")
set_if_unset(LLVM_OPT  "${LLVM_TOOLS_BINARY_DIR}/opt")
set_if_unset(LLVM_DIS  "${LLVM_TOOLS_BINARY_DIR}/llvm-dis")

set_if_unset(IR_USE_BITCODE OFF)

if (IR_USE_BITCODE)
  set(IR_EXTRA_FLAGS "")
  set(IR_EXTENSION ".bc")
else()
  set(IR_EXTRA_FLAGS "-S")
  set(IR_EXTENSION ".ll")
endif()

# Here we define 3 new languages:
# - LLVM_C: Compile a C source file to a bitcode file
# - LLVM_CXX: Compile a C++ source file to a bitcode file
# - BITCODE: A linker language that we use to link all the bitcode files together.
#
# Note that since these languages are no longer C and C++ cmake won't set up
# the arguments as expected (includes will just be bare paths, etc.) we use
# some generator expressions to paste the proper include directories into the
# target flags. This probably won't interact properly with SYSTEM cmake
# includes but we'll cross that bridge when we get to it. On the plus side,
# this means that any sort of autocompletion that uses the compile_commands.json
# output (e.g. the vscode c++ extension) should work correctly.
#
# NOTE: The output extension of the object file is the same as the output
#       extension of the input file. I don't know how to change this 
#       within cmake so instead the linker is a script that copies them
#       to have the right extension before linking.

set_if_unset(CMAKE_LLVM_C_DEFINES   "${CMAKE_C_DEFINES}")
set_if_unset(CMAKE_LLVM_C_FLAGS     "${CMAKE_C_FLAGS}")
set(CMAKE_LLVM_C_COMPILE_OBJECT     "${CLANG} ${IR_EXTRA_FLAGS} -c -emit-llvm <FLAGS> <DEFINES> -o \"<OBJECT>\" \"<SOURCE>\"")
set(CMAKE_LLVM_C_IMPLICIT_LINK_LIBRARIES "")
set(CMAKE_LLVM_C_IMPLICIT_LINK_DIRECTORIES "")

set_if_unset(CMAKE_LLVM_CXX_DEFINES "${CMAKE_CXX_DEFINES}")
set_if_unset(CMAKE_LLVM_CXX_FLAGS   "${CMAKE_CXX_FLAGS}")
set(CMAKE_LLVM_CXX_COMPILE_OBJECT   "${CLANG} ${IR_EXTRA_FLAGS} -c -emit-llvm <FLAGS> <DEFINES> -o \"<OBJECT>\" \"<SOURCE>\"")
set(CMAKE_LLVM_CXX_IMPLICIT_LINK_LIBRARIES "")
set(CMAKE_LLVM_CXX_IMPLICIT_LINK_DIRECTORIES "")

set(
  CMAKE_BITCODE_CREATE_SHARED_LIBRARY
  "${CMAKE_COMMAND} -DOBJ_EXT=${IR_EXTENSION} \"-DLINKER=${LLVM_LINK}\" \"-DFLAGS=<LINK_FLAGS> ${IR_EXTRA_FLAGS}\" \"-DTARGET=<TARGET>\" \"-DLINK_LIBRARIES=<LINK_LIBRARIES>\" \"-DOBJECTS=<OBJECTS>\" -P \"${CLANG_LINK_SCRIPT}\""
)

set(CMAKE_SHARED_LIBRARY_PREFIX_BITCODE "")
set(CMAKE_SHARED_LIBRARY_SUFFIX_BITCODE "${IR_EXTENSION}")

function(add_llvm_ir_library TARGET_NAME)
  set(TARGET_SOURCES "${ARGN}")

  # NOTE: Has to be a shared library so that the link libraries are properly passed along
  add_library(${TARGET_NAME} SHARED "${TARGET_SOURCES}")

  foreach(source ${TARGET_SOURCES})
    get_property(source_language SOURCE "${source}" PROPERTY LANGUAGE)
    get_filename_component(source_ext "${source}" LAST_EXT)

    if(source_language STREQUAL "C")
      set_property(SOURCE "${source}" PROPERTY LANGUAGE LLVM_C)
    elseif(source_language STREQUAL "CXX")
      set_property(SOURCE "${source}" PROPERTY LANGUAGE LLVM_CXX)
    elseif(source_ext STREQUAL .ll OR source_ext STREQUAL .bc)
      set_property(SOURCE "${source}" PROPERTY LANGUAGE BITCODE)
      set_property(SOURCE "${source}" PROPERTY EXTERNAL_OBJECT TRUE)
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

  # Manually add include directories to the target flags since cmake
  # won't prepend them with -I by itself.
  target_compile_options(${TARGET_NAME} PUBLIC "-I$<JOIN:$<TARGET_PROPERTY:INCLUDE_DIRECTORIES>,;-I>")
endfunction()

define_property(
  DIRECTORY PROPERTY LLVM_COMPILE_OPTIONS INHERITED
  BRIEF_DOCS "TODO"
  FULL_DOCS "TODO"
)
define_property(
  TARGET PROPERTY LLVM_COMPILE_OPTIONS INHERITED
  BRIEF_DOCS "TODO"
  FULL_DOCS "TODO"
)
define_property(
  SOURCE PROPERTY LLVM_COMPILE_OPTIONS
  BRIEF_DOCS "TODO"
  FULL_DOCS "TODO"
)

define_property(
  TARGET PROPERTY LLVM_INTERFACE_COMPILE_OPTIONS
  BRIEF_DOCS "TODO"
  FULL_DOCS "TODO"
)

define_property(
  DIRECTORY PROPERTY LLVM_LINK_OPTIONS INHERITED
  BRIEF_DOCS "TODO"
  FULL_DOCS "TODO"
)
define_property(
  TARGET PROPERTY LLVM_LINK_OPTIONS INHERITED
  BRIEF_DOCS "TODO"
  FULL_DOCS "TODO"
)

function(llvm_library TARGET_NAME)
  set(sources "${ARGN}")
  set(intermediate_dir "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.dir")

  make_directory("${intermediate_dir}")

  function(genexpr_prefix OUT EXPR PREFIX)
    set(
      "${OUT}"
      "$<$<NOT:$<STREQUAL,${EXPR},>>:${PREFIX}$<JOIN:${EXPR},;${PREFIX}>>"
      PARENT_SCOPE
    )
  endfunction()

  set(objects "")
  set(counter 0)
  string(CONCAT library 
    "$<GENEX_EVAL:$<TARGET_PROPERTY:${TARGET_NAME},LIBRARY_OUTPUT_PATH>>"
    "/"
    "$<GENEX_EVAL:$<TARGET_PROPERTY:${TARGET_NAME},LIBRARY_OUTPUT_NAME>>"
  )

  add_custom_target(
    "${TARGET_NAME}" ALL
    DEPENDS "${library}"
    SOURCES ${sources}
  )

  set_target_properties(
    "${TARGET_NAME}"
    PROPERTIES
    OUTPUT_NAME         "${TARGET_NAME}.ll"
    LIBRARY_OUTPUT_PATH "${CMAKE_CURRENT_BINARY_DIR}"
    LIBRARY_OUTPUT_NAME "$<TARGET_GENEX_EVAL:${TARGET_NAME},$<TARGET_PROPERTY:${TARGET_NAME},OUTPUT_NAME>>"
    IS_LLVM_LIBRARY     TRUE
  )

  foreach(source ${sources})
    get_property(source_language SOURCE "${source}" PROPERTY LANGUAGE)
    get_filename_component(source_ext "${source}" LAST_EXT)
    get_filename_component(source_base "${source}" NAME)

    if (source_ext STREQUAL .ll OR source_ext STREQUAL .bc)
      list(APPEND objects "${source}")
      continue()
    endif()

    set(object "${intermediate_dir}/${source_base}.${counter}.bc")

    if (NOT source_language STREQUAL "C")
      message(ERROR "Unable to compile ${source} to bitcode. Need language to be C or CXX")
    endif()

    list(APPEND objects "${object}")

    genexpr_prefix(
      sys_includes
      "$<TARGET_PROPERTY:${TARGET_NAME},SYSTEM_INCLUDE_DIRECTORIES>"
      "-isystem;"
    )
    genexpr_prefix(
      tgt_includes
      "$<TARGET_PROPERTY:${TARGET_NAME},INCLUDE_DIRECTORIES>"
      "-I"
    )
    
    get_source_file_property(includes "${source}" INCLUDE_DIRECTORIES)
    get_source_file_property(options "${source}" LLVM_COMPILE_OPTIONS)

    string(CONCAT COMPILER 
      "$<$<STREQUAL:${source_language}:C>:${CLANG}>"
      "$<$<STREQUAL:${source_language}:CXX>:${CLANGXX}>"
    )

    get_source_file_property(includes "${source}" INCLUDE_DIRECTORIES)
    get_source_file_property(options "${source}" LLVM_COMPILE_OPTIONS)
    
    genexpr_prefix(src_includes "${includes}" "-I")

    add_custom_command(
      OUTPUT "${object}"
      COMMAND "${COMPILER}" ARGS
        -emit-llvm
        "$<GENEX_EVAL:${sys_includes}>"
        "$<GENEX_EVAL:${tgt_includes}>"
        "$<GENEX_EVAL:${src_includes}>"
        "$<GENEX_EVAL:$<TARGET_PROPERTY:${TARGET_NAME},LLVM_COMPILE_OPTIONS>>"
        "$<GENEX_EVAL:${options}>"
        "${source}"
        -o "${object}"
      MAIN_DEPENDENCY "${source}"
      IMPLICIT_DEPENDS "${source}"
      COMMENT "Compiling LLVM_${source_language} file ${source}"
      COMMAND_EXPAND_LISTS
    )

    math(EXPR counter "${counter} + 1")
  endforeach()

  add_custom_command(
    OUTPUT "${library}"
    COMMAND "${LLVM_LINK}" ARGS
      "$<GENEX_EVAL:$<TARGET_PROPERTY:${TARGET_NAME},LLVM_LINK_OPTIONS>>"
      "$<GENEX_EVAL:$<TARGET_PROPERTY:${TARGET_NAME},LLVM_LINK_LIBRARIES>>"
      "${objects}"
      -o "${library}"
    DEPENDS "${objects}"
    COMMENT Linking BITCODE library "${TARGET_NAME}"
    COMMAND_EXPAND_LISTS
  )
endfunction()

function(llvm_compile_options TARGET_NAME VISIBILITY)
  set(options "${CMAKE_ARGN}")

  if (VISIBILITY STREQUAL "PRIVATE" OR VISIBILITY STREQUAL "PUBLIC")
    set_property(
      TARGET ${TARGET_NAME} APPEND
      PROPERTY LLVM_COMPILE_OPTIONS ${options}
    )
  endif()

  if (VISIBILITY STREQUAL "PUBLIC" OR VISIBILITY STREQUAL "INTERFACE")
    set_property(
      TARGET ${TARGET_NAME} APPEND
      PROPERTY LLVM_INTERFACE_COMPILE_OPTIONS ${options} 
    )
  endif()
endfunction()

function(llvm_include_directories TARGET_NAME VISIBILITY)
  set(DIRS "${CMAKE_ARGN}")

  if (VISIBILITY STREQUAL "PRIVATE" OR VISIBILITY STREQUAL "PUBLIC")
    set_property(
      TARGET ${TARGET_NAME} APPEND
      PROPERTY INCLUDE_DIRECTORIES "${DIRS}"
    )
  endif()

  if (VISIBILITY STREQUAL "INTERFACE" OR VISIBILITY STREQUAL "PUBLIC")
    set_property(
      TARGET ${TARGET_NAME} APPEND
      PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${DIRS}"
    )
  endif()
endfunction()

function(llvm_link_libraries TARGET_NAME VISIBILITY)
  set(LIBS "${CMAKE_ARGN}")

  foreach(library ${LIBS})
    if (TARGET "${library}")
      if (VISIBILITY STREQUAL "PRIVATE" OR VISIBILITY STREQUAL "PUBLIC")
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY INCLUDE_DIRECTORIES 
          "$<TARGET_PROPERTY:${library},INTERFACE_INCLUDE_DIRECTORIES>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_COMPILE_OPTIONS 
          "$<TARGET_PROPERTY:${library},LLVM_INTERFACE_COMPILE_OPTIONS>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_LINK_OPTIONS 
          "$<TARGET_PROPERTY:${library},LLVM_INTERFACE_LINK_OPTIONS>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_LINK_LIBRARIES 
          "$<TARGET_PROPERTY:${library},LLVM_INTERFACE_LINK_LIBRARIES>"
        )
      endif()

      if (VISIBILITY STREQUAL "INTERFACE" OR VISIBILITY STREQUAL "PUBLIC")
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY INTERFACE_INCLUDE_DIRECTORIES 
          "$<TARGET_PROPERTY:${library},INTERFACE_INCLUDE_DIRECTORIES>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_INTERFACE_COMPILE_OPTIONS 
          "$<TARGET_PROPERTY:${library},LLVM_INTERFACE_COMPILE_OPTIONS>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_INTERFACE_LINK_OPTIONS 
          "$<TARGET_PROPERTY:${library},LLVM_INTERFACE_LINK_OPTIONS>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_INTERFACE_LINK_LIBRARIES 
          "$<TARGET_PROPERTY:${library},LLVM_INTERFACE_LINK_LIBRARIES>"
        )
      endif()
    else()
      if (VISIBILITY STREQUAL "PRIVATE" OR VISIBILITY STREQUAL "PUBLIC")
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_LINK_LIBRARIES 
          "${library}"
        )
      endif()

      if (VISIBILITY STREQUAL "INTERFACE" OR VISIBILITY STREQUAL "PUBLIC")
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_INTERFACE_LINK_LIBRARIES 
          "${library}"
        )
      endif()
    endif()
  endforeach()
endfunction()

