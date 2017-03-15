# undefined_behavior_study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

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
