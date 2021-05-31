
function(caffeine_enable_coverage)
  if (CAFFEINE_ENABLE_COVERAGE)
    add_compile_options(-fprofile-instr-generate -fcoverage-mapping -g -O0)
    add_link_options   (-fprofile-instr-generate -fcoverage-mapping)
  endif()
endfunction()

caffeine_enable_coverage()
