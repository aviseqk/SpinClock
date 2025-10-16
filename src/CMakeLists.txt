# Building the main SpinClock Library
add_library(spinclock rt_sequencer.c)

# Making the headers accessible to anything linking to this library
target_include_directories(spinclock PUBLIC ${CMAKE_SOURCE_DIR}/include)
