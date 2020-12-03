
find_program(CLANG clang)
find_program(CLANGXX clang++)

add_subdirectory(unit)
add_subdirectory(run-pass)
add_subdirectory(run-fail)
