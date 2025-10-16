# Add Unity include path
include_directories(${CMAKE_SOURCE_DIR}/tests/unity/src)

# Build the test executable (include Unity source)
add_executable(test_spinclock
    test_main.c
    ${CMAKE_SOURCE_DIR}/tests/unity/src/unity.c
)


set_target_properties(test_spinclock PROPERTIES C_CLANG_TIDY "")

# Link the main spinclock library
target_link_libraries(test_spinclock spinclock)

# Disable -Werror for this target (Unity triggers warnings on modern compilers)
target_compile_options(test_spinclock PRIVATE -Wall -Wextra)

# Register the test executable for CTest
add_test(NAME SpinClockTests COMMAND test_spinclock)

# Get Unity logs printed during test
set_tests_properties(SpinClockTests PROPERTIES PASS_REGULAR_EXPRESSION "OK")
