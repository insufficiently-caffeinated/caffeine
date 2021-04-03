
function(caffeine_enable_sanitizers)

if (CAFFEINE_ENABLE_TSAN
    OR CAFFEINE_ENABLE_ASAN
    OR CAFFEINE_ENABLE_UBSAN
    OR CAFFEINE_ENABLE_MSAN
    OR CAFFEINE_ENABLE_LSAN)
  add_compile_options(-fno-omit-frame-pointer)
endif()

if (CAFFEINE_ENABLE_TSAN)
  add_compile_options(-fsanitize=thread)
  add_link_options   (-fsanitize=thread)
endif()

if (CAFFEINE_ENABLE_ASAN)
  add_compile_options(-fsanitize=address)
  add_link_options   (-fsanitize=address)
endif()

if (CAFFEINE_ENABLE_UBSAN)
  set(UBSAN_OPTS 
    "$<$<CXX_COMPILER_ID:Clang>:-fno-sanitize-recover=undefined,nullability>"
      "$<$<CXX_COMPILER_ID:GCC>:-fno-sanitize-recover=undefined>"
    "$<$<NOT:$<CXX_COMPILER_ID:Clang,GCC>>:-fsanitize=undefined>"
  )

  add_compile_options(${UBSAN_OPTS})
  add_link_options   (${UBSAN_OPTS})
endif()

if (CAFFEINE_ENABLE_MSAN)
  add_compile_options(-fsanitize=memory)
  add_link_options   (-fsanitize=memory)
endif()

if (CAFFEINE_ENABLE_LSAN)
  add_compile_options(-fsanitize=leak)
  add_link_options   (-fsanitize=leak)
endif()

endfunction()

caffeine_enable_sanitizers()
