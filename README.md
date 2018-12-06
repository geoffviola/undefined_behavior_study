# Undefined Behavior Study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

## Automated Results

Linux 
[![Build Status](https://travis-ci.org/geoffviola/undefined_behavior_study.svg?branch=master)](https://travis-ci.org/geoffviola/undefined_behavior_study)

Windows 
[![Build status](https://ci.appveyor.com/api/projects/status/sewu7060d0mn6v8i/branch/master?svg=true)](https://ci.appveyor.com/project/geoffviola/undefined_behavior_study/branch/master)

## Static Analysis
### Compiler Warnings
Compiler | Undefined Behavior Type | Warning | Warning Opt | Name
--- | --- | --- | --- | ---
clang | access after realloc | ❌ | ❌ | n/a
clang | array out of bounds | ❌ | ❌ | n/a
clang | dereferencing nullptr | ❌ | ❌ | n/a
clang | divide by zero | ✔️ | ✔️ | -Wdivision-by-zero
clang | large double to float | ❌ | ❌ | n/a
clang | large double to int | ❌ | ❌ | n/a
clang | mutate const value | ❌ | ❌ | n/a
clang | out of bounds pointer | ❌ | ❌ | n/a
clang | preincrement plus postincrement | ✔️ | ✔️ | -Wunsequenced
clang | preincrement plus value | ✔️ | ✔️ | -Wunsequenced
clang | read from old type | ❌ | ❌ | n/a
clang | reading uninitialized value add | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value cout | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value func arg | ❌ | ❌ | n/a
clang | reading uninitialized value if | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value partial | ❌ | ❌ | n/a
clang | reading uninitialized value printf | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value return | ✔️ | ✔️ | -Wreturn-type
clang | shifting more than width | ✔️ | ✔️ | -Wshift-count-overflow
clang | signed integer overflow | ❌ | ❌ | n/a
clang | stack overflow | ✔️ | ✔️ | -Winfinite-recursion
gcc | access after realloc | ❌ | ❌ | n/a
gcc | array out of bounds | ❌ | ❌ | n/a
gcc | dereferencing nullptr | ❌ | ❌ | n/a
gcc | divide by zero | ✔️ | ✔️ | -Wdiv-by-zero
gcc | large double to float | ❌ | ❌ | n/a
gcc | large double to int | ❌ | ❌ | n/a
gcc | mutate const value | ❌ | ❌ | n/a
gcc | out of bounds pointer | ❌ | ❌ | n/a
gcc | preincrement plus postincrement | ✔️ | ✔️ | -Wsequence-point
gcc | preincrement plus value | ✔️ | ✔️ | -Wsequence-point
gcc | read from old type | ❌ | ❌ | n/a
gcc | reading uninitialized value add | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value cout | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value func arg | ❌ | ✔️ | -Wuninitialized
gcc | reading uninitialized value if | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value partial | ❌ | ❌ | n/a
gcc | reading uninitialized value printf | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value return | ✔️ | ✔️ | -Wreturn-type
gcc | shifting more than width | ✔️ | ✔️ | -Wshift-count-overflow
gcc | signed integer overflow | ❌ | ❌ | n/a
gcc | stack overflow | ❌ | ❌ | n/a
msvc | access after realloc | ❌ | ❌ | n/a
msvc | array out of bounds | ❌ | ❌ | n/a
msvc | dereferencing nullptr | ❌ | ❌ | n/a
msvc | divide by zero | ✔️ | ✔️ | 4723
msvc | large double to float | ❌ | ❌ | n/a
msvc | large double to int | ✔️ | ✔️ | 4309
msvc | mutate const value | ❌ | ❌ | n/a
msvc | out of bounds pointer | ❌ | ❌ | n/a
msvc | preincrement plus postincrement | ❌ | ❌ | n/a
msvc | preincrement plus value | ❌ | ❌ | n/a
msvc | read from old type | ❌ | ❌ | n/a
msvc | reading uninitialized value add | ✔️ | ✔️ | 4700
msvc | reading uninitialized value cout | ✔️ | ✔️ | 4700
msvc | reading uninitialized value func arg | ❌ | ❌ | n/a
msvc | reading uninitialized value if | ✔️ | ✔️ | 4700
msvc | reading uninitialized value partial | ❌ | ❌ | n/a
msvc | reading uninitialized value printf | ✔️ | ✔️ | 4700
msvc | shifting more than width | ✔️ | ✔️ | 4293
msvc | signed integer overflow | ❌ | ❌ | n/a
msvc | stack overflow | ✔️ | ✔️ | 4717

### Static Analyzers
Tool | Undefined Behavior Type | Warning | Name
--- | --- | --- | ---
clang-tidy | access after realloc | ✔️ | cppcoreguidelines-owning-memory,hicpp-use-auto,cppcoreguidelines-no-malloc,cppcoreguidelines-pro-bounds-pointer-arithmetic,clang-analyzer-unix.Malloc
clang-tidy | array out of bounds | ✔️ | cppcoreguidelines-pro-type-member-init,cppcoreguidelines-pro-bounds-constant-array-index
clang-tidy | dereferencing nullptr | ✔️ | clang-analyzer-core.NullDereference
clang-tidy | divide by zero | ✔️ | clang-analyzer-core.DivideZero,clang-diagnostic-division-by-zero
clang-tidy | large double to float | ❌ | n/a
clang-tidy | large double to int | ❌ | n/a
clang-tidy | mutate const value | ✔️ | cppcoreguidelines-pro-type-const-cast
clang-tidy | out of bounds pointer | ❌ | n/a
clang-tidy | preincrement plus postincrement | ✔️ | clang-diagnostic-unsequenced
clang-tidy | preincrement plus value | ✔️ | clang-diagnostic-unsequenced
clang-tidy | read from old type | ✔️ | hicpp-use-auto,cppcoreguidelines-pro-type-reinterpret-cast,readability-implicit-bool-conversion
clang-tidy | reading uninitialized value add | ✔️ | clang-diagnostic-uninitialized,clang-analyzer-core.UndefinedBinaryOperatorResult
clang-tidy | reading uninitialized value cout | ✔️ | clang-analyzer-core.CallAndMessage,clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value func arg | ✔️ | clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value if | ✔️ | clang-analyzer-core.uninitialized.Branch,clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value partial | ✔️ | clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value printf | ✔️ | clang-analyzer-core.CallAndMessage,cppcoreguidelines-pro-type-vararg,clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value return | ✔️ | clang-diagnostic-return-type
clang-tidy | shifting more than width | ✔️ | hicpp-signed-bitwise,clang-analyzer-core.UndefinedBinaryOperatorResult,clang-diagnostic-shift-count-overflow
clang-tidy | signed integer overflow | ❌ | n/a
clang-tidy | stack overflow | ✔️ | clang-diagnostic-infinite-recursion
cppcheck | access after realloc | ✔️ | n/a
cppcheck | array out of bounds | ❌ | n/a
cppcheck | dereferencing nullptr | ✔️ | n/a
cppcheck | divide by zero | ✔️ | n/a
cppcheck | large double to float | ❌ | n/a
cppcheck | large double to int | ❌ | n/a
cppcheck | mutate const value | ❌ | n/a
cppcheck | out of bounds pointer | ❌ | n/a
cppcheck | preincrement plus postincrement | ❌ | n/a
cppcheck | preincrement plus value | ❌ | n/a
cppcheck | read from old type | ❌ | n/a
cppcheck | reading uninitialized value add | ✔️ | n/a
cppcheck | reading uninitialized value cout | ✔️ | n/a
cppcheck | reading uninitialized value func arg | ❌ | n/a
cppcheck | reading uninitialized value if | ✔️ | n/a
cppcheck | reading uninitialized value partial | ✔️ | n/a
cppcheck | reading uninitialized value printf | ✔️ | n/a
cppcheck | reading uninitialized value return | ❌ | n/a
cppcheck | shifting more than width | ✔️ | n/a
cppcheck | signed integer overflow | ❌ | n/a
cppcheck | stack overflow | ❌ | n/a

### Summary
Undefined Behavior Type | clang | clang-tidy | cppcheck | gcc | msvc
--- | --- | --- | --- | --- | ---
access after realloc | ❌ | ✔️ | ✔️ | ❌ | ❌
array out of bounds | ❌ | ✔️ | ❌ | ❌ | ❌
dereferencing nullptr | ❌ | ✔️ | ✔️ | ❌ | ❌
divide by zero | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
large double to float | ❌ | ❌ | ❌ | ❌ | ❌
large double to int | ❌ | ❌ | ❌ | ❌ | ✔️
mutate const value | ❌ | ✔️ | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus postincrement | ✔️ | ✔️ | ❌ | ✔️ | ❌
preincrement plus value | ✔️ | ✔️ | ❌ | ✔️ | ❌
read from old type | ❌ | ✔️ | ❌ | ❌ | ❌
reading uninitialized value add | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value cout | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value func arg | ❌ | ✔️ | ❌ | ✔️* | ❌
reading uninitialized value if | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value partial | ❌ | ✔️ | ✔️ | ❌ | ❌
reading uninitialized value printf | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value return | ✔️ | ✔️ | ❌ | ✔️ | n/a
shifting more than width | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
signed integer overflow | ❌ | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ❌ | ❌ | ✔️

\* gcc "reading uninitialized value func arg" emitted warning only for optimized build


## Runtime Crashes
### Breakdown
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
clang | access after realloc | ❌ | ❌
clang | array out of bounds | ❌ | ❌
clang | dereferencing nullptr | ✔️ | ❌
clang | divide by zero | ✔️ | ❌
clang | large double to float | ❌ | ❌
clang | large double to int | ❌ | ❌
clang | mutate const value | ❌ | ❌
clang | out of bounds pointer | ❌ | ❌
clang | preincrement plus postincrement | ❌ | ❌
clang | preincrement plus value | ❌ | ❌
clang | read from old type | ❌ | ❌
clang | reading uninitialized value add | ❌ | ❌
clang | reading uninitialized value cout | ❌ | ❌
clang | reading uninitialized value func arg | ❌ | ✔️
clang | reading uninitialized value if | ❌ | ❌
clang | reading uninitialized value partial | ❌ | ❌
clang | reading uninitialized value printf | ❌ | ❌
clang | reading uninitialized value return | ✔️ | ❌
clang | shifting more than width | ❌ | ❌
clang | signed integer overflow | ❌ | ❌
clang | stack overflow | ✔️ | ❌
gcc | access after realloc | ❌ | ❌
gcc | array out of bounds | ❌ | ❌
gcc | dereferencing nullptr | ✔️ | ✔️
gcc | divide by zero | ✔️ | ✔️
gcc | large double to float | ❌ | ❌
gcc | large double to int | ❌ | ❌
gcc | mutate const value | ❌ | ❌
gcc | out of bounds pointer | ❌ | ❌
gcc | preincrement plus postincrement | ❌ | ❌
gcc | preincrement plus value | ❌ | ❌
gcc | read from old type | ❌ | ❌
gcc | reading uninitialized value add | ❌ | ❌
gcc | reading uninitialized value cout | ❌ | ❌
gcc | reading uninitialized value func arg | ❌ | ✔️
gcc | reading uninitialized value if | ❌ | ❌
gcc | reading uninitialized value partial | ✔️ | ❌
gcc | reading uninitialized value printf | ❌ | ❌
gcc | reading uninitialized value return | ❌ | ✔️
gcc | shifting more than width | ❌ | ❌
gcc | signed integer overflow | ❌ | ❌
gcc | stack overflow | ✔️ | ✔️
msvc | access after realloc | ❌ | ❌
msvc | array out of bounds | ✔️ | ❌
msvc | dereferencing nullptr | ✔️ | ✔️
msvc | divide by zero | ✔️ | ✔️
msvc | large double to float | ❌ | ❌
msvc | large double to int | ❌ | ❌
msvc | mutate const value | ❌ | ❌
msvc | out of bounds pointer | ❌ | ❌
msvc | preincrement plus postincrement | ❌ | ❌
msvc | preincrement plus value | ❌ | ❌
msvc | read from old type | ❌ | ❌
msvc | reading uninitialized value add | ✔️ | ❌
msvc | reading uninitialized value cout | ✔️ | ❌
msvc | reading uninitialized value func arg | ✔️ | ✔️
msvc | reading uninitialized value if | ✔️ | ❌
msvc | reading uninitialized value partial | ✔️ | ✔️
msvc | reading uninitialized value printf | ✔️ | ❌
msvc | shifting more than width | ❌ | ❌
msvc | signed integer overflow | ❌ | ❌
msvc | stack overflow | ✔️ | ✔️

### Summary
Undefined Behavior | clang D | gcc D | msvc D | clang R | gcc R | msvc R
--- | --- | --- | --- | --- | --- | ---
access after realloc | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
array out of bounds | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
dereferencing nullptr | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ✔️
divide by zero | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ✔️
large double to float | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
large double to int | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
mutate const value | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus postincrement | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus value | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
read from old type | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading uninitialized value add | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
reading uninitialized value cout | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
reading uninitialized value func arg | ❌ | ❌ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value if | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
reading uninitialized value partial | ❌ | ✔️ | ✔️ | ❌ | ❌ | ✔️
reading uninitialized value printf | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
reading uninitialized value return | ✔️ | ❌ | n/a | ❌ | ✔️ | n/a
shifting more than width | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
signed integer overflow | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ✔️


## Dynamic Analysis
### Breakdown
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
asan | access after realloc | ✔️ | ✔️
asan | array out of bounds | ✔️ | ❌
asan | dereferencing nullptr | ✔️ | ❌
asan | divide by zero | ✔️ | ❌
asan | large double to float | ❌ | ❌
asan | large double to int | ❌ | ❌
asan | mutate const value | ❌ | ❌
asan | out of bounds pointer | ❌ | ❌
asan | preincrement plus postincrement | ❌ | ❌
asan | preincrement plus value | ❌ | ❌
asan | read from old type | ❌ | ❌
asan | reading uninitialized value add | ❌ | ❌
asan | reading uninitialized value cout | ❌ | ❌
asan | reading uninitialized value func arg | ✔️ | ✔️
asan | reading uninitialized value if | ❌ | ❌
asan | reading uninitialized value partial | ❌ | ❌
asan | reading uninitialized value printf | ❌ | ❌
asan | reading uninitialized value return | ✔️ | ✔️
asan | shifting more than width | ❌ | ❌
asan | signed integer overflow | ❌ | ❌
asan | stack overflow | ✔️ | ❌
asan,ubsan | access after realloc | ✔️ | ✔️
asan,ubsan | array out of bounds | ✔️ | ✔️
asan,ubsan | dereferencing nullptr | ✔️ | ✔️
asan,ubsan | divide by zero | ✔️ | ✔️
asan,ubsan | large double to float | ✔️ | ✔️
asan,ubsan | large double to int | ✔️ | ✔️
asan,ubsan | mutate const value | ❌ | ❌
asan,ubsan | out of bounds pointer | ❌ | ❌
asan,ubsan | preincrement plus postincrement | ❌ | ❌
asan,ubsan | preincrement plus value | ❌ | ❌
asan,ubsan | read from old type | ✔️ | ✔️
asan,ubsan | reading uninitialized value add | ❌ | ✔️
asan,ubsan | reading uninitialized value cout | ❌ | ❌
asan,ubsan | reading uninitialized value func arg | ✔️ | ✔️
asan,ubsan | reading uninitialized value if | ❌ | ❌
asan,ubsan | reading uninitialized value partial | ❌ | ❌
asan,ubsan | reading uninitialized value printf | ❌ | ❌
asan,ubsan | reading uninitialized value return | ✔️ | ✔️
asan,ubsan | shifting more than width | ✔️ | ✔️
asan,ubsan | signed integer overflow | ✔️ | ✔️
asan,ubsan | stack overflow | ✔️ | ❌
msan | access after realloc | ❌ | ❌
msan | array out of bounds | ❌ | ❌
msan | dereferencing nullptr | ✔️ | ❌
msan | divide by zero | ❌ | ❌
msan | large double to float | ❌ | ❌
msan | large double to int | ❌ | ❌
msan | mutate const value | ❌ | ❌
msan | out of bounds pointer | ❌ | ❌
msan | preincrement plus postincrement | ❌ | ❌
msan | preincrement plus value | ❌ | ❌
msan | read from old type | ❌ | ❌
msan | reading uninitialized value add | ❌ | ❌
msan | reading uninitialized value cout | ❌ | ❌
msan | reading uninitialized value func arg | ❌ | ✔️
msan | reading uninitialized value if | ✔️ | ❌
msan | reading uninitialized value partial | ❌ | ❌
msan | reading uninitialized value printf | ❌ | ❌
msan | reading uninitialized value return | ✔️ | ✔️
msan | shifting more than width | ❌ | ❌
msan | signed integer overflow | ❌ | ❌
msan | stack overflow | ✔️ | ❌
msan,ubsan | access after realloc | ❌ | ❌
msan,ubsan | array out of bounds | ❌ | ✔️
msan,ubsan | dereferencing nullptr | ✔️ | ✔️
msan,ubsan | divide by zero | ✔️ | ✔️
msan,ubsan | large double to float | ✔️ | ✔️
msan,ubsan | large double to int | ✔️ | ✔️
msan,ubsan | mutate const value | ❌ | ❌
msan,ubsan | out of bounds pointer | ❌ | ❌
msan,ubsan | preincrement plus postincrement | ❌ | ❌
msan,ubsan | preincrement plus value | ❌ | ❌
msan,ubsan | read from old type | ✔️ | ✔️
msan,ubsan | reading uninitialized value add | ❌ | ✔️
msan,ubsan | reading uninitialized value cout | ❌ | ❌
msan,ubsan | reading uninitialized value func arg | ❌ | ✔️
msan,ubsan | reading uninitialized value if | ✔️ | ❌
msan,ubsan | reading uninitialized value partial | ❌ | ❌
msan,ubsan | reading uninitialized value printf | ❌ | ❌
msan,ubsan | reading uninitialized value return | ✔️ | ✔️
msan,ubsan | shifting more than width | ✔️ | ✔️
msan,ubsan | signed integer overflow | ✔️ | ✔️
msan,ubsan | stack overflow | ✔️ | ❌
ubsan | access after realloc | ❌ | ❌
ubsan | array out of bounds | ❌ | ✔️
ubsan | dereferencing nullptr | ✔️ | ✔️
ubsan | divide by zero | ✔️ | ✔️
ubsan | large double to float | ✔️ | ✔️
ubsan | large double to int | ✔️ | ✔️
ubsan | mutate const value | ❌ | ❌
ubsan | out of bounds pointer | ❌ | ❌
ubsan | preincrement plus postincrement | ❌ | ❌
ubsan | preincrement plus value | ❌ | ❌
ubsan | read from old type | ✔️ | ✔️
ubsan | reading uninitialized value add | ❌ | ✔️
ubsan | reading uninitialized value cout | ❌ | ❌
ubsan | reading uninitialized value func arg | ❌ | ✔️
ubsan | reading uninitialized value if | ❌ | ❌
ubsan | reading uninitialized value partial | ❌ | ❌
ubsan | reading uninitialized value printf | ❌ | ❌
ubsan | reading uninitialized value return | ✔️ | ✔️
ubsan | shifting more than width | ✔️ | ✔️
ubsan | signed integer overflow | ✔️ | ✔️
ubsan | stack overflow | ✔️ | ❌
valgrind | access after realloc | ✔️ | ✔️
valgrind | array out of bounds | ❌ | ❌
valgrind | dereferencing nullptr | ✔️ | ✔️
valgrind | divide by zero | ✔️ | ✔️
valgrind | large double to float | ❌ | ❌
valgrind | large double to int | ❌ | ❌
valgrind | mutate const value | ❌ | ❌
valgrind | out of bounds pointer | ❌ | ❌
valgrind | preincrement plus postincrement | ❌ | ❌
valgrind | preincrement plus value | ❌ | ❌
valgrind | read from old type | ❌ | ❌
valgrind | reading uninitialized value add | ✔️ | ❌
valgrind | reading uninitialized value cout | ✔️ | ❌
valgrind | reading uninitialized value func arg | ✔️ | ✔️
valgrind | reading uninitialized value if | ✔️ | ❌
valgrind | reading uninitialized value partial | ✔️ | ❌
valgrind | reading uninitialized value printf | ✔️ | ❌
valgrind | reading uninitialized value return | ❌ | ✔️
valgrind | shifting more than width | ❌ | ❌
valgrind | signed integer overflow | ❌ | ❌
valgrind | stack overflow | ✔️ | ✔️

### Summary
### Debug
Undefined Behavior Type | asan D | asan,ubsan D | msan D | msan,ubsan D | ubsan D | valgrind D
--- | --- | --- | --- | --- | --- | ---
access after realloc | ✔️ | ✔️ | ❌ | ❌ | ❌ | ✔️
array out of bounds | ✔️ | ✔️ | ❌ | ❌ | ❌ | ❌
dereferencing nullptr | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
divide by zero | ✔️ | ✔️ | ❌ | ✔️ | ✔️ | ✔️
large double to float | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
large double to int | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
mutate const value | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus postincrement | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus value | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
read from old type | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
reading uninitialized value add | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading uninitialized value cout | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading uninitialized value func arg | ✔️ | ✔️ | ❌ | ❌ | ❌ | ✔️
reading uninitialized value if | ❌ | ❌ | ✔️ | ✔️ | ❌ | ✔️
reading uninitialized value partial | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading uninitialized value printf | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading uninitialized value return | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ❌
shifting more than width | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
signed integer overflow | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
stack overflow | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
### Release
Undefined Behavior Type | asan R | asan,ubsan R | msan R | msan,ubsan R | ubsan R | valgrind R
--- | --- | --- | --- | --- | --- | ---
access after realloc | ✔️ | ✔️ | ❌ | ❌ | ❌ | ✔️
array out of bounds | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
dereferencing nullptr | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ✔️
divide by zero | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ✔️
large double to float | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
large double to int | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
mutate const value | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus postincrement | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus value | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
read from old type | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
reading uninitialized value add | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
reading uninitialized value cout | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading uninitialized value func arg | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value if | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading uninitialized value partial | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading uninitialized value printf | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading uninitialized value return | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
shifting more than width | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
signed integer overflow | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
stack overflow | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️

## Versions
- Linux 6e685b1d7f64 4.4.0-101-generic #124~14.04.1-Ubuntu SMP Fri Nov 10 19:05:36 UTC 2017 x86\_64 x86\_64 x86\_64 GNU/Linux
- clang: 6.0.0-1ubuntu2 (tags/RELEASE\_600/final)
- clang-tidy: 6.0
- cppcheck 1.82
- GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0 -std=c++17
- MSVC: 2015 Version 14.0.25431.01 Update 3
- valgrind: 3.13.0

## Reference Warning Classes
Compiler | Name | Code | Class
--- | --- | --- | ---
clang | divide by zero  | division-by-zero | default
clang | infinite recursion | infinite-recursion | Most
clang | most | Most | all
clang | shift count overflow | shift-count-overflow | default
clang | uninitialized | uninitialized | Most
clang | return type| return-type  | Most
gcc | divide by zero | div-by-zero | default
gcc | shift count overflow | shift-count-overflow | extra
gcc | return type | return-type | all
gcc | uninitialized | uninitialized | all
MSVC | divide by zero | 4723 | W3
MSVC | uninitialized | 4700 | W1
MSVC | stack overflow | 4717 | W1
MSVC | shift count overflow | 4293 | W1

## Notes
Valgrind was run on GCC compiled binaries. msan, asan, and ubsan are all different flags into clang's "fsanatize" parameter.

Passing means the process halted with a non zero error code. Tests were on intel x86\_64. MSVC was tested on Windows 10 and the rest was tested on Ubuntu 18.04. Debug mode and RelWithDebInfo is in reference to CMake's build types.

There is only one case of each type. It's expected that slightly different implementations of the same types of undefined behavior may yield different results. Multiple runs were not performed consistently for statistical purposes.

There were a few other static analyzers, but they didn't seem appropriate for these problems. I tried OCLint version 0.13.1, but it didn't provide any additional insights besides compiler warnings in regards to undefined behavior. It did warn about short variable names. I also tried cppclean 0.12. It wasn't able to identify undefined behavior issues. It was able to find static data, which is in the stack overflow code by design.

It's recommended for clang-tidy to have a compile database. If it doesn't it will not detect certain errors. For example, it wouldn't detect the stack overflow error.

## Analysis
When in debug mode, MSVC halted on the most undefined behavior. Clang and GCC both benefited with the additional "-Wall" flag to catch undefined behavior as warnings. No extra flags made MSVC catch more undefined behavior.

Valgrind caught a few more cases of undefined behavior over running the programs directly. The additional cases were reading uninitialized values and dereferencing an array out of its bounds. It did provide more actionable messages than just "seg fault." Clang with "-fsanitize=undefined" performed much better in RelWithDebInfo mode over just Debug mode. It caught all types but reading from an uninitialized value and out of bounds pointer.

asan was able to identify the array out of bounds error over the undefined option, but didn't detect other use cases. Once the optimizer works, the address sanitizer is not effective at detecting undefined behavior. Pairing it with ubsan combined the best of both tools.

msan was similar to asan, except it didn't identify any new cases. It also benefited from pairing up with ubsan, but ubsan by itself was good enough.

Reading from an uninitialized value is a very common mistake for beginners and experts. Compilers sometimes catch it as warnings. Valgrind can detect it, but clang with fsantize can often miss it.

## Variablility
Valgrind seems to have different results over time. This may be due to version upgrades from 3.11 to 1.13 or the very nature of undefined behavior itself. It was observed that array out of bounds was undetected by valgrind during the upgrade. Not detecting uninitialized memory in release with debug info went undetected at some point later.
