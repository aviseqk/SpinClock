cmake_minimum_required(VERSION 3.15)
project(SpinClock C)

# integrating the clang-tidy Linter checks in every make
find_program(CLANG_TIDY_EXE NAMES clang-tidy)
if(CLANG_TIDY_EXE)
    message(STATUS "Found clang-tidy: ${CLANG_TIDY_EXE}")
    set(CMAKE_C_CLANG_TIDY "${CLANG_TIDY_EXE};--warnings-as-errors=*")
else()
    message(WARNING "clang-tidy not found! Linting will be skipped.")
endif()

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror")

# Include directories and submodules
include_directories(include)

# Enable support for testing
enable_testing()

# Add subdirectories for build
add_subdirectory(src)
add_subdirectory(tests)


