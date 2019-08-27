cmake_minimum_required(VERSION 3.7.2)
project(undefined_behavior_study)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -Wall -Wextra -Wpedantic")
endif ()

set(executables
  access_after_realloc
  array_out_of_bounds
  dereferencing_nullptr
  divide_by_zero
  initialize_std_string_with_nullptr
  large_double_to_int
  large_double_to_float
  mutate_const_value
  no_undefined_behavior
  out_of_bounds_pointer
  preincrement_plus_postincrement
  preincrement_plus_value
  read_from_old_type
  reading_uninitialized_value_add
  reading_uninitialized_value_cout
  reading_uninitialized_value_func_arg
  reading_uninitialized_value_if
  reading_uninitialized_value_partial
  reading_uninitialized_value_printf
  shifting_more_than_width
  signed_integer_overflow
  stack_overflow
  std_vector_reserve_set_read
  strptime_mktime_unitialized)

if (NOT MSVC)
  list(APPEND executables reading_uninitialized_value_return)
endif ()

foreach(executable ${executables})
  add_executable(${executable} src/${executable}.cpp)
endforeach()

