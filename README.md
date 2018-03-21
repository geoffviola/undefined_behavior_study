# Undefined Behavior Study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

## Automated Results

Linux 
[![Build Status](https://travis-ci.org/geoffviola/undefined_behavior_study.svg?branch=master)](https://travis-ci.org/geoffviola/undefined_behavior_study)

Windows 
[![Build status](https://ci.appveyor.com/api/projects/status/sewu7060d0mn6v8i/branch/master?svg=true)](https://ci.appveyor.com/project/geoffviola/undefined_behavior_study/branch/master)

## Compiler Study

Compiler | Undefined Behavior Type | Warnings | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
clang | array out of bounds | ❌ | ❌ | ❌ |
clang | dereferencing nullptr | ❌ | ✔️ | ❌ |
clang | divide by zero | ✔️ | ✔️ | ❌ |
clang | out of bounds pointer | ❌ | ❌ | ❌ |
clang | reading uninitialized value add | ✔️ -Wall  | ❌| ❌ |
clang | reading uninitialized value cout | ✔️ -Wall  | ❌| ❌ |
clang | reading uninitialized value if | ✔️ -Wall  | ❌| ❌ |
clang | reading uninitialized value printf | ✔️ -Wall  | ❌| ❌ |
clang | shifting more than width | ✔️ | ❌ | ❌ |
clang | signed integer overflow | ❌ | ❌ | ❌ |
clang | stack overflow | ✔️ -Wall  | ✔️ | ✔️ |
gcc | array out of bounds | ❌ | ❌ | ❌ |
gcc | dereferencing nullptr | ❌ | ✔️ | ✔️ |
gcc | divide by zero | ✔️ | ✔️ | ✔️ |
gcc | out of bounds pointer | ❌ | ❌ | ❌ |
gcc | reading uninitialized value add | ✔️ /Wall | ❌| ❌ |
gcc | reading uninitialized value cout | ✔️ /Wall | ❌| ❌ |
gcc | reading uninitialized value if | ✔️ /Wall | ❌| ❌ |
gcc | reading uninitialized value printf | ✔️ /Wall | ❌| ❌ |
gcc | shifting more than width | ✔️ | ❌ | ❌ |
gcc | signed integer overflow | ❌ | ❌ | ❌ |
gcc | stack overflow | ❌ | ✔️ | ✔️ |
MSVC | array out of bounds | ❌ | ✔️ | ❌ |
MSVC | dereferencing nullptr | ❌ | ✔️ | ✔️ |
MSVC | divide by zero | ✔️ /W3 | ✔️ | ✔️ |
MSVC | out of bounds pointer | ❌ | ❌ | ❌ |
MSVC | reading uninitialized value add | ✔️ /W1 | ✔️ | ❌ |
MSVC | reading uninitialized value cout | ✔️ /W1 | ✔️ | ❌ |
MSVC | reading uninitialized value if | ✔️ /W1 | ✔️ | ❌ |
MSVC | reading uninitialized value printf | ✔️ /W1 | ✔️ | ❌ |
MSVC | shifting more than width | ✔️ /W1 | ❌ | ❌ |
MSVC | signed integer overflow | ❌ | ❌ | ❌ |
MSVC | stack overflow | ✔️ /W1 | ✔️ | ✔️ |

## Dynamic Analyzer Study

Tool | Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
clang undefined sanitizer | clang | array out of bounds | ❌ | ✔️ |
clang undefined sanitizer | clang | dereferencing nullptr | ✔️ | ✔️ |
clang undefined sanitizer | clang | divide by zero | ✔️ | ✔️ |
clang undefined sanitizer | clang | out of bounds pointer | ❌ | ❌  |
clang undefined sanitizer | clang | reading uninitialized value add | ❌ | ✔️ |
clang undefined sanitizer | clang | reading uninitialized value cout | ❌ | ❌ |
clang undefined sanitizer | clang | reading uninitialized value if | ❌ | ❌ |
clang undefined sanitizer | clang | reading uninitialized value printf | ❌ | ❌ |
clang undefined sanitizer | clang | shifting more than width | ✔️ | ✔️ |
clang undefined sanitizer | clang | signed integer overflow | ✔️ | ✔️ |
clang undefined sanitizer | clang | stack overflow | ✔️ | ✔️ |
valgrind | gcc | array out of bounds | ✔️ | ✔️ |
valgrind | gcc | dereferencing nullptr | ✔️ | ✔️ |
valgrind | gcc | divide by zero | ✔️ | ✔️ |
valgrind | gcc | out of bounds pointer | ❌ | ❌ |
valgrind | gcc | reading uninitialized value add | ✔️| ✔️ |
valgrind | gcc | reading uninitialized value cout | ✔️| ✔️ |
valgrind | gcc | reading uninitialized value if | ✔️| ✔️ |
valgrind | gcc | reading uninitialized value printf | ✔️| ✔️ |
valgrind | gcc | shifting more than width | ❌ | ❌ |
valgrind | gcc | signed integer overflow | ❌ | ❌ |
valgrind | gcc | stack overflow | ✔️ | ✔️ |

## Versions
- clang: 3.8.0-2ubuntu4 (tags/RELEASE\_380/final)
- GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
- MSVC: 2015 Version 14.0.25431.01 Update 3
- valgrind: 3.11.0

## Notes
Passing means the process halted. Tests were on intel x86\_64. MSVC was tested on Windows 10 and the rest was tested on Ubuntu 16.04. Debug mode and RelWithDebInfo is in reference to CMake's build types.

There is only one case of each type. It's expected that slightly different implementations of the same types of undefined behavior may yield different results.

## Analysis
When in debug mode, MSVC halted on the most undefined behavior. Clang and GCC both benefited with the additional "-Wall" flag to catch undefined behavior as warnings. No extra flags made MSVC catch more undefined behavior.

Valgrind caught a few more cases of undefined behavior over running the programs directly. The additional cases were reading uninitialized values and dereferencing an array out of its bounds. It did provide more actionable messages than just "seg fault." Clang with the "-fsanitize=undefined" performed much better in RelWithDebInfo mode over just Debug mode. It caught all types but reading from an uninitialized value and out of bounds pointer.

Reading from an uninitialized value is a very common mistake for beginners and experts. Compilers sometimes catch it as warnings. Valgrind can detect it, but clang with fsantize can often miss it.
