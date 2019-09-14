# Undefined Behavior Study
A study of undefined behavior on various platforms, compilers, and tools. The undefined behavior types were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs.

## Automated Results

Linux 
[![Build Status](https://travis-ci.org/geoffviola/undefined_behavior_study.svg?branch=master)](https://travis-ci.org/geoffviola/undefined_behavior_study)

Windows 
[![Build status](https://ci.appveyor.com/api/projects/status/sewu7060d0mn6v8i/branch/master?svg=true)](https://ci.appveyor.com/project/geoffviola/undefined_behavior_study/branch/master)

## 1.Static Analysis
### 1.1.Compiler Warnings
Compiler | Undefined Behavior Type | Warning | Warning Opt | Name
--- | --- | --- | --- | ---
clang | access after realloc | ❌ | ❌ | n/a
clang | array out of bounds | ❌ | ❌ | n/a
clang | dereferencing nullptr | ❌ | ❌ | n/a
clang | divide by zero | ✔️ | ✔️ | -Wdivision-by-zero
clang | initialize std string with nullptr | ❌ | ❌ | n/a
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
clang | reading uninitialized value lib call ptr | ❌ | ❌ | n/a
clang | reading uninitialized value partial | ❌ | ❌ | n/a
clang | reading uninitialized value printf | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value return | ✔️ | ✔️ | -Wreturn-type
clang | reference out of scope | ✔️ | ✔️ | -Wreturn-stack-address
clang | shifting more than width | ✔️ | ✔️ | -Wshift-count-overflow
clang | signed integer overflow | ❌ | ❌ | n/a
clang | stack overflow | ✔️ | ✔️ | -Winfinite-recursion
clang | std vector reserve set read | ❌ | ❌ | n/a
clang | strptime mktime unitialized | ❌ | ❌ | n/a
gcc | access after realloc | ❌ | ❌ | n/a
gcc | array out of bounds | ❌ | ❌ | n/a
gcc | dereferencing nullptr | ❌ | ❌ | n/a
gcc | divide by zero | ✔️ | ✔️ | -Wdiv-by-zero
gcc | initialize std string with nullptr | ❌ | ❌ | n/a
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
gcc | reading uninitialized value lib call ptr | ❌ | ❌ | n/a
gcc | reading uninitialized value partial | ❌ | ❌ | n/a
gcc | reading uninitialized value printf | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value return | ✔️ | ✔️ | -Wreturn-type
gcc | reference out of scope | ✔️ | ✔️ | -Wreturn-local-addr
gcc | shifting more than width | ✔️ | ✔️ | -Wshift-count-overflow
gcc | signed integer overflow | ❌ | ❌ | n/a
gcc | stack overflow | ❌ | ❌ | n/a
gcc | std vector reserve set read | ❌ | ❌ | n/a
gcc | strptime mktime unitialized | ❌ | ❌ | n/a
msvc | access after realloc | ❌ | ❌ | n/a
msvc | array out of bounds | ❌ | ❌ | n/a
msvc | dereferencing nullptr | ❌ | ❌ | n/a
msvc | divide by zero | ✔️ | ✔️ | 4723
msvc | initialize std string with nullptr | ❌ | ❌ | n/a
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
msvc | reading uninitialized value lib call ptr | ❌ | ❌ | n/a
msvc | reading uninitialized value partial | ❌ | ❌ | n/a
msvc | reading uninitialized value printf | ✔️ | ✔️ | 4700
msvc | reference out of scope | ✔️ | ✔️ | 4172
msvc | shifting more than width | ✔️ | ✔️ | 4293
msvc | signed integer overflow | ❌ | ❌ | n/a
msvc | stack overflow | ✔️ | ✔️ | 4717
msvc | std vector reserve set read | ❌ | ❌ | n/a

### 1.2.Static Analyzers
Tool | Undefined Behavior Type | Warning | Name
--- | --- | --- | ---
clang-tidy | access after realloc | ✔️ | cppcoreguidelines-owning-memory,hicpp-use-auto,cppcoreguidelines-no-malloc,cppcoreguidelines-pro-bounds-pointer-arithmetic,clang-analyzer-unix.Malloc
clang-tidy | array out of bounds | ✔️ | cppcoreguidelines-pro-type-member-init,cppcoreguidelines-pro-bounds-constant-array-index
clang-tidy | dereferencing nullptr | ✔️ | clang-analyzer-core.NullDereference
clang-tidy | divide by zero | ✔️ | clang-analyzer-core.DivideZero,clang-diagnostic-division-by-zero
clang-tidy | initialize std string with nullptr | ❌ | n/a
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
clang-tidy | reading uninitialized value lib call ptr | ❌ | n/a
clang-tidy | reading uninitialized value partial | ✔️ | clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value printf | ✔️ | clang-analyzer-core.CallAndMessage,cppcoreguidelines-pro-type-vararg,clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value return | ✔️ | clang-diagnostic-return-type
clang-tidy | reference out of scope | ✔️ | clang-analyzer-core.StackAddressEscape,clang-diagnostic-return-stack-address
clang-tidy | shifting more than width | ✔️ | hicpp-signed-bitwise,clang-analyzer-core.UndefinedBinaryOperatorResult,clang-diagnostic-shift-count-overflow
clang-tidy | signed integer overflow | ❌ | n/a
clang-tidy | stack overflow | ✔️ | clang-diagnostic-infinite-recursion
clang-tidy | std vector reserve set read | ❌ | n/a
clang-tidy | strptime mktime unitialized | ✔️ | cppcoreguidelines-pro-type-member-init
cppcheck | access after realloc | ✔️ | n/a
cppcheck | array out of bounds | ❌ | n/a
cppcheck | dereferencing nullptr | ✔️ | n/a
cppcheck | divide by zero | ✔️ | n/a
cppcheck | initialize std string with nullptr | ❌ | n/a
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
cppcheck | reading uninitialized value lib call ptr | ✔️ | n/a
cppcheck | reading uninitialized value partial | ✔️ | n/a
cppcheck | reading uninitialized value printf | ✔️ | n/a
cppcheck | reading uninitialized value return | ❌ | n/a
cppcheck | reference out of scope | ✔️ | n/a
cppcheck | shifting more than width | ✔️ | n/a
cppcheck | signed integer overflow | ❌ | n/a
cppcheck | stack overflow | ❌ | n/a
cppcheck | std vector reserve set read | ❌ | n/a
cppcheck | strptime mktime unitialized | ❌ | n/a

### 1.3.Static Analysis Summary
Debug (unoptimized) / RelWithDebInfo (optimized)

Undefined Behavior Type | clang | clang-tidy | cppcheck | gcc | msvc
--- | --- | --- | --- | --- | ---
access after realloc | ❌ | ✔️ | ✔️ | ❌ | ❌
array out of bounds | ❌ | ✔️ | ❌ | ❌ | ❌
dereferencing nullptr | ❌ | ✔️ | ✔️ | ❌ | ❌
divide by zero | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
initialize std string with nullptr | ❌ | ❌ | ❌ | ❌ | ❌
large double to float | ❌ | ❌ | ❌ | ❌ | ❌
large double to int | ❌ | ❌ | ❌ | ❌ | ✔️
mutate const value | ❌ | ✔️ | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus postincrement | ✔️ | ✔️ | ❌ | ✔️ | ❌
preincrement plus value | ✔️ | ✔️ | ❌ | ✔️ | ❌
read from old type | ❌ | ✔️ | ❌ | ❌ | ❌
reading uninitialized value add | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value cout | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value func arg | ❌ | ✔️ | ❌ | ❌/✔️ | ❌
reading uninitialized value if | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value lib call ptr | ❌ | ❌ | ✔️ | ❌ | ❌
reading uninitialized value partial | ❌ | ✔️ | ✔️ | ❌ | ❌
reading uninitialized value printf | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value return | ✔️ | ✔️ | ❌ | ✔️ | n/a
reference out of scope | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
shifting more than width | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
signed integer overflow | ❌ | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ❌ | ❌ | ✔️
std vector reserve set read | ❌ | ❌ | ❌ | ❌ | ❌
strptime mktime unitialized | ❌ | ✔️ | ❌ | ❌ | n/a


## 2.Runtime Crashes
### 2.1.Runtime Crashes Return Codes
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
clang | access after realloc | 0 | 0
clang | array out of bounds | 0 | 0
clang | dereferencing nullptr | 139 | 0
clang | divide by zero | 136 | 0
clang | initialize std string with nullptr | 134 | 134
clang | large double to float | 0 | 0
clang | large double to int | 0 | 0
clang | mutate const value | 0 | 0
clang | out of bounds pointer | 0 | 0
clang | preincrement plus postincrement | 0 | 0
clang | preincrement plus value | 0 | 0
clang | read from old type | 0 | 0
clang | reading uninitialized value add | 0 | 0
clang | reading uninitialized value cout | 0 | 0
clang | reading uninitialized value func arg | 0 | 139
clang | reading uninitialized value if | 0 | 0
clang | reading uninitialized value lib call ptr | 0 | 0
clang | reading uninitialized value partial | 0 | 0
clang | reading uninitialized value printf | 0 | 0
clang | reading uninitialized value return | 132 | 0
clang | reference out of scope | 0 | 0
clang | shifting more than width | 0 | 0
clang | signed integer overflow | 0 | 0
clang | stack overflow | 139 | 0
clang | std vector reserve set read | 0 | 0
clang | strptime mktime unitialized | 0 | 0
gcc | access after realloc | 0 | 0
gcc | array out of bounds | 0 | 0
gcc | dereferencing nullptr | 139 | 139
gcc | divide by zero | 136 | 132
gcc | initialize std string with nullptr | 134 | 134
gcc | large double to float | 0 | 0
gcc | large double to int | 0 | 0
gcc | mutate const value | 0 | 0
gcc | out of bounds pointer | 0 | 0
gcc | preincrement plus postincrement | 0 | 0
gcc | preincrement plus value | 0 | 0
gcc | read from old type | 0 | 0
gcc | reading uninitialized value add | 0 | 0
gcc | reading uninitialized value cout | 0 | 0
gcc | reading uninitialized value func arg | 0 | 139
gcc | reading uninitialized value if | 0 | 0
gcc | reading uninitialized value lib call ptr | 0 | 0
gcc | reading uninitialized value partial | 139 | 0
gcc | reading uninitialized value printf | 0 | 0
gcc | reading uninitialized value return | 0 | 139
gcc | reference out of scope | 139 | 139
gcc | shifting more than width | 0 | 0
gcc | signed integer overflow | 0 | 0
gcc | stack overflow | 139 | 139
gcc | std vector reserve set read | 0 | 0
gcc | strptime mktime unitialized | 0 | 0
msvc | access after realloc | 0 | 0
msvc | array out of bounds | -1 | 0
msvc | dereferencing nullptr | -1073741819 | -1073741819
msvc | divide by zero | -1073741676 | -1073741676
msvc | initialize std string with nullptr | -1073741819 | -1073741819
msvc | large double to float | 0 | 0
msvc | large double to int | 0 | 0
msvc | mutate const value | 0 | 0
msvc | out of bounds pointer | 0 | 0
msvc | preincrement plus postincrement | 0 | 0
msvc | preincrement plus value | 0 | 0
msvc | read from old type | 0 | 0
msvc | reading uninitialized value add | -1 | 0
msvc | reading uninitialized value cout | -1 | 0
msvc | reading uninitialized value func arg | -1073741819 | -1073740791
msvc | reading uninitialized value if | -1 | 0
msvc | reading uninitialized value lib call ptr | 0 | 0
msvc | reading uninitialized value partial | -1 | -1073740791
msvc | reading uninitialized value printf | -1 | 0
msvc | reference out of scope | 0 | 0
msvc | shifting more than width | 0 | 0
msvc | signed integer overflow | 0 | 0
msvc | stack overflow | -1073741571 | -1073741571
msvc | std vector reserve set read | -1 | 0

### 2.2.Runtime Crashes Summary
Debug (unoptimized) / RelWithDebInfo (optimized)

Undefined Behavior | clang | gcc | msvc
--- | --- | --- | ---
access after realloc | ❌ | ❌ | ❌
array out of bounds | ❌ | ❌ | ✔️/❌
dereferencing nullptr | ✔️/❌ | ✔️ | ✔️
divide by zero | ✔️/❌ | ✔️ | ✔️
initialize std string with nullptr | ✔️ | ✔️ | ✔️
large double to float | ❌ | ❌ | ❌
large double to int | ❌ | ❌ | ❌
mutate const value | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌
preincrement plus postincrement | ❌ | ❌ | ❌
preincrement plus value | ❌ | ❌ | ❌
read from old type | ❌ | ❌ | ❌
reading uninitialized value add | ❌ | ❌ | ✔️/❌
reading uninitialized value cout | ❌ | ❌ | ✔️/❌
reading uninitialized value func arg | ❌/✔️ | ❌/✔️ | ✔️
reading uninitialized value if | ❌ | ❌ | ✔️/❌
reading uninitialized value lib call ptr | ❌ | ❌ | ❌
reading uninitialized value partial | ❌ | ✔️/❌ | ✔️
reading uninitialized value printf | ❌ | ❌ | ✔️/❌
reading uninitialized value return | ✔️/❌ | ❌/✔️ | n/a
reference out of scope | ❌ | ✔️ | ❌
shifting more than width | ❌ | ❌ | ❌
signed integer overflow | ❌ | ❌ | ❌
stack overflow | ✔️/❌ | ✔️ | ✔️
std vector reserve set read | ❌ | ❌ | ✔️/❌
strptime mktime unitialized | ❌ | ❌ | n/a


## 3.Dynamic Analysis
### 3.1.Dynamic Analysis Return Codes
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
asan | access after realloc | 1 | 1
asan | array out of bounds | 1 | 0
asan | dereferencing nullptr | 1 | 0
asan | divide by zero | 1 | 0
asan | initialize std string with nullptr | 134 | 134
asan | large double to float | 0 | 0
asan | large double to int | 0 | 0
asan | mutate const value | 0 | 0
asan | out of bounds pointer | 0 | 0
asan | preincrement plus postincrement | 0 | 0
asan | preincrement plus value | 0 | 0
asan | read from old type | 0 | 0
asan | reading uninitialized value add | 0 | 0
asan | reading uninitialized value cout | 0 | 0
asan | reading uninitialized value func arg | 1 | 1
asan | reading uninitialized value if | 0 | 0
asan | reading uninitialized value lib call ptr | 0 | 0
asan | reading uninitialized value partial | 0 | 0
asan | reading uninitialized value printf | 0 | 0
asan | reading uninitialized value return | 132 | 240
asan | reference out of scope | 0 | 0
asan | shifting more than width | 0 | 0
asan | signed integer overflow | 0 | 0
asan | stack overflow | 1 | 0
asan | std vector reserve set read | 0 | 0
asan | strptime mktime unitialized | 0 | 0
asan,ubsan | access after realloc | 1 | 1
asan,ubsan | array out of bounds | 1 | 1
asan,ubsan | dereferencing nullptr | 1 | 1
asan,ubsan | divide by zero | 1 | 1
asan,ubsan | initialize std string with nullptr | 134 | 134
asan,ubsan | large double to float | 1 | 1
asan,ubsan | large double to int | 1 | 1
asan,ubsan | mutate const value | 0 | 0
asan,ubsan | out of bounds pointer | 0 | 0
asan,ubsan | preincrement plus postincrement | 0 | 0
asan,ubsan | preincrement plus value | 0 | 0
asan,ubsan | read from old type | 1 | 1
asan,ubsan | reading uninitialized value add | 0 | 1
asan,ubsan | reading uninitialized value cout | 0 | 0
asan,ubsan | reading uninitialized value func arg | 1 | 1
asan,ubsan | reading uninitialized value if | 0 | 0
asan,ubsan | reading uninitialized value lib call ptr | 0 | 0
asan,ubsan | reading uninitialized value partial | 0 | 0
asan,ubsan | reading uninitialized value printf | 0 | 0
asan,ubsan | reading uninitialized value return | 1 | 1
asan,ubsan | reference out of scope | 0 | 0
asan,ubsan | shifting more than width | 1 | 1
asan,ubsan | signed integer overflow | 1 | 1
asan,ubsan | stack overflow | 1 | 0
asan,ubsan | std vector reserve set read | 0 | 0
asan,ubsan | strptime mktime unitialized | 0 | 0
msan | access after realloc | 0 | 0
msan | array out of bounds | 0 | 0
msan | dereferencing nullptr | 77 | 0
msan | divide by zero | 0 | 0
msan | initialize std string with nullptr | 134 | 134
msan | large double to float | 0 | 0
msan | large double to int | 0 | 0
msan | mutate const value | 0 | 0
msan | out of bounds pointer | 0 | 0
msan | preincrement plus postincrement | 0 | 0
msan | preincrement plus value | 0 | 0
msan | read from old type | 0 | 0
msan | reading uninitialized value add | 0 | 0
msan | reading uninitialized value cout | 0 | 0
msan | reading uninitialized value func arg | 0 | 77
msan | reading uninitialized value if | 77 | 0
msan | reading uninitialized value lib call ptr | 0 | 0
msan | reading uninitialized value partial | 0 | 0
msan | reading uninitialized value printf | 0 | 0
msan | reading uninitialized value return | 132 | 80
msan | reference out of scope | 0 | 0
msan | shifting more than width | 0 | 0
msan | signed integer overflow | 0 | 0
msan | stack overflow | 77 | 0
msan | std vector reserve set read | 0 | 0
msan | strptime mktime unitialized | 0 | 0
msan,ubsan | access after realloc | 0 | 0
msan,ubsan | array out of bounds | 0 | 77
msan,ubsan | dereferencing nullptr | 77 | 77
msan,ubsan | divide by zero | 77 | 77
msan,ubsan | initialize std string with nullptr | 134 | 134
msan,ubsan | large double to float | 77 | 77
msan,ubsan | large double to int | 77 | 77
msan,ubsan | mutate const value | 0 | 0
msan,ubsan | out of bounds pointer | 0 | 0
msan,ubsan | preincrement plus postincrement | 0 | 0
msan,ubsan | preincrement plus value | 0 | 0
msan,ubsan | read from old type | 77 | 77
msan,ubsan | reading uninitialized value add | 0 | 77
msan,ubsan | reading uninitialized value cout | 0 | 0
msan,ubsan | reading uninitialized value func arg | 0 | 77
msan,ubsan | reading uninitialized value if | 77 | 0
msan,ubsan | reading uninitialized value lib call ptr | 0 | 0
msan,ubsan | reading uninitialized value partial | 0 | 0
msan,ubsan | reading uninitialized value printf | 0 | 0
msan,ubsan | reading uninitialized value return | 77 | 77
msan,ubsan | reference out of scope | 0 | 0
msan,ubsan | shifting more than width | 77 | 77
msan,ubsan | signed integer overflow | 77 | 77
msan,ubsan | stack overflow | 77 | 0
msan,ubsan | std vector reserve set read | 0 | 0
msan,ubsan | strptime mktime unitialized | 0 | 0
ubsan | access after realloc | 0 | 0
ubsan | array out of bounds | 0 | 1
ubsan | dereferencing nullptr | 1 | 1
ubsan | divide by zero | 1 | 1
ubsan | initialize std string with nullptr | 134 | 134
ubsan | large double to float | 1 | 1
ubsan | large double to int | 1 | 1
ubsan | mutate const value | 0 | 0
ubsan | out of bounds pointer | 0 | 0
ubsan | preincrement plus postincrement | 0 | 0
ubsan | preincrement plus value | 0 | 0
ubsan | read from old type | 1 | 1
ubsan | reading uninitialized value add | 0 | 1
ubsan | reading uninitialized value cout | 0 | 0
ubsan | reading uninitialized value func arg | 0 | 1
ubsan | reading uninitialized value if | 0 | 0
ubsan | reading uninitialized value lib call ptr | 0 | 0
ubsan | reading uninitialized value partial | 0 | 0
ubsan | reading uninitialized value printf | 0 | 0
ubsan | reading uninitialized value return | 1 | 1
ubsan | reference out of scope | 0 | 0
ubsan | shifting more than width | 1 | 1
ubsan | signed integer overflow | 1 | 1
ubsan | stack overflow | 1 | 0
ubsan | std vector reserve set read | 0 | 0
ubsan | strptime mktime unitialized | 0 | 0
valgrind | access after realloc | 1 | 1
valgrind | array out of bounds | 0 | 0
valgrind | dereferencing nullptr | 139 | 139
valgrind | divide by zero | 136 | 132
valgrind | initialize std string with nullptr | 134 | 134
valgrind | large double to float | 0 | 0
valgrind | large double to int | 0 | 0
valgrind | mutate const value | 0 | 0
valgrind | out of bounds pointer | 0 | 0
valgrind | preincrement plus postincrement | 0 | 0
valgrind | preincrement plus value | 0 | 0
valgrind | read from old type | 0 | 0
valgrind | reading uninitialized value add | 1 | 0
valgrind | reading uninitialized value cout | 1 | 0
valgrind | reading uninitialized value func arg | 1 | 139
valgrind | reading uninitialized value if | 1 | 0
valgrind | reading uninitialized value lib call ptr | 1 | 1
valgrind | reading uninitialized value partial | 139 | 0
valgrind | reading uninitialized value printf | 1 | 0
valgrind | reading uninitialized value return | 0 | 139
valgrind | reference out of scope | 139 | 139
valgrind | shifting more than width | 0 | 0
valgrind | signed integer overflow | 0 | 0
valgrind | stack overflow | 139 | 139
valgrind | std vector reserve set read | 0 | 0
valgrind | strptime mktime unitialized | 1 | 1

### 3.2.1.Dynamic Analysis Summary
Debug (unoptimized) / RelWithDebInfo (optimized)

Undefined Behavior Type | asan | asan,ubsan | msan | msan,ubsan | ubsan | valgrind
--- | --- | --- | --- | --- | --- | ---
access after realloc | ✔️ | ✔️ | ❌ | ❌ | ❌ | ✔️
array out of bounds | ✔️/❌ | ✔️ | ❌ | ❌/✔️ | ❌/✔️ | ❌
dereferencing nullptr | ✔️/❌ | ✔️ | ✔️/❌ | ✔️ | ✔️ | ✔️
divide by zero | ✔️/❌ | ✔️ | ❌ | ✔️ | ✔️ | ✔️
initialize std string with nullptr | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
large double to float | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
large double to int | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
mutate const value | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus postincrement | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus value | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
read from old type | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
reading uninitialized value add | ❌ | ❌/✔️ | ❌ | ❌/✔️ | ❌/✔️ | ✔️/❌
reading uninitialized value cout | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️/❌
reading uninitialized value func arg | ✔️ | ✔️ | ❌/✔️ | ❌/✔️ | ❌/✔️ | ✔️
reading uninitialized value if | ❌ | ❌ | ✔️/❌ | ✔️/❌ | ❌ | ✔️/❌
reading uninitialized value lib call ptr | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
reading uninitialized value partial | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️/❌
reading uninitialized value printf | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️/❌
reading uninitialized value return | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ❌/✔️
reference out of scope | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️
shifting more than width | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
signed integer overflow | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ❌
stack overflow | ✔️/❌ | ✔️/❌ | ✔️/❌ | ✔️/❌ | ✔️/❌ | ✔️
std vector reserve set read | ❌ | ❌ | ❌ | ❌ | ❌ | ❌
strptime mktime unitialized | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️


### 4.Overall Summary
Undefined Behavior Type | Compiler Warning | Standalone Static Analysis | Runtime Crash | Extra Dynamic Analsyis
--- | --- | --- | --- | ---
access after realloc | ❌ | ✔️ | ❌ | ✔️
array out of bounds | ❌ | ✔️ | ✔️ | ✔️
dereferencing nullptr | ❌ | ✔️ | ✔️ | ✔️
divide by zero | ✔️ | ✔️ | ✔️ | ✔️
initialize std string with nullptr | ❌ | ❌ | ✔️ | ✔️
large double to float | ❌ | ❌ | ❌ | ✔️
large double to int | ✔️ | ❌ | ❌ | ✔️
mutate const value | ❌ | ✔️ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌
preincrement plus postincrement | ✔️ | ✔️ | ❌ | ❌
preincrement plus value | ✔️ | ✔️ | ❌ | ❌
read from old type | ❌ | ✔️ | ❌ | ✔️
reading uninitialized value add | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value cout | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value func arg | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value if | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value lib call ptr | ❌ | ✔️ | ❌ | ✔️
reading uninitialized value partial | ❌ | ✔️ | ✔️ | ✔️
reading uninitialized value printf | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value return | ✔️ | ✔️ | ✔️ | ✔️
reference out of scope | ✔️ | ✔️ | ✔️ | ✔️
shifting more than width | ✔️ | ✔️ | ❌ | ✔️
signed integer overflow | ❌ | ❌ | ❌ | ✔️
stack overflow | ✔️ | ✔️ | ✔️ | ✔️
std vector reserve set read | ❌ | ❌ | ✔️ | ❌
strptime mktime unitialized | ❌ | ✔️ | ❌ | ✔️


## Versions
- Linux 057709d713c0 4.9.184-linuxkit #1 SMP Tue Jul 2 22:58:16 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
- clang: 6.0.0-1ubuntu2 (tags/RELEASE\_600/final)
- clang-tidy: 6.0
- cppcheck 1.82
- gcc (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0 -std=c++17
- MSVC: 2019 Version 14.22.27905
- Windows SDK version 10.0.18362.0 to target Windows 10.0.17763
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
MSVC | truncation of constant value | 4309 | W2

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
