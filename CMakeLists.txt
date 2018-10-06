cmake_minimum_required(VERSION 3.7.2)
project(undefined_behavior_study)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -Wall -Wextra -Wpedantic")
endif ()

set(executables
  array_out_of_bounds
  dereferencing_nullptr
  divide_by_zero
  no_undefined_behavior
  out_of_bounds_pointer
  reading_unitialized_value_add
  reading_unitialized_value_cout
  reading_unitialized_value_if
  reading_unitialized_value_printf
  shifting_more_than_width
  signed_integer_overflow
  stack_overflow)

foreach(executable ${executables})
  add_executable(${executable} src/${executable}.cpp)
endforeach()

