# Undefined Behavior Study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

## Automated Results

Linux 
[![Build Status](https://travis-ci.org/geoffviola/undefined_behavior_study.svg?branch=master)](https://travis-ci.org/geoffviola/undefined_behavior_study)

Windows 
[![Build status](https://ci.appveyor.com/api/projects/status/sewu7060d0mn6v8i/branch/master?svg=true)](https://ci.appveyor.com/project/geoffviola/undefined_behavior_study/branch/master)

## Static Analysis
### Breakdown
Compiler | Undefined Behavior Type | Warning
--- | --- | ---
clang | array out of bounds | ❌
clang | dereferencing nullptr | ❌
clang | divide by zero | ✔️
clang | out of bounds pointer | ❌
clang | reading uninitialized value add | ✔️ -Wall
clang | reading uninitialized value cout | ✔️ -Wall
clang | reading uninitialized value if | ✔️ -Wall
clang | reading uninitialized value printf | ✔️ -Wall
clang | shifting more than width | ✔️
clang | signed integer overflow | ❌
clang | stack overflow | ✔️ -Wall
clang-tidy | array out of bounds | ✔️ cppcoreguidelines-pro-bounds-constant-array-index
clang-tidy | dereferencing nullptr | ✔️ clang-analyzer-core.NullDereference
clang-tidy | divide by zero | ✔️ clang-diagnostic-division-by-zero
clang-tidy | out of bounds pointer | ❌
clang-tidy | reading uninitialized value add | ✔️ clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value cout | ✔️ clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value if | ✔️ clang-analyzer-core.uninitialized.Branch
clang-tidy | reading uninitialized value printf | ✔️ clang-analyzer-core.CallAndMessage
clang-tidy | shifting more than width | ✔️ clang-analyzer-core.UndefinedBinaryOperatorResult
clang-tidy | signed integer overflow | ❌
clang-tidy | stack overflow | ✔️ clang-diagnostic-infinite-recursion
gcc | array out of bounds | ❌
gcc | dereferencing nullptr | ❌
gcc | divide by zero | ✔️
gcc | out of bounds pointer | ❌
gcc | reading uninitialized value add | ✔️ /Wall
gcc | reading uninitialized value cout | ✔️ /Wall
gcc | reading uninitialized value if | ✔️ /Wall
gcc | reading uninitialized value printf | ✔️ /Wall
gcc | shifting more than width | ✔️
gcc | signed integer overflow | ❌
gcc | stack overflow | ❌
MSVC | array out of bounds | ❌
MSVC | dereferencing nullptr | ❌
MSVC | divide by zero | ✔️ /W3
MSVC | out of bounds pointer | ❌
MSVC | reading uninitialized value add | ✔️ /W1
MSVC | reading uninitialized value cout | ✔️ /W1
MSVC | reading uninitialized value if | ✔️ /W1
MSVC | reading uninitialized value printf | ✔️ /W1
MSVC | shifting more than width | ✔️ /W1
MSVC | signed integer overflow | ❌
MSVC | stack overflow | ✔️ /W1

### Summary
Undefined Behavior Type | clang | clang-tidy | gcc | MSVC 
--- | --- | --- | --- | ---
array out of bounds | ❌ | ✔️  | ❌ | ❌
dereferencing nullptr | ❌ | ✔️ | ❌ |  ❌
divide by zero | ✔️  | ✔️  | ✔️  | ✔️ 
out of bounds pointer | ❌ | ❌ | ❌ | ❌
reading uninitialized value add | ✔️  | ✔️  | ✔️  | ✔️
reading uninitialized value cout | ✔️ | ✔️  | ✔️  | ✔️
reading uninitialized value if | ✔️  | ✔️  | ✔️  | ✔️
reading uninitialized value printf | ✔️  | ✔️  | ✔️  | ✔️
shifting more than width | ✔️ | ✔️  | ✔️  | ✔️
signed integer overflow | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️  | ❌ | ✔️

## Runtime Crashes
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
clang | array out of bounds | ❌ | ❌
clang | dereferencing nullptr | ✔️ | ❌
clang | divide by zero | ✔️ | ❌
clang | out of bounds pointer | ❌ | ❌
clang | reading unitialized value add | ❌ | ❌
clang | reading unitialized value cout | ❌ | ❌
clang | reading unitialized value if | ❌ | ❌
clang | reading unitialized value printf | ❌ | ❌
clang | shifting more than width | ❌ | ❌
clang | signed integer overflow | ❌ | ❌
clang | stack overflow | ✔️ | ❌
gcc | array out of bounds | ❌ | ❌
gcc | dereferencing nullptr | ✔️ | ✔️
gcc | divide by zero | ✔️ | ✔️
gcc | out of bounds pointer | ❌ | ❌
gcc | reading unitialized value add | ❌ | ❌
gcc | reading unitialized value cout | ❌ | ❌
gcc | reading unitialized value if | ❌ | ❌
gcc | reading unitialized value printf | ❌ | ❌
gcc | shifting more than width | ❌ | ❌
gcc | signed integer overflow | ❌ | ❌
gcc | stack overflow | ✔️ | ✔️
MSVC | array out of bounds | ✔️ | ❌ |
MSVC | dereferencing nullptr | ✔️ | ✔️ |
MSVC | divide by zero | ✔️ | ✔️ |
MSVC | out of bounds pointer | ❌ | ❌ |
MSVC | reading uninitialized value add | ✔️ | ❌ |
MSVC | reading uninitialized value cout | ✔️ | ❌ |
MSVC | reading uninitialized value if | ✔️ | ❌ |
MSVC | reading uninitialized value printf | ✔️ | ❌ |
MSVC | shifting more than width | ❌ | ❌ |
MSVC | signed integer overflow | ❌ | ❌ |
MSVC | stack overflow | ✔️ | ✔️ |

### Summary
Undefined Behavior | clang D | gcc D | clang R | gcc R
--- | --- | --- | --- | ---
array out of bounds | ❌ | ❌ | ❌ | ❌ | 
dereferencing nullptr | ✔️ | ✔️ | ❌ | ✔️ | 
divide by zero | ✔️ | ✔️ | ❌ | ✔️ | 
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | 
reading unitialized value add | ❌ | ❌ | ❌ | ❌ | 
reading unitialized value cout | ❌ | ❌ | ❌ | ❌ | 
reading unitialized value if | ❌ | ❌ | ❌ | ❌ | 
reading unitialized value printf | ❌ | ❌ | ❌ | ❌ | 
shifting more than width | ❌ | ❌ | ❌ | ❌ | 
signed integer overflow | ❌ | ❌ | ❌ | ❌ | 
stack overflow | ✔️ | ✔️ | ❌ | ✔️ | 

## Dynamic Analyzer Study
### Breakdown
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
asan | array out of bounds | ✔️ | ❌
asan | dereferencing nullptr | ✔️ | ❌
asan | divide by zero | ✔️ | ❌
asan | out of bounds pointer | ❌ | ❌
asan | reading unitialized value add | ❌ | ❌
asan | reading unitialized value cout | ❌ | ❌
asan | reading unitialized value if | ❌ | ❌
asan | reading unitialized value printf | ❌ | ❌
asan | shifting more than width | ❌ | ❌
asan | signed integer overflow | ❌ | ❌
asan | stack overflow | ✔️ | ❌
asan,ubsan | array out of bounds | ✔️ | ✔️
asan,ubsan | dereferencing nullptr | ✔️ | ✔️
asan,ubsan | divide by zero | ✔️ | ✔️
asan,ubsan | out of bounds pointer | ❌ | ❌
asan,ubsan | reading unitialized value add | ❌ | ✔️
asan,ubsan | reading unitialized value cout | ❌ | ❌
asan,ubsan | reading unitialized value if | ❌ | ❌
asan,ubsan | reading unitialized value printf | ❌ | ❌
asan,ubsan | shifting more than width | ✔️ | ✔️
asan,ubsan | signed integer overflow | ✔️ | ✔️
asan,ubsan | stack overflow | ✔️ | ❌
msan | array out of bounds | ❌ | ❌
msan | dereferencing nullptr | ✔️ | ❌
msan | divide by zero | ❌ | ❌
msan | out of bounds pointer | ❌ | ❌
msan | reading unitialized value add | ❌ | ❌
msan | reading unitialized value cout | ❌ | ❌
msan | reading unitialized value if | ✔️ | ❌
msan | reading unitialized value printf | ❌ | ❌
msan | shifting more than width | ❌ | ❌
msan | signed integer overflow | ❌ | ❌
msan | stack overflow | ✔️ | ❌
msan,ubsan | array out of bounds | ❌ | ✔️
msan,ubsan | dereferencing nullptr | ✔️ | ✔️
msan,ubsan | divide by zero | ✔️ | ✔️
msan,ubsan | out of bounds pointer | ❌ | ❌
msan,ubsan | reading unitialized value add | ❌ | ✔️
msan,ubsan | reading unitialized value cout | ❌ | ❌
msan,ubsan | reading unitialized value if | ✔️ | ❌
msan,ubsan | reading unitialized value printf | ❌ | ❌
msan,ubsan | shifting more than width | ✔️ | ✔️
msan,ubsan | signed integer overflow | ✔️ | ✔️
msan,ubsan | stack overflow | ✔️ | ❌
ubsan | array out of bounds | ❌ | ✔️
ubsan | dereferencing nullptr | ✔️ | ✔️
ubsan | divide by zero | ✔️ | ✔️
ubsan | out of bounds pointer | ❌ | ❌
ubsan | reading unitialized value add | ❌ | ✔️
ubsan | reading unitialized value cout | ❌ | ❌
ubsan | reading unitialized value if | ❌ | ❌
ubsan | reading unitialized value printf | ❌ | ❌
ubsan | shifting more than width | ✔️ | ✔️
ubsan | signed integer overflow | ✔️ | ✔️
ubsan | stack overflow | ✔️ | ❌
valgrind | array out of bounds | ❌ | ❌
valgrind | dereferencing nullptr | ✔️ | ✔️
valgrind | divide by zero | ✔️ | ✔️
valgrind | out of bounds pointer | ❌ | ❌
valgrind | reading unitialized value add | ✔️ | ❌
valgrind | reading unitialized value cout | ✔️ | ❌
valgrind | reading unitialized value if | ✔️ | ❌
valgrind | reading unitialized value printf | ✔️ | ❌
valgrind | shifting more than width | ❌ | ❌
valgrind | signed integer overflow | ❌ | ❌
valgrind | stack overflow | ✔️ | ✔️

### Summary
Undefined Behavior Type | asan D | asan,ubsan D | msan D | msan,ubsan D | valgrind D | asan D | asan,ubsan D | msan D | msan,ubsan D | valgrind D
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
array out of bounds | ✔️ | ✔️ | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌ | 
dereferencing nullptr | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ✔️ | 
divide by zero | ✔️ | ✔️ | ❌ | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ✔️ | 
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | 
reading unitialized value add | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌ | 
reading unitialized value cout | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | 
reading unitialized value if | ❌ | ❌ | ✔️ | ✔️ | ❌ | ✔️ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | 
reading unitialized value printf | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | 
shifting more than width | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌ | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌ | 
signed integer overflow | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌ | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌ | 
stack overflow | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | 

## Versions
- Linux 6e685b1d7f64 4.4.0-101-generic #124~14.04.1-Ubuntu SMP Fri Nov 10 19:05:36 UTC 2017 x86\_64 x86\_64 x86\_64 GNU/Linux
- clang: 6.0.0-1ubuntu2 (tags/RELEASE\_600/final)
- clang-tidy: 6.0
- GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0 -std=c++17
- MSVC: 2015 Version 14.0.25431.01 Update 3
- valgrind: 3.13.0

## Notes
Valgrind was run on GCC compiled binaries. msan, asan, and ubsan are all different flags into clang's "fsanatize" parameter.

Passing means the process halted with a non zero error code. Tests were on intel x86\_64. MSVC was tested on Windows 10 and the rest was tested on Ubuntu 18.04. Debug mode and RelWithDebInfo is in reference to CMake's build types.

There is only one case of each type. It's expected that slightly different implementations of the same types of undefined behavior may yield different results. Multiple runs were not performed consistently for statistical purposes. 

## Analysis
When in debug mode, MSVC halted on the most undefined behavior. Clang and GCC both benefited with the additional "-Wall" flag to catch undefined behavior as warnings. No extra flags made MSVC catch more undefined behavior.

Valgrind caught a few more cases of undefined behavior over running the programs directly. The additional cases were reading uninitialized values and dereferencing an array out of its bounds. It did provide more actionable messages than just "seg fault." Clang with "-fsanitize=undefined" performed much better in RelWithDebInfo mode over just Debug mode. It caught all types but reading from an uninitialized value and out of bounds pointer. Clang with "-fsanitize=address" was able to identify the array out of bounds error over the undefined option, but didn't detect other use cases. Once the optimizer works, the address sanitizer is not effective at detecting undefined behavior.

Reading from an uninitialized value is a very common mistake for beginners and experts. Compilers sometimes catch it as warnings. Valgrind can detect it, but clang with fsantize can often miss it.

## Variablility
Valgrind seems to have different results over time. This may be due to version upgrades from 3.11 to 1.13 or the very nature of undefined behavior itself. It was observed that array out of bounds was undetected by valgrind during the upgrade. Not detecting unitialized memory in release with debug info went undetected at some point later.

