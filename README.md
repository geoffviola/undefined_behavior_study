# undefined_behavior_study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

## Compiler Study

Compiler | Undefined Behavior Type | Warnings | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
clang | array out of bounds | ❌ | ❌ | ❌ |
clang | dereferencing nullptr | ❌ | ✔️ | ❌ |
clang | divide by zero | ✔️ | ✔️ | ❌ |
clang | out of bounds pointer | ❌ | ❌ | ❌ |
clang | reading unitialized value | ✔️ -Wall  | ❌| ❌ |
clang | shifting more than width | ✔️ | ❌ | ❌ |
clang | signed integer overflow | ❌ | ❌ | ❌ |
clang | stack overflow | ✔️ -Wall  | ✔️ | ❌ |
gcc | array out of bounds | ❌ | ❌ | ❌ |
gcc | dereferencing nullptr | ❌ | ✔️ | ✔️ |
gcc | divide by zero | ✔️ | ✔️ | ✔️ |
gcc | out of bounds pointer | ❌ | ❌ | ❌ |
gcc | reading unitialized value | ✔️ /Wall | ❌| ❌ |
gcc | shifting more than width | ✔️ | ❌ | ❌ |
gcc | signed integer overflow | ❌ | ❌ | ❌ |
gcc | stack overflow | ❌ | ✔️ | ❌ |
MSVC | array out of bounds | ❌ | ✔️ | ❌ |
MSVC | dereferencing nullptr | ❌ | ✔️ | ✔️ |
MSVC | divide by zero | ✔️ /W3 | ✔️ | ✔️ |
MSVC | out of bounds pointer | ❌ | ✔️ | ❌ |
MSVC | reading unitialized value | ✔️ /W1 | ✔️ | ❌ |
MSVC | shifting more than width | ✔️ /W1 | ❌ | ❌ |
MSVC | signed integer overflow | ❌ | ❌ | ❌ |
MSVC | stack overflow | ✔️ /W1 | ✔️ | ❌ |

## Dynamic Analyzer Study

Tool | Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
clang undefined sanitizer | clang | array out of bounds | ❌ | ✔️ |
clang undefined sanitizer | clang | dereferencing nullptr | ✔️ | ✔️ |
clang undefined sanitizer | clang | divide by zero | ✔️ | ✔️ |
clang undefined sanitizer | clang | out of bounds pointer | ❌ | ✔️ |
clang undefined sanitizer | clang | reading unitialized value | ❌ | ❌ |
clang undefined sanitizer | clang | shifting more than width | ✔️ | ✔️ |
clang undefined sanitizer | clang | signed integer overflow | ✔️ | ✔️ |
clang undefined sanitizer | clang | stack overflow | ✔️ | ✔️ |
valgrind | gcc | array out of bounds | ❌ | ❌ |
valgrind | gcc | dereferencing nullptr | ✔️ | ✔️ |
valgrind | gcc | divide by zero | ✔️ | ✔️ |
valgrind | gcc | out of bounds pointer | ❌ | ❌ |
valgrind | gcc | reading unitialized value | ✔️| ❌ |
valgrind | gcc | shifting more than width | ❌ | ❌ |
valgrind | gcc | signed integer overflow | ❌ | ❌ |
valgrind | gcc | stack overflow | ✔️ | ❌ |

## Versions
- GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
- clang: 3.8.0-2ubuntu4 (tags/RELEASE_380/final)
- MSVC: 2015 Version 14.0.25431.01 Update 3
- valgrind: 3.11.0

## Notes
Passing means the process halted. Tests were on intel x86_64. MSVC was tested on Windows 10 and the rest was tested on Ubuntu 16.04.
