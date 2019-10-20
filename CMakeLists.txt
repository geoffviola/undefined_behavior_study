cmake_minimum_required(VERSION 3.7.2)
project(undefined_behavior_study)

if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU"
   OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -Wall -Wextra -Wpedantic")
endif()

set(executables
    access_after_realloc
    array_out_of_bounds
    automatic_variable_over_stack
    dereferencing_nullptr
    divide_by_zero
    initialize_std_string_with_nullptr
    large_double_to_int
    large_double_to_float
    malloc_reinterpret_cast_pod_struct
    mutate_const_value
    no_undefined_behavior
    odr_violation_function
    odr_violation_struct_ret
    out_of_bounds_pointer
    preincrement_plus_postincrement
    preincrement_plus_value
    read_from_old_type
    reading_uninitialized_value_add
    reading_uninitialized_value_cout
    reading_uninitialized_value_func_arg
    reading_uninitialized_value_if
    reading_uninitialized_value_lib_call_cref
    reading_uninitialized_value_partial
    reading_uninitialized_value_printf
    reference_out_of_scope
    shifting_more_than_width
    signed_integer_overflow
    stack_overflow
    std_vector_reserve_set_read
    virtual_call_in_constructor_helper
    virtual_call_in_constructor_link
    virtual_call_in_destructor_helper
    virtual_call_in_destructor_link)

# Only build these files on compilers that will successfully compile them
if(NOT MSVC)
  list(APPEND executables reading_uninitialized_value_return
              strptime_mktime_unitialized)
endif()
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  list(APPEND executables virtual_call_in_destructor)
  list(APPEND executables virtual_call_in_constructor)
endif()

foreach(executable ${executables})
  add_executable(${executable} src/${executable}.cpp)
endforeach()

add_library(odr_violation_function_lib src/odr_violation_function_lib.cpp)
add_library(odr_violation_struct_ret_lib src/odr_violation_struct_ret_lib.cpp)
add_library(reading_uninitialized_value_lib
            src/reading_uninitialized_value_lib.cpp)
add_library(virtual_call_in_destructor_lib
            src/virtual_call_in_destructor_lib.cpp)
add_library(virtual_call_in_constructor_lib
            src/virtual_call_in_constructor_lib.cpp)

target_link_libraries(odr_violation_function PRIVATE odr_violation_function_lib)
target_link_libraries(odr_violation_struct_ret
                      PRIVATE odr_violation_struct_ret_lib)
target_link_libraries(reading_uninitialized_value_lib_call_cref
                      PRIVATE reading_uninitialized_value_lib)
target_link_libraries(virtual_call_in_destructor_link
                      PRIVATE virtual_call_in_destructor_lib)
target_link_libraries(virtual_call_in_constructor_link
                      PRIVATE virtual_call_in_constructor_lib)
