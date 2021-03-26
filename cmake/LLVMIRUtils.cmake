
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

define_property(
  TARGET PROPERTY LLVM_LINK_DEPENDS
  BRIEF_DOCS "TODO"
  FULL_DOCS "TODO"
)

function(llvm_library TARGET_NAME)
  cmake_parse_arguments(ARG "" "OUTPUT" "" ${ARGN})

  function(genexpr_prefix OUT EXPR PREFIX)
    set(
      "${OUT}"
      "$<$<NOT:$<STREQUAL:${EXPR},>>:${PREFIX}$<JOIN:${EXPR},;${PREFIX}>>"
      PARENT_SCOPE
    )
  endfunction()

  set(sources "${ARG_UNPARSED_ARGUMENTS}")
  set(intermediate_dir "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${TARGET_NAME}.dir")

  make_directory("${intermediate_dir}")

  if (IR_USE_BITCODE)
    set(target_ext ".bc")
    set(extra_flags "")
  else()
    set(target_ext ".ll")
    set(extra_flags "-S")
  endif()

  if ("${ARG_OUTPUT}" STREQUAL "")
    set(ARG_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}${target_ext}")
  endif()

  set(objects "")
  set(counter 0)
  set(library "${ARG_OUTPUT}")

  if (IR_USE_BITCODE)
    set(target_ext ".bc")
    set(extra_flags "")
  else()
    set(target_ext ".ll")
    set(extra_flags "-S")
  endif()

  add_custom_target(
    "${TARGET_NAME}" ALL
    DEPENDS "${library}"
    SOURCES ${sources}
    COMMENT Finalizing BITCODE library "${TARGET_NAME}"
  )

  set_target_properties(
    "${TARGET_NAME}"
    PROPERTIES
    OUTPUT              "${library}"
    OUTPUT_NAME         "${TARGET_NAME}${target_ext}"
    LIBRARY_OUTPUT_PATH "${CMAKE_CURRENT_BINARY_DIR}"
    IS_LLVM_LIBRARY     TRUE
    LLVM_LINK_DEPENDS   ""
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
      continue()
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
      "$<$<STREQUAL:${source_language},C>:${CLANG}>"
      "$<$<STREQUAL:${source_language},CXX>:${CLANGXX}>"
    )

    get_source_file_property(includes "${source}" INCLUDE_DIRECTORIES)
    get_source_file_property(options "${source}" LLVM_COMPILE_OPTIONS)

    if (NOT includes)
      set(includes "")
    endif()
    if (NOT options)
      set(options "")
    endif()

    genexpr_prefix(src_includes "${includes}" "-I")

    add_custom_command(
      OUTPUT "${object}"
      COMMAND "${COMPILER}" ARGS
        -emit-llvm -c
        "${sys_includes}"
        "${tgt_includes}"
        "${src_includes}"
        "$<GENEX_EVAL:$<TARGET_PROPERTY:${TARGET_NAME},LLVM_COMPILE_OPTIONS>>"
        "${options}"
        "${source}"
        -o "${object}"
      MAIN_DEPENDENCY "${source}"
      IMPLICIT_DEPENDS "${source}"
      COMMENT "Building LLVM_${source_language} object ${object}"
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
      ${extra_flags}
      -o "${library}"
    DEPENDS "${objects}" "$<TARGET_PROPERTY:${TARGET_NAME},LLVM_LINK_DEPENDS>"
    COMMENT Linking BITCODE library "${library}"
    COMMAND_EXPAND_LISTS
  )
endfunction()

function(llvm_compile_options TARGET_NAME VISIBILITY)
  set(options "${ARGN}")

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
  set(DIRS "${ARGN}")

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
  set(LIBS "${ARGN}")

  foreach(library ${LIBS})
    if (TARGET "${library}")
      set_property(
        TARGET ${TARGET_NAME} APPEND
        PROPERTY LLVM_LINK_DEPENDS "${library}"
      )

      if (VISIBILITY STREQUAL "PRIVATE" OR VISIBILITY STREQUAL "PUBLIC")
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY INCLUDE_DIRECTORIES 
          "$<GENEX_EVAL:$<TARGET_PROPERTY:${library},INTERFACE_INCLUDE_DIRECTORIES>>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_COMPILE_OPTIONS 
          "$<GENEX_EVAL:$<TARGET_PROPERTY:${library},LLVM_INTERFACE_COMPILE_OPTIONS>>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_LINK_OPTIONS 
          "$<GENEX_EVAL:$<TARGET_PROPERTY:${library},LLVM_INTERFACE_LINK_OPTIONS>>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_LINK_LIBRARIES 
          "$<GENEX_EVAL:$<TARGET_PROPERTY:${library},LLVM_INTERFACE_LINK_LIBRARIES>>"
          "$<TARGET_PROPERTY:${library},OUTPUT>"
        )
      endif()

      if (VISIBILITY STREQUAL "INTERFACE" OR VISIBILITY STREQUAL "PUBLIC")
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY INTERFACE_INCLUDE_DIRECTORIES 
          "$<GENEX_EVAL:$<TARGET_PROPERTY:${library},INTERFACE_INCLUDE_DIRECTORIES>>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_INTERFACE_COMPILE_OPTIONS 
          "$<GENEX_EVAL:$<TARGET_PROPERTY:${library},LLVM_INTERFACE_COMPILE_OPTIONS>>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_INTERFACE_LINK_OPTIONS 
          "$<GENEX_EVAL:$<TARGET_PROPERTY:${library},LLVM_INTERFACE_LINK_OPTIONS>>"
        )
        set_property(
          TARGET ${TARGET_NAME} APPEND
          PROPERTY LLVM_INTERFACE_LINK_LIBRARIES 
          "$<GENEX_EVAL:$<TARGET_PROPERTY:${library},LLVM_INTERFACE_LINK_LIBRARIES>>"
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

