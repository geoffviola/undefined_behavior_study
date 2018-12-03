# Undefined Behavior Study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

## Automated Results

Linux 
[![Build Status](https://travis-ci.org/geoffviola/undefined_behavior_study.svg?branch=master)](https://travis-ci.org/geoffviola/undefined_behavior_study)

Windows 
[![Build status](https://ci.appveyor.com/api/projects/status/sewu7060d0mn6v8i/branch/master?svg=true)](https://ci.appveyor.com/project/geoffviola/undefined_behavior_study/branch/master)

## Static Analysis
### Breakdown
Compiler | Undefined Behavior Type | Warning | Warning Opt | Name
--- | --- | --- | --- | ---
clang | array out of bounds | ❌ | ❌ | n/a
clang | dereferencing nullptr | ❌ | ❌ | n/a
clang | divide by zero | ✔️ | ✔️ | -Wdivision-by-zero
clang | out of bounds pointer | ❌ | ❌ | n/a
clang | reading uninitialized value add | ✔️ | ✔️ | -Wuninitialized (-WMost) (-Wall)
clang | reading uninitialized value cout | ✔️ | ✔️ |  -Wuninitialized (-WMost) (-Wall)
clang | reading uninitialized value func arg | ❌ | ❌ | n/a
clang | reading uninitialized value if | ✔️ | ✔️ | -Wuninitialized (-WMost) (-Wall)
clang | reading uninitialized value partial | ❌ | ❌ | n/a
clang | reading uninitialized value printf | ✔️ | ✔️ | -Wuninitialized (-WMost) (-Wall)
clang | reading uninitialized value return | ✔️ | ✔️ | -Wreturn-type (-WMost) (-Wall)
clang | shifting more than width | ✔️ | ✔️ | -Wshift-count-overflow
clang | signed integer overflow | ❌ | ❌ | n/a
clang | stack overflow | ✔️ | ✔️ | -Winfinite-recursion (-WMost) (-Wall)
gcc | array out of bounds | ❌ | ❌ | n/a
gcc | dereferencing nullptr | ❌ | ❌ | n/a
gcc | divide by zero | ✔️ | ✔️ | -Wdiv-by-zero
gcc | out of bounds pointer | ❌ | ❌ | n/a
gcc | reading uninitialized value add | ✔️ | ✔️ | -Wuninitialized (-Wall)
gcc | reading uninitialized value cout | ✔️ | ✔️ | -Wuninitialized (-Wall)
gcc | reading uninitialized value func arg | ❌ | ✔️ | -Wuninitialized (-Wall)
gcc | reading uninitialized value if | ✔️ | ✔️ | -Wuninitialized (-Wall)
gcc | reading uninitialized value partial | ❌ | ❌ | n/a
gcc | reading uninitialized value printf | ✔️ | ✔️ | -Wuninitialized (-Wall)
gcc | reading uninitialized value return | ✔️ | ✔️ | -Wreturn-type (-Wall)
gcc | shifting more than width | ✔️ | ✔️ | -Wshift-count-overflow (-Wextra)
gcc | signed integer overflow | ❌ | ❌ | n/a
gcc | stack overflow | ❌ | ❌ | n/a
MSVC | array out of bounds | ❌ | ❌ | n/a
MSVC | dereferencing nullptr | ❌ | ❌ | n/a
MSVC | divide by zero | ✔️ | ✔️ | /W3
MSVC | out of bounds pointer | ❌ | ❌ | n/a
MSVC | reading uninitialized value add | ✔️ | ✔️ | /W1 
MSVC | reading uninitialized value cout | ✔️ | ✔️ | /W1
MSVC | reading uninitialized value if | ✔️ | ✔️ | /W1
MSVC | reading uninitialized value printf | ✔️ | ✔️ | /W1
MSVC | shifting more than width | ✔️ | ✔️ | /W1
MSVC | signed integer overflow | ❌ | ❌ | n/a
MSVC | stack overflow | ✔️ | ✔️ | /W1

Tool | Undefined Behavior Type | Warning | Name
--- | --- | --- | ---
clang-tidy | array out of bounds | ✔️ | cppcoreguidelines-pro-bounds-constant-array-index
clang-tidy | dereferencing nullptr | ✔️ | clang-analyzer-core.NullDereference
clang-tidy | divide by zero | ✔️ | clang-diagnostic-division-by-zero
clang-tidy | out of bounds pointer | ❌ |
clang-tidy | reading uninitialized value add | ✔️ | clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value cout | ✔️ | clang-analyzer-core.CallAndMessage
clang-tidy | reading unitialized value func arg | ✔️ | clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value if | ✔️ | clang-analyzer-core.uninitialized.Branch
clang-tidy | reading unitialized value partial | ✔️ | clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value printf | ✔️ | clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value return | ✔️ | clang-diagnostic-return-type
clang-tidy | shifting more than width | ✔️ | clang-analyzer-core.UndefinedBinaryOperatorResult
clang-tidy | signed integer overflow | ❌ |
clang-tidy | stack overflow | ✔️ | clang-diagnostic-infinite-recursion

### Summary
Undefined Behavior Type | clang | clang-tidy | cppcheck | gcc | MSVC 
--- | --- | --- | --- | --- | ---
array out of bounds | ❌ | ✔️ | ❌ | ❌ | ❌
dereferencing nullptr | ❌ | ✔️ | ✔️ | ❌ |  ❌
divide by zero | ✔️  | ✔️ | ✔️ | ✔️  | ✔️ 
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌
reading uninitialized value add | ✔️  | ✔️  | ✔️  | ✔️ | ✔️
reading uninitialized value cout | ✔️ | ✔️  | ✔️  | ✔️ | ✔️
reading unitialized value func arg | ❌ | ✔️ | ❌ | ⚠️ | ❌
reading uninitialized value if | ✔️  | ✔️  | ✔️  | ✔️ | ✔️
reading unitialized value partial | ❌ | ✔️ | ✔️ | ✔️ | ❌
reading uninitialized value printf | ✔️  | ✔️  | ✔️  | ✔️ | ✔️
reading uninitialized value return | ✔️  | ✔️  | ❌  | ❌ | ❌
shifting more than width | ✔️ | ✔️  | ✔️  | ✔️ | ✔️
signed integer overflow | ❌ | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️  | ❌ | ❌ | ✔️

## Runtime Crashes
### Breakdown
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
clang | array out of bounds | ❌ | ❌
clang | dereferencing nullptr | ✔️ | ❌
clang | divide by zero | ✔️ | ❌
clang | out of bounds pointer | ❌ | ❌
clang | reading unitialized value add | ❌ | ❌
clang | reading unitialized value cout | ❌ | ❌
clang | reading unitialized value func arg | ❌ | ✔️
clang | reading unitialized value if | ❌ | ❌
clang | reading unitialized value partial | ❌ | ❌
clang | reading unitialized value printf | ❌ | ❌
clang | reading unitialized value return | ✔️ | ❌
clang | shifting more than width | ❌ | ❌
clang | signed integer overflow | ❌ | ❌
clang | stack overflow | ✔️ | ❌
gcc | array out of bounds | ❌ | ❌
gcc | dereferencing nullptr | ✔️ | ✔️
gcc | divide by zero | ✔️ | ✔️
gcc | out of bounds pointer | ❌ | ❌
gcc | reading unitialized value add | ❌ | ❌
gcc | reading unitialized value cout | ❌ | ❌
gcc | reading unitialized value func arg | ❌ | ✔️
gcc | reading unitialized value if | ❌ | ❌
gcc | reading unitialized value partial | ✔️ | ❌
gcc | reading unitialized value printf | ❌ | ❌
gcc | reading unitialized value return | ❌ | ✔️
gcc | shifting more than width | ❌ | ❌
gcc | signed integer overflow | ❌ | ❌
gcc | stack overflow | ✔️ | ✔️
MSVC | array out of bounds | ✔️ | ❌
MSVC | dereferencing nullptr | ✔️ | ✔️
MSVC | divide by zero | ✔️ | ✔️
MSVC | out of bounds pointer | ❌ | ❌
MSVC | reading unitialized value add | ✔️ | ❌
MSVC | reading unitialized value cout | ✔️ | ❌
MSVC | reading unitialized value func arg | ✔️ | ❌
MSVC | reading unitialized value if | ✔️ | ❌
MSVC | reading unitialized value partial | ✔️ | ✔️
MSVC | reading unitialized value printf | ✔️ | ❌
MSVC | reading unitialized value return | n/a | n/a
MSVC | shifting more than width | ❌ | ❌
MSVC | signed integer overflow | ❌ | ❌
MSVC | stack overflow | ✔️ | ✔️
### Summary
Undefined Behavior | clang D | gcc D | MSVC D | clang R | gcc R | MSVC R
--- | --- | --- | --- | --- | --- | ---
array out of bounds | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
dereferencing nullptr | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ✔️
divide by zero | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ✔️
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading unitialized value add | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
reading unitialized value cout | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
reading unitialized value func arg | ❌ | ❌ | ✔️ | ✔️ | ✔️ | ❌
reading unitialized value if | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
reading unitialized value partial | ❌ | ✔️ | ✔️ | ❌ | ❌ | ✔️
reading unitialized value printf | ❌ | ❌ | ✔️ | ❌ | ❌ | ❌
reading unitialized value return | ✔️ | ❌ | n/a | ❌ | ✔️ | n/a
shifting more than width | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
signed integer overflow | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ✔️
## Dynamic Analysis
### Breakdown
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
asan | array out of bounds | ✔️ | ❌
asan | dereferencing nullptr | ✔️ | ❌
asan | divide by zero | ✔️ | ❌
asan | out of bounds pointer | ❌ | ❌
asan | reading unitialized value add | ❌ | ❌
asan | reading unitialized value cout | ❌ | ❌
asan | reading unitialized value func arg | ✔️ | ✔️
asan | reading unitialized value if | ❌ | ❌
asan | reading unitialized value partial | ❌ | ❌
asan | reading unitialized value printf | ❌ | ❌
asan | reading unitialized value return | ✔️ | ✔️
asan | shifting more than width | ❌ | ❌
asan | signed integer overflow | ❌ | ❌
asan | stack overflow | ✔️ | ❌
asan,ubsan | array out of bounds | ✔️ | ✔️
asan,ubsan | dereferencing nullptr | ✔️ | ✔️
asan,ubsan | divide by zero | ✔️ | ✔️
asan,ubsan | out of bounds pointer | ❌ | ❌
asan,ubsan | reading unitialized value add | ❌ | ✔️
asan,ubsan | reading unitialized value cout | ❌ | ❌
asan,ubsan | reading unitialized value func arg | ✔️ | ✔️
asan,ubsan | reading unitialized value if | ❌ | ❌
asan,ubsan | reading unitialized value partial | ❌ | ❌
asan,ubsan | reading unitialized value printf | ❌ | ❌
asan,ubsan | reading unitialized value return | ✔️ | ✔️
asan,ubsan | shifting more than width | ✔️ | ✔️
asan,ubsan | signed integer overflow | ✔️ | ✔️
asan,ubsan | stack overflow | ✔️ | ❌
msan | array out of bounds | ❌ | ❌
msan | dereferencing nullptr | ✔️ | ❌
msan | divide by zero | ❌ | ❌
msan | out of bounds pointer | ❌ | ❌
msan | reading unitialized value add | ❌ | ❌
msan | reading unitialized value cout | ❌ | ❌
msan | reading unitialized value func arg | ❌ | ✔️
msan | reading unitialized value if | ✔️ | ❌
msan | reading unitialized value partial | ❌ | ❌
msan | reading unitialized value printf | ❌ | ❌
msan | reading unitialized value return | ✔️ | ✔️
msan | shifting more than width | ❌ | ❌
msan | signed integer overflow | ❌ | ❌
msan | stack overflow | ✔️ | ❌
msan,ubsan | array out of bounds | ❌ | ✔️
msan,ubsan | dereferencing nullptr | ✔️ | ✔️
msan,ubsan | divide by zero | ✔️ | ✔️
msan,ubsan | out of bounds pointer | ❌ | ❌
msan,ubsan | reading unitialized value add | ❌ | ✔️
msan,ubsan | reading unitialized value cout | ❌ | ❌
msan,ubsan | reading unitialized value func arg | ❌ | ✔️
msan,ubsan | reading unitialized value if | ✔️ | ❌
msan,ubsan | reading unitialized value partial | ❌ | ❌
msan,ubsan | reading unitialized value printf | ❌ | ❌
msan,ubsan | reading unitialized value return | ✔️ | ✔️
msan,ubsan | shifting more than width | ✔️ | ✔️
msan,ubsan | signed integer overflow | ✔️ | ✔️
msan,ubsan | stack overflow | ✔️ | ❌
ubsan | array out of bounds | ❌ | ✔️
ubsan | dereferencing nullptr | ✔️ | ✔️
ubsan | divide by zero | ✔️ | ✔️
ubsan | out of bounds pointer | ❌ | ❌
ubsan | reading unitialized value add | ❌ | ✔️
ubsan | reading unitialized value cout | ❌ | ❌
ubsan | reading unitialized value func arg | ❌ | ✔️
ubsan | reading unitialized value if | ❌ | ❌
ubsan | reading unitialized value partial | ❌ | ❌
ubsan | reading unitialized value printf | ❌ | ❌
ubsan | reading unitialized value return | ✔️ | ✔️
ubsan | shifting more than width | ✔️ | ✔️
ubsan | signed integer overflow | ✔️ | ✔️
ubsan | stack overflow | ✔️ | ❌
valgrind | array out of bounds | ❌ | ❌
valgrind | dereferencing nullptr | ✔️ | ✔️
valgrind | divide by zero | ✔️ | ✔️
valgrind | out of bounds pointer | ❌ | ❌
valgrind | reading unitialized value add | ✔️ | ❌
valgrind | reading unitialized value cout | ✔️ | ❌
valgrind | reading unitialized value func arg | ✔️ | ✔️
valgrind | reading unitialized value if | ✔️ | ❌
valgrind | reading unitialized value partial | ✔️ | ❌
valgrind | reading unitialized value printf | ✔️ | ❌
valgrind | reading unitialized value return | ❌ | ✔️
valgrind | shifting more than width | ❌ | ❌
valgrind | signed integer overflow | ❌ | ❌
valgrind | stack overflow | ✔️ | ✔️

### Summary
### Debug
Undefined Behavior Type | asan D | asan,ubsan D | msan D | msan,ubsan D | ubsan D | valgrind D
--- | --- | --- | --- | --- | --- | ---
array out of bounds | ✔️ | ✔️ | ❌ | ❌ | ❌ | ❌
dereferencing nullptr | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
divide by zero | ✔️ | ✔️ | ❌ | ✔️ | ✔️ | ✔️
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading unitialized value add | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading unitialized value cout | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading unitialized value func arg | ✔️ | ✔️ | ❌ | ❌ | ❌ | ✔️
reading unitialized value if | ❌ | ❌ | ✔️ | ✔️ | ❌ | ✔️
reading unitialized value partial | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading unitialized value printf | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading unitialized value return | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ❌
shifting more than width | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
signed integer overflow | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
stack overflow | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
### Release
Undefined Behavior Type | asan R | asan,ubsan R | msan R | msan,ubsan R | ubsan R | valgrind R
--- | --- | --- | --- | --- | --- | ---
array out of bounds | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
dereferencing nullptr | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ✔️
divide by zero | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ✔️
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading unitialized value add | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
reading unitialized value cout | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading unitialized value func arg | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading unitialized value if | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading unitialized value partial | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading unitialized value printf | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
reading unitialized value return | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
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

## Analysis
When in debug mode, MSVC halted on the most undefined behavior. Clang and GCC both benefited with the additional "-Wall" flag to catch undefined behavior as warnings. No extra flags made MSVC catch more undefined behavior.

Valgrind caught a few more cases of undefined behavior over running the programs directly. The additional cases were reading uninitialized values and dereferencing an array out of its bounds. It did provide more actionable messages than just "seg fault." Clang with "-fsanitize=undefined" performed much better in RelWithDebInfo mode over just Debug mode. It caught all types but reading from an uninitialized value and out of bounds pointer.

asan was able to identify the array out of bounds error over the undefined option, but didn't detect other use cases. Once the optimizer works, the address sanitizer is not effective at detecting undefined behavior. Pairing it with ubsan combined the best of both tools.

msan was similar to asan, except it didn't identify any new cases. It also benefited from pairing up with ubsan, but ubsan by itself was good enough.

Reading from an uninitialized value is a very common mistake for beginners and experts. Compilers sometimes catch it as warnings. Valgrind can detect it, but clang with fsantize can often miss it.

## Variablility
Valgrind seems to have different results over time. This may be due to version upgrades from 3.11 to 1.13 or the very nature of undefined behavior itself. It was observed that array out of bounds was undetected by valgrind during the upgrade. Not detecting uninitialized memory in release with debug info went undetected at some point later.

