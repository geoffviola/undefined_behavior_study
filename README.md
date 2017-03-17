# undefined_behavior_study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

## Compiler Study

Compiler | Undefined Behavior Type | Warnings | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
MSVC 2015 Version 14.0.25431.01 Update 3 | array out of bounds | ❌ | ✔️ | ❌ |
MSVC 2015 Version 14.0.25431.01 Update 3 | dereferencing nullptr | ❌ | ✔️ | ✔️ |
MSVC 2015 Version 14.0.25431.01 Update 3 | divide by zero | ✔️ /W3 | ✔️ | ✔️ |
MSVC 2015 Version 14.0.25431.01 Update 3 | out of bounds pointer | ❌ | ✔️ | ❌ |
MSVC 2015 Version 14.0.25431.01 Update 3 | reading unitialized value | ✔️ /W1 | ✔️ | ❌ |
MSVC 2015 Version 14.0.25431.01 Update 3 | shifting more than width | ✔️ /W1 | ❌ | ❌ |
MSVC 2015 Version 14.0.25431.01 Update 3 | signed integer overflow | ❌ | ❌ | ❌ |
MSVC 2015 Version 14.0.25431.01 Update 3 | stack overflow | ✔️ /W1 | ✔️ | ❌ |
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | array out of bounds | ❌ | ❌ | ❌ |
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | dereferencing nullptr | ❌ | ✔️ | ✔️ |
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | divide by zero | ✔️ | ✔️ | ✔️ |
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | out of bounds pointer | ❌ | ❌ | ❌ |
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | reading unitialized value | ✔️ /Wall | ❌| ❌ |
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | shifting more than width | ✔️ | ❌ | ❌ |
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | signed integer overflow | ❌ | ❌ | ❌ |
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | stack overflow | ❌ | ✔️ | ❌ |
clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final) | array out of bounds | ❌ | ❌ | ❌ |
clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final) | dereferencing nullptr | ❌ | ✔️ | ❌ |
clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final) | divide by zero | ✔️ | ✔️ | ❌ |
clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final) | out of bounds pointer | ❌ | ❌ | ❌ |
clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final) | reading unitialized value | ✔️ -Wall  | ❌| ❌ |
clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final) | shifting more than width | ✔️ | ❌ | ❌ |
clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final) | signed integer overflow | ❌ | ❌ | ❌ |
clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final) | stack overflow | ✔️ -Wall  | ✔️ | ❌ |

## Dynamic Analyzer Study

Tool | Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
valgrind | gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | array out of bounds | ❌ | ❌ |
valgrind | gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | dereferencing nullptr | ✔️ | ✔️ |
valgrind | gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | divide by zero | ✔️ | ✔️ |
valgrind | gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | out of bounds pointer | ❌ | ❌ |
valgrind | gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | reading unitialized value | ✔️| ❌ |
valgrind | gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | shifting more than width | ❌ | ❌ |
valgrind | gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | signed integer overflow | ❌ | ❌ |
valgrind | gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 | stack overflow | ✔️ | ❌ |
clang undefined sanitizer | clang | array out of bounds | ❌ | ✔️ |
clang undefined sanitizer | clang | dereferencing nullptr | ✔️ | ✔️ |
clang undefined sanitizer | clang | divide by zero | ✔️ | ✔️ |
clang undefined sanitizer | clang | out of bounds pointer | ❌ | ✔️ |
clang undefined sanitizer | clang | reading unitialized value | ❌ | ❌ |
clang undefined sanitizer | clang | shifting more than width | ✔️ | ✔️ |
clang undefined sanitizer | clang | signed integer overflow | ✔️ | ✔️ |
clang undefined sanitizer | clang | stack overflow | ✔️ | ✔️ |


## Notes
Passing means the process halted. Tests were on intel x86_64. MSVC was tested on Windows 10 and the rest was tested on Ubuntu 16.04.
