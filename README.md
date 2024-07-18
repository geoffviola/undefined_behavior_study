# Undefined Behavior Study
A study of undefined behavior on various platforms, compilers, and tools. 
Some examples were inspired by https://www.nayuki.io/page/undefined-behavior-in-c-and-cplusplus-programs. There are some highlights in the video below.

[![Explanation Video](https://user-images.githubusercontent.com/10720055/181924542-7395c433-4256-4e76-81c1-1c610550c086.jpg)](https://www.youtube.com/watch?v=EkZLN_D1BwU)


## Automated Results

Linux 
[![Build Status](https://app.travis-ci.com/geoffviola/undefined_behavior_study.svg?token=n7xWtQG4q8zpsz5mSNsp&branch=master)](https://app.travis-ci.com/geoffviola/undefined_behavior_study)

Windows 
[![Build status](https://ci.appveyor.com/api/projects/status/65bhemledj07s8jt?svg=true)](https://ci.appveyor.com/project/geoffviola/undefined-behavior-study)

## 1.Static Analysis
### 1.1.Compiler Warnings
Compiler | Undefined Behavior Type | Warning | Warning Opt | Name
--- | --- | --- | --- | ---
clang | access after realloc | ❌ | ❌ | n/a
clang | array out of bounds | ❌ | ❌ | n/a
clang | automatic variable over stack | ❌ | ❌ | n/a
clang | bad alignment | ❌ | ❌ | n/a
clang | bad identifier name | ❌ | ❌ | n/a
clang | delete incomplete type | ✔️ | ✔️ | -Wdelete-incomplete
clang | dereferencing nullptr | ❌ | ❌ | n/a
clang | divide by zero | ✔️ | ✔️ | -Wdivision-by-zero
clang | initialize std string with nullptr | ❌ | ❌ | n/a
clang | large double to int | ❌ | ❌ | n/a
clang | malloc cast pod struct | ❌ | ❌ | n/a
clang | mutate const value | ❌ | ❌ | n/a
clang | non trivial destructor and global | ❌ | ❌ | n/a
clang | odr violation function | ❌ | ❌ | n/a
clang | odr violation function lib | ❌ | ❌ | n/a
clang | odr violation struct ret | ❌ | ❌ | n/a
clang | odr violation struct ret lib | ❌ | ❌ | n/a
clang | operator star on empty optional | ❌ | ❌ | n/a
clang | out of bounds pointer | ❌ | ❌ | n/a
clang | preincrement plus postincrement | ✔️ | ✔️ | -Wunsequenced
clang | preincrement plus value | ✔️ | ✔️ | -Wunsequenced
clang | read from old type | ❌ | ❌ | n/a
clang | reading uninitialized value add | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value cout | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value func arg | ❌ | ❌ | n/a
clang | reading uninitialized value if | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value lib call cref | ✔️ | ✔️ | -Wuninitialized-const-reference
clang | reading uninitialized value partial | ❌ | ❌ | n/a
clang | reading uninitialized value printf | ✔️ | ✔️ | -Wuninitialized
clang | reading uninitialized value return | ✔️ | ✔️ | -Wreturn-type
clang | reference out of scope | ✔️ | ✔️ | -Wreturn-stack-address
clang | reinterpret cast bad size | ❌ | ❌ | n/a
clang | reinterpret cast float to int32 | ❌ | ❌ | n/a
clang | reinterpret cast int32 to float | ❌ | ❌ | n/a
clang | reinterpret cast int32 to uint32 | ❌ | ❌ | n/a
clang | reinterpret cast uint32 to int32 | ❌ | ❌ | n/a
clang | reinterpret cast unaligned bytes to uint32 | ❌ | ❌ | n/a
clang | shifting more than width | ✔️ | ✔️ | -Wshift-count-overflow
clang | signed integer overflow | ❌ | ❌ | n/a
clang | sort comp reflexive | ❌ | ❌ | n/a
clang | stack overflow | ✔️ | ✔️ | -Winfinite-recursion
clang | std vector reserve set read | ❌ | ❌ | n/a
clang | strptime mktime unitialized | ❌ | ❌ | n/a
clang | virtual call in constructor | ✔️ | ✔️ | -Wcall-to-pure-virtual-from-ctor-dtor
clang | virtual call in constructor helper | ❌ | ❌ | n/a
clang | virtual call in constructor lib | ❌ | ❌ | n/a
clang | virtual call in constructor link | ❌ | ❌ | n/a
clang | virtual call in destructor | ✔️ | ✔️ | -Wcall-to-pure-virtual-from-ctor-dtor
clang | virtual call in destructor helper | ❌ | ❌ | n/a
clang | virtual call in destructor lib | ❌ | ❌ | n/a
clang | virtual call in destructor link | ❌ | ❌ | n/a
gcc | access after realloc | ✔️ | ✔️ | -Wuse-after-free
gcc | array out of bounds | ❌ | ✔️ | -Warray-bounds=
gcc | automatic variable over stack | ❌ | ❌ | n/a
gcc | bad alignment | ❌ | ❌ | n/a
gcc | bad identifier name | ❌ | ❌ | n/a
gcc | delete incomplete type | ✔️ | ✔️ | -Wdelete-incomplete
gcc | dereferencing nullptr | ❌ | ❌ | n/a
gcc | divide by zero | ✔️ | ✔️ | -Wdiv-by-zero
gcc | initialize std string with nullptr | ❌ | ❌ | n/a
gcc | large double to int | ❌ | ❌ | n/a
gcc | malloc cast pod struct | ❌ | ❌ | n/a
gcc | mutate const value | ❌ | ❌ | n/a
gcc | non trivial destructor and global | ❌ | ❌ | n/a
gcc | odr violation function | ❌ | ❌ | n/a
gcc | odr violation function lib | ❌ | ❌ | n/a
gcc | odr violation struct ret | ❌ | ❌ | n/a
gcc | odr violation struct ret lib | ❌ | ❌ | n/a
gcc | operator star on empty optional | ❌ | ❌ | n/a
gcc | out of bounds pointer | ❌ | ✔️ | -Warray-bounds=
gcc | preincrement plus postincrement | ✔️ | ✔️ | -Wsequence-point
gcc | preincrement plus value | ✔️ | ✔️ | -Wsequence-point
gcc | read from old type | ❌ | ❌ | n/a
gcc | reading uninitialized value add | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value cout | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value func arg | ❌ | ✔️ | -Wuninitialized
gcc | reading uninitialized value if | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value lib call cref | ✔️ | ✔️ | -Wmaybe-uninitialized
gcc | reading uninitialized value partial | ❌ | ❌ | n/a
gcc | reading uninitialized value printf | ✔️ | ✔️ | -Wuninitialized
gcc | reading uninitialized value return | ✔️ | ✔️ | -Wreturn-type
gcc | reference out of scope | ✔️ | ✔️ | -Wreturn-local-addr
gcc | reinterpret cast bad size | ✔️ | ✔️ | -Wuninitialized,-Warray-bounds=
gcc | reinterpret cast float to int32 | ❌ | ✔️ | -Wstrict-aliasing,-Wuninitialized
gcc | reinterpret cast int32 to float | ❌ | ✔️ | -Wstrict-aliasing,-Wuninitialized
gcc | reinterpret cast int32 to uint32 | ❌ | ❌ | n/a
gcc | reinterpret cast uint32 to int32 | ❌ | ❌ | n/a
gcc | reinterpret cast unaligned bytes to uint32 | ❌ | ❌ | n/a
gcc | shifting more than width | ✔️ | ✔️ | -Wshift-count-overflow
gcc | signed integer overflow | ❌ | ❌ | n/a
gcc | sort comp reflexive | ❌ | ❌ | n/a
gcc | stack overflow | ✔️ | ✔️ | -Winfinite-recursion
gcc | std vector reserve set read | ❌ | ❌ | n/a
gcc | strptime mktime unitialized | ❌ | ❌ | n/a
gcc | virtual call in constructor | ❌ | ❌ | n/a
gcc | virtual call in constructor helper | ❌ | ❌ | n/a
gcc | virtual call in constructor lib | ❌ | ❌ | n/a
gcc | virtual call in constructor link | ❌ | ❌ | n/a
gcc | virtual call in destructor | ❌ | ❌ | n/a
gcc | virtual call in destructor helper | ❌ | ❌ | n/a
gcc | virtual call in destructor lib | ❌ | ❌ | n/a
gcc | virtual call in destructor link | ❌ | ❌ | n/a
msvc | access after realloc | ❌ | ❌ | n/a
msvc | array out of bounds | ❌ | ❌ | n/a
msvc | automatic variable over stack | ❌ | ❌ | n/a
msvc | bad alignment | ❌ | ❌ | n/a
msvc | bad identifier name | ❌ | ❌ | n/a
msvc | delete incomplete type | ✔️ | ✔️ | 4150
msvc | dereferencing nullptr | ❌ | ❌ | n/a
msvc | divide by zero | ✔️ | ✔️ | 4723
msvc | initialize std string with nullptr | ❌ | ❌ | n/a
msvc | large double to int | ❌ | ❌ | n/a
msvc | malloc cast pod struct | ❌ | ❌ | n/a
msvc | mutate const value | ❌ | ❌ | n/a
msvc | non trivial destructor and global | ❌ | ❌ | n/a
msvc | odr violation function | ❌ | ❌ | n/a
msvc | odr violation function lib | ❌ | ❌ | n/a
msvc | odr violation struct ret | ❌ | ❌ | n/a
msvc | odr violation struct ret lib | ❌ | ❌ | n/a
msvc | operator star on empty optional | ❌ | ❌ | n/a
msvc | out of bounds pointer | ❌ | ❌ | n/a
msvc | preincrement plus postincrement | ❌ | ❌ | n/a
msvc | preincrement plus value | ❌ | ❌ | n/a
msvc | read from old type | ❌ | ❌ | n/a
msvc | reading uninitialized value add | ✔️ | ✔️ | 4700
msvc | reading uninitialized value cout | ✔️ | ✔️ | 4700
msvc | reading uninitialized value func arg | ❌ | ❌ | n/a
msvc | reading uninitialized value if | ✔️ | ✔️ | 4700
msvc | reading uninitialized value lib call cref | ❌ | ❌ | n/a
msvc | reading uninitialized value partial | ❌ | ❌ | n/a
msvc | reading uninitialized value printf | ✔️ | ✔️ | 4700
msvc | reference out of scope | ✔️ | ✔️ | 4172
msvc | reinterpret cast bad size | ❌ | ❌ | n/a
msvc | reinterpret cast float to int32 | ❌ | ❌ | n/a
msvc | reinterpret cast int32 to float | ❌ | ❌ | n/a
msvc | reinterpret cast int32 to uint32 | ❌ | ❌ | n/a
msvc | reinterpret cast uint32 to int32 | ❌ | ❌ | n/a
msvc | reinterpret cast unaligned bytes to uint32 | ❌ | ❌ | n/a
msvc | shifting more than width | ✔️ | ✔️ | 4293
msvc | signed integer overflow | ❌ | ❌ | n/a
msvc | sort comp reflexive | ❌ | ❌ | n/a
msvc | stack overflow | ✔️ | ✔️ | 4717
msvc | std vector reserve set read | ❌ | ❌ | n/a
msvc | virtual call in constructor | ❌ | ❌ | n/a
msvc | virtual call in constructor helper | ❌ | ❌ | n/a
msvc | virtual call in constructor lib | ❌ | ❌ | n/a
msvc | virtual call in constructor link | ❌ | ❌ | n/a
msvc | virtual call in destructor | ❌ | ❌ | n/a
msvc | virtual call in destructor helper | ❌ | ❌ | n/a
msvc | virtual call in destructor lib | ❌ | ❌ | n/a
msvc | virtual call in destructor link | ❌ | ❌ | n/a

### 1.2.Static Analyzers
Tool | Undefined Behavior Type | Warning | Name
--- | --- | --- | ---
clang-tidy | access after realloc | ✔️ | clang-analyzer-unix.Malloc
clang-tidy | array out of bounds | ✔️ | cppcoreguidelines-pro-bounds-constant-array-index
clang-tidy | automatic variable over stack | ❌ | n/a
clang-tidy | bad alignment | ❌ | n/a
clang-tidy | bad identifier name | ✔️ | bugprone-reserved-identifier,cert-dcl37-c,cert-dcl51-cpp
clang-tidy | delete incomplete type | ✔️ | clang-diagnostic-delete-incomplete
clang-tidy | dereferencing nullptr | ✔️ | clang-analyzer-core.NullDereference
clang-tidy | divide by zero | ✔️ | clang-analyzer-core.DivideZero,clang-diagnostic-division-by-zero
clang-tidy | initialize std string with nullptr | ❌ | n/a
clang-tidy | large double to int | ❌ | n/a
clang-tidy | malloc cast pod struct | ❌ | n/a
clang-tidy | mutate const value | ✔️ | cppcoreguidelines-pro-type-const-cast
clang-tidy | non trivial destructor and global | ❌ | n/a
clang-tidy | odr violation function | ✔️ | misc-include-cleaner
clang-tidy | odr violation function lib | ❌ | n/a
clang-tidy | odr violation struct ret | ✔️ | misc-include-cleaner
clang-tidy | odr violation struct ret lib | ❌ | n/a
clang-tidy | operator star on empty optional | ✔️ | bugprone-unchecked-optional-access
clang-tidy | out of bounds pointer | ❌ | n/a
clang-tidy | preincrement plus postincrement | ✔️ | clang-diagnostic-unsequenced
clang-tidy | preincrement plus value | ✔️ | clang-diagnostic-unsequenced
clang-tidy | read from old type | ❌ | n/a
clang-tidy | reading uninitialized value add | ✔️ | cppcoreguidelines-init-variables,clang-diagnostic-uninitialized,clang-analyzer-core.UndefinedBinaryOperatorResult
clang-tidy | reading uninitialized value cout | ✔️ | cppcoreguidelines-init-variables,clang-analyzer-core.CallAndMessage,clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value func arg | ✔️ | cppcoreguidelines-init-variables,clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value if | ✔️ | cppcoreguidelines-init-variables,clang-analyzer-core.uninitialized.Branch,clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value lib call cref | ✔️ | cppcoreguidelines-init-variables,clang-diagnostic-uninitialized-const-reference
clang-tidy | reading uninitialized value partial | ✔️ | cppcoreguidelines-init-variables,clang-analyzer-core.CallAndMessage
clang-tidy | reading uninitialized value printf | ✔️ | cppcoreguidelines-init-variables,clang-analyzer-core.CallAndMessage,clang-diagnostic-uninitialized
clang-tidy | reading uninitialized value return | ✔️ | clang-diagnostic-return-type
clang-tidy | reference out of scope | ✔️ | clang-analyzer-core.StackAddressEscape,clang-diagnostic-return-stack-address
clang-tidy | reinterpret cast bad size | ❌ | n/a
clang-tidy | reinterpret cast float to int32 | ❌ | n/a
clang-tidy | reinterpret cast int32 to float | ❌ | n/a
clang-tidy | reinterpret cast int32 to uint32 | ❌ | n/a
clang-tidy | reinterpret cast uint32 to int32 | ❌ | n/a
clang-tidy | reinterpret cast unaligned bytes to uint32 | ❌ | n/a
clang-tidy | shifting more than width | ✔️ | clang-analyzer-core.BitwiseShift,clang-diagnostic-shift-count-overflow,hicpp-signed-bitwise
clang-tidy | signed integer overflow | ❌ | n/a
clang-tidy | sort comp reflexive | ❌ | n/a
clang-tidy | stack overflow | ✔️ | misc-no-recursion,clang-diagnostic-infinite-recursion
clang-tidy | std vector reserve set read | ❌ | n/a
clang-tidy | strptime mktime unitialized | ✔️ | cppcoreguidelines-pro-type-member-init,hicpp-member-init
clang-tidy | virtual call in constructor | ✔️ | clang-analyzer-cplusplus.PureVirtualCall,clang-diagnostic-call-to-pure-virtual-from-ctor-dtor,misc-const-correctness
clang-tidy | virtual call in constructor helper | ✔️ | clang-analyzer-cplusplus.PureVirtualCall,misc-const-correctness
clang-tidy | virtual call in constructor lib | ✔️ | clang-analyzer-cplusplus.PureVirtualCall
clang-tidy | virtual call in constructor link | ❌ | n/a
clang-tidy | virtual call in destructor | ✔️ | clang-analyzer-cplusplus.PureVirtualCall,clang-diagnostic-call-to-pure-virtual-from-ctor-dtor
clang-tidy | virtual call in destructor helper | ✔️ | clang-analyzer-cplusplus.PureVirtualCall
clang-tidy | virtual call in destructor lib | ✔️ | clang-analyzer-cplusplus.PureVirtualCall
clang-tidy | virtual call in destructor link | ❌ | n/a
cppcheck | access after realloc | ❌ | n/a
cppcheck | array out of bounds | ✔️ | containerOutOfBounds,containerOutOfBoundsIndexExpression
cppcheck | automatic variable over stack | ❌ | n/a
cppcheck | bad alignment | ❌ | n/a
cppcheck | bad identifier name | ❌ | n/a
cppcheck | delete incomplete type | ❌ | n/a
cppcheck | dereferencing nullptr | ✔️ | nullPointer
cppcheck | divide by zero | ✔️ | zerodiv
cppcheck | initialize std string with nullptr | ✔️ | nullPointer
cppcheck | large double to int | ❌ | n/a
cppcheck | malloc cast pod struct | ❌ | n/a
cppcheck | mutate const value | ❌ | n/a
cppcheck | non trivial destructor and global | ❌ | n/a
cppcheck | odr violation function | ❌ | n/a
cppcheck | odr violation function lib | ❌ | n/a
cppcheck | odr violation struct ret | ✔️ | ctuOneDefinitionRuleViolation
cppcheck | odr violation struct ret lib | ❌ | n/a
cppcheck | operator star on empty optional | ❌ | n/a
cppcheck | out of bounds pointer | ❌ | n/a
cppcheck | preincrement plus postincrement | ❌ | n/a
cppcheck | preincrement plus value | ❌ | n/a
cppcheck | read from old type | ❌ | n/a
cppcheck | reading uninitialized value add | ✔️ | uninitvar
cppcheck | reading uninitialized value cout | ✔️ | uninitvar
cppcheck | reading uninitialized value func arg | ❌ | n/a
cppcheck | reading uninitialized value if | ✔️ | uninitvar
cppcheck | reading uninitialized value lib call cref | ✔️ | uninitvar
cppcheck | reading uninitialized value partial | ✔️ | uninitvar
cppcheck | reading uninitialized value printf | ✔️ | uninitvar
cppcheck | reading uninitialized value return | ✔️ | missingReturn
cppcheck | reference out of scope | ✔️ | returnReference
cppcheck | reinterpret cast bad size | ❌ | n/a
cppcheck | reinterpret cast float to int32 | ❌ | n/a
cppcheck | reinterpret cast int32 to float | ❌ | n/a
cppcheck | reinterpret cast int32 to uint32 | ❌ | n/a
cppcheck | reinterpret cast uint32 to int32 | ❌ | n/a
cppcheck | reinterpret cast unaligned bytes to uint32 | ❌ | n/a
cppcheck | shifting more than width | ✔️ | shiftTooManyBits
cppcheck | signed integer overflow | ❌ | n/a
cppcheck | sort comp reflexive | ❌ | n/a
cppcheck | stack overflow | ❌ | n/a
cppcheck | std vector reserve set read | ✔️ | containerOutOfBounds
cppcheck | strptime mktime unitialized | ❌ | n/a
cppcheck | virtual call in constructor | ✔️ | ctuOneDefinitionRuleViolation
cppcheck | virtual call in constructor helper | ❌ | n/a
cppcheck | virtual call in constructor lib | ❌ | n/a
cppcheck | virtual call in constructor link | ❌ | n/a
cppcheck | virtual call in destructor | ❌ | n/a
cppcheck | virtual call in destructor helper | ❌ | n/a
cppcheck | virtual call in destructor lib | ❌ | n/a
cppcheck | virtual call in destructor link | ❌ | n/a

### 1.3.Static Analysis Summary
Debug (unoptimized) / RelWithDebInfo (optimized)

Undefined Behavior Type | clang | clang-tidy | cppcheck | gcc | msvc
--- | --- | --- | --- | --- | ---
access after realloc | ❌ | ✔️ | ❌ | ✔️ | ❌
array out of bounds | ❌ | ✔️ | ✔️ | ❌/✔️ | ❌
automatic variable over stack | ❌ | ❌ | ❌ | ❌ | ❌
bad alignment | ❌ | ❌ | ❌ | ❌ | ❌
bad identifier name | ❌ | ✔️ | ❌ | ❌ | ❌
delete incomplete type | ✔️ | ✔️ | ❌ | ✔️ | ✔️
dereferencing nullptr | ❌ | ✔️ | ✔️ | ❌ | ❌
divide by zero | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
initialize std string with nullptr | ❌ | ❌ | ✔️ | ❌ | ❌
large double to int | ❌ | ❌ | ❌ | ❌ | ❌
malloc cast pod struct | ❌ | ❌ | ❌ | ❌ | ❌
mutate const value | ❌ | ✔️ | ❌ | ❌ | ❌
non trivial destructor and global | ❌ | ❌ | ❌ | ❌ | ❌
odr violation function | ❌ | ✔️ | ❌ | ❌ | ❌
odr violation function lib | ❌ | ❌ | ❌ | ❌ | ❌
odr violation struct ret | ❌ | ✔️ | ✔️ | ❌ | ❌
odr violation struct ret lib | ❌ | ❌ | ❌ | ❌ | ❌
operator star on empty optional | ❌ | ✔️ | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌/✔️ | ❌
preincrement plus postincrement | ✔️ | ✔️ | ❌ | ✔️ | ❌
preincrement plus value | ✔️ | ✔️ | ❌ | ✔️ | ❌
read from old type | ❌ | ❌ | ❌ | ❌ | ❌
reading uninitialized value add | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value cout | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value func arg | ❌ | ✔️ | ❌ | ❌/✔️ | ❌
reading uninitialized value if | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value lib call cref | ✔️ | ✔️ | ✔️ | ✔️ | ❌
reading uninitialized value partial | ❌ | ✔️ | ✔️ | ❌ | ❌
reading uninitialized value printf | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value return | ✔️ | ✔️ | ✔️ | ✔️ | n/a
reference out of scope | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reinterpret cast bad size | ❌ | ❌ | ❌ | ✔️ | ❌
reinterpret cast float to int32 | ❌ | ❌ | ❌ | ❌/✔️ | ❌
reinterpret cast int32 to float | ❌ | ❌ | ❌ | ❌/✔️ | ❌
reinterpret cast int32 to uint32 | ❌ | ❌ | ❌ | ❌ | ❌
reinterpret cast uint32 to int32 | ❌ | ❌ | ❌ | ❌ | ❌
reinterpret cast unaligned bytes to uint32 | ❌ | ❌ | ❌ | ❌ | ❌
shifting more than width | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
signed integer overflow | ❌ | ❌ | ❌ | ❌ | ❌
sort comp reflexive | ❌ | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ❌ | ✔️ | ✔️
std vector reserve set read | ❌ | ❌ | ✔️ | ❌ | ❌
strptime mktime unitialized | ❌ | ✔️ | ❌ | ❌ | n/a
virtual call in constructor | ✔️ | ✔️ | ✔️ | ❌ | ❌
virtual call in constructor helper | ❌ | ✔️ | ❌ | ❌ | ❌
virtual call in constructor lib | ❌ | ✔️ | ❌ | ❌ | ❌
virtual call in constructor link | ❌ | ❌ | ❌ | ❌ | ❌
virtual call in destructor | ✔️ | ✔️ | ❌ | ❌ | ❌
virtual call in destructor helper | ❌ | ✔️ | ❌ | ❌ | ❌
virtual call in destructor lib | ❌ | ✔️ | ❌ | ❌ | ❌
virtual call in destructor link | ❌ | ❌ | ❌ | ❌ | ❌


## 2.Runtime Crashes
### 2.1.Runtime Crashes Return Codes
Compiler | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | ---
clang | access after realloc | 0 | 0
clang | array out of bounds | 0 | 0
clang | automatic variable over stack | 139 | 0
clang | bad alignment | 0 | 0
clang | bad identifier name | 0 | 0
clang | delete incomplete type | 0 | 0
clang | dereferencing nullptr | 139 | 0
clang | divide by zero | 0 | 0
clang | initialize std string with nullptr | 134 | 134
clang | large double to int | 0 | 0
clang | malloc cast pod struct | 0 | 0
clang | mutate const value | 0 | 0
clang | odr violation function | 0 | 0
clang | odr violation struct ret | 0 | 0
clang | operator star on empty optional | 0 | 0
clang | out of bounds pointer | 0 | 0
clang | preincrement plus postincrement | 0 | 0
clang | preincrement plus value | 0 | 0
clang | read from old type | 0 | 0
clang | reading uninitialized value add | 0 | 0
clang | reading uninitialized value cout | 0 | 0
clang | reading uninitialized value func arg | 0 | 139
clang | reading uninitialized value if | 0 | 48
clang | reading uninitialized value lib call cref | 0 | 0
clang | reading uninitialized value partial | 0 | 0
clang | reading uninitialized value printf | 0 | 0
clang | reading uninitialized value return | 132 | 48
clang | reference out of scope | 0 | 0
clang | reinterpret cast bad size | 0 | 0
clang | reinterpret cast float to int32 | 0 | 0
clang | reinterpret cast int32 to float | 0 | 0
clang | reinterpret cast int32 to uint32 | 0 | 0
clang | reinterpret cast uint32 to int32 | 0 | 0
clang | reinterpret cast unaligned bytes to uint32 | 0 | 0
clang | shifting more than width | 0 | 0
clang | signed integer overflow | 0 | 0
clang | sort comp reflexive | 0 | 0
clang | stack overflow | 139 | 48
clang | std vector reserve set read | 0 | 0
clang | strptime mktime unitialized | 0 | 0
clang | virtual call in constructor | 134 | 134
clang | virtual call in constructor helper | 134 | 134
clang | virtual call in constructor link | 134 | 134
clang | virtual call in destructor | 134 | 134
clang | virtual call in destructor helper | 134 | 134
clang | virtual call in destructor link | 134 | 134
gcc | access after realloc | 0 | 0
gcc | array out of bounds | 0 | 0
gcc | automatic variable over stack | 139 | 0
gcc | bad alignment | 0 | 0
gcc | bad identifier name | 0 | 0
gcc | delete incomplete type | 0 | 0
gcc | dereferencing nullptr | 139 | 139
gcc | divide by zero | 136 | 132
gcc | initialize std string with nullptr | 134 | 134
gcc | large double to int | 0 | 0
gcc | malloc cast pod struct | 0 | 0
gcc | mutate const value | 0 | 0
gcc | odr violation function | 0 | 0
gcc | odr violation struct ret | 0 | 0
gcc | operator star on empty optional | 0 | 0
gcc | out of bounds pointer | 0 | 0
gcc | preincrement plus postincrement | 0 | 0
gcc | preincrement plus value | 0 | 0
gcc | read from old type | 0 | 0
gcc | reading uninitialized value add | 0 | 0
gcc | reading uninitialized value cout | 0 | 0
gcc | reading uninitialized value func arg | 0 | 139
gcc | reading uninitialized value if | 0 | 0
gcc | reading uninitialized value lib call cref | 0 | 0
gcc | reading uninitialized value partial | 0 | 0
gcc | reading uninitialized value printf | 0 | 0
gcc | reading uninitialized value return | 132 | 139
gcc | reference out of scope | 139 | 139
gcc | reinterpret cast bad size | 0 | 0
gcc | reinterpret cast float to int32 | 0 | 0
gcc | reinterpret cast int32 to float | 0 | 0
gcc | reinterpret cast int32 to uint32 | 0 | 0
gcc | reinterpret cast uint32 to int32 | 0 | 0
gcc | reinterpret cast unaligned bytes to uint32 | 0 | 0
gcc | shifting more than width | 0 | 0
gcc | signed integer overflow | 0 | 0
gcc | sort comp reflexive | 0 | 0
gcc | stack overflow | 139 | 124
gcc | std vector reserve set read | 0 | 0
gcc | strptime mktime unitialized | 0 | 0
gcc | virtual call in constructor helper | 134 | 134
gcc | virtual call in constructor link | 134 | 134
gcc | virtual call in destructor helper | 134 | 134
gcc | virtual call in destructor link | 134 | 134
msvc | access after realloc | 0 | 0
msvc | array out of bounds | -1 | 0
msvc | automatic variable over stack | -1073741571 | 0
msvc | bad alignment | 0 | 0
msvc | bad identifier name | 0 | 0
msvc | delete incomplete type | 0 | 0
msvc | dereferencing nullptr | -1073741819 | -1073741819
msvc | divide by zero | -1073741676 | -1073741676
msvc | initialize std string with nullptr | -1073741819 | -1073741819
msvc | large double to int | 0 | 0
msvc | malloc cast pod struct | 0 | 0
msvc | mutate const value | 0 | 0
msvc | odr violation function | 0 | 0
msvc | odr violation struct ret | 0 | 0
msvc | operator star on empty optional | -1 | 0
msvc | out of bounds pointer | 0 | 0
msvc | preincrement plus postincrement | 0 | 0
msvc | preincrement plus value | 0 | 0
msvc | read from old type | 0 | 0
msvc | reading uninitialized value add | -1 | 0
msvc | reading uninitialized value cout | -1 | 0
msvc | reading uninitialized value func arg | -1073741819 | -1073740791
msvc | reading uninitialized value if | -1 | 0
msvc | reading uninitialized value lib call cref | 0 | 0
msvc | reading uninitialized value partial | -1 | -1073740791
msvc | reading uninitialized value printf | -1 | 0
msvc | reference out of scope | 0 | 0
msvc | reinterpret cast bad size | 0 | 0
msvc | reinterpret cast float to int32 | 0 | 0
msvc | reinterpret cast int32 to float | 0 | 0
msvc | reinterpret cast int32 to uint32 | 0 | 0
msvc | reinterpret cast uint32 to int32 | 0 | 0
msvc | reinterpret cast unaligned bytes to uint32 | 0 | 0
msvc | shifting more than width | 0 | 0
msvc | signed integer overflow | 0 | 0
msvc | sort comp reflexive | 0 | 0
msvc | stack overflow | -1073741571 | -1073741571
msvc | std vector reserve set read | -1 | 0
msvc | virtual call in constructor helper | -1 | -1073740791
msvc | virtual call in constructor link | -1 | -1073740791
msvc | virtual call in destructor helper | -1 | -1073740791
msvc | virtual call in destructor link | -1 | -1073740791

### 2.2.Runtime Crashes Summary
Debug (unoptimized) / RelWithDebInfo (optimized)

Undefined Behavior | clang | gcc | msvc
--- | --- | --- | ---
access after realloc | ❌ | ❌ | ❌
array out of bounds | ❌ | ❌ | ✔️/❌
automatic variable over stack | ✔️/❌ | ✔️/❌ | ✔️/❌
bad alignment | ❌ | ❌ | ❌
bad identifier name | ❌ | ❌ | ❌
delete incomplete type | ❌ | ❌ | ❌
dereferencing nullptr | ✔️/❌ | ✔️ | ✔️
divide by zero | ❌ | ✔️ | ✔️
initialize std string with nullptr | ✔️ | ✔️ | ✔️
large double to int | ❌ | ❌ | ❌
malloc cast pod struct | ❌ | ❌ | ❌
mutate const value | ❌ | ❌ | ❌
odr violation function | ❌ | ❌ | ❌
odr violation struct ret | ❌ | ❌ | ❌
operator star on empty optional | ❌ | ❌ | ✔️/❌
out of bounds pointer | ❌ | ❌ | ❌
preincrement plus postincrement | ❌ | ❌ | ❌
preincrement plus value | ❌ | ❌ | ❌
read from old type | ❌ | ❌ | ❌
reading uninitialized value add | ❌ | ❌ | ✔️/❌
reading uninitialized value cout | ❌ | ❌ | ✔️/❌
reading uninitialized value func arg | ❌/✔️ | ❌/✔️ | ✔️
reading uninitialized value if | ❌/✔️ | ❌ | ✔️/❌
reading uninitialized value lib call cref | ❌ | ❌ | ❌
reading uninitialized value partial | ❌ | ❌ | ✔️
reading uninitialized value printf | ❌ | ❌ | ✔️/❌
reading uninitialized value return | ✔️ | ✔️ | n/a
reference out of scope | ❌ | ✔️ | ❌
reinterpret cast bad size | ❌ | ❌ | ❌
reinterpret cast float to int32 | ❌ | ❌ | ❌
reinterpret cast int32 to float | ❌ | ❌ | ❌
reinterpret cast int32 to uint32 | ❌ | ❌ | ❌
reinterpret cast uint32 to int32 | ❌ | ❌ | ❌
reinterpret cast unaligned bytes to uint32 | ❌ | ❌ | ❌
shifting more than width | ❌ | ❌ | ❌
signed integer overflow | ❌ | ❌ | ❌
sort comp reflexive | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ✔️
std vector reserve set read | ❌ | ❌ | ✔️/❌
strptime mktime unitialized | ❌ | ❌ | n/a
virtual call in constructor | ✔️ | n/a | n/a
virtual call in constructor helper | ✔️ | ✔️ | ✔️
virtual call in constructor link | ✔️ | ✔️ | ✔️
virtual call in destructor | ✔️ | n/a | n/a
virtual call in destructor helper | ✔️ | ✔️ | ✔️
virtual call in destructor link | ✔️ | ✔️ | ✔️


## 3.Extra Dynamic Analysis
### 3.1.Extra Dynamic Analysis Return Codes
Compiler | Tool | Undefined Behavior Type | Debug | RelWithDebInfo
--- | --- | --- | --- | ---
clang | address | access after realloc | 1 | 1
clang | address | array out of bounds | 1 | 0
clang | address | automatic variable over stack | 1 | 0
clang | address | bad alignment | 0 | 0
clang | address | bad identifier name | 0 | 0
clang | address | delete incomplete type | 0 | 0
clang | address | dereferencing nullptr | 1 | 0
clang | address | divide by zero | 0 | 0
clang | address | initialize std string with nullptr | 134 | 134
clang | address | large double to int | 0 | 0
clang | address | malloc cast pod struct | 0 | 0
clang | address | mutate const value | 0 | 0
clang | address | odr violation function | 0 | 0
clang | address | odr violation struct ret | 0 | 0
clang | address | operator star on empty optional | 0 | 0
clang | address | out of bounds pointer | 0 | 0
clang | address | preincrement plus postincrement | 0 | 0
clang | address | preincrement plus value | 0 | 0
clang | address | read from old type | 0 | 0
clang | address | reading uninitialized value add | 0 | 0
clang | address | reading uninitialized value cout | 0 | 0
clang | address | reading uninitialized value func arg | 1 | 1
clang | address | reading uninitialized value if | 0 | 48
clang | address | reading uninitialized value lib call cref | 0 | 0
clang | address | reading uninitialized value partial | 0 | 0
clang | address | reading uninitialized value printf | 0 | 0
clang | address | reading uninitialized value return | 132 | 48
clang | address | reference out of scope | 1 | 0
clang | address | reinterpret cast bad size | 1 | 0
clang | address | reinterpret cast float to int32 | 0 | 0
clang | address | reinterpret cast int32 to float | 0 | 0
clang | address | reinterpret cast int32 to uint32 | 0 | 0
clang | address | reinterpret cast uint32 to int32 | 0 | 0
clang | address | reinterpret cast unaligned bytes to uint32 | 0 | 0
clang | address | shifting more than width | 0 | 0
clang | address | signed integer overflow | 0 | 0
clang | address | sort comp reflexive | 0 | 0
clang | address | stack overflow | 1 | 48
clang | address | std vector reserve set read | 0 | 0
clang | address | strptime mktime unitialized | 0 | 0
clang | address | virtual call in constructor | 134 | 134
clang | address | virtual call in constructor helper | 134 | 134
clang | address | virtual call in constructor link | 134 | 134
clang | address | virtual call in destructor | 134 | 134
clang | address | virtual call in destructor helper | 134 | 134
clang | address | virtual call in destructor link | 134 | 134
clang | address,undefined | access after realloc | 1 | 1
clang | address,undefined | array out of bounds | 1 | 1
clang | address,undefined | automatic variable over stack | 1 | 1
clang | address,undefined | bad alignment | 1 | 1
clang | address,undefined | bad identifier name | 0 | 0
clang | address,undefined | delete incomplete type | 0 | 0
clang | address,undefined | dereferencing nullptr | 1 | 1
clang | address,undefined | divide by zero | 1 | 1
clang | address,undefined | initialize std string with nullptr | 134 | 134
clang | address,undefined | large double to int | 1 | 1
clang | address,undefined | malloc cast pod struct | 0 | 0
clang | address,undefined | mutate const value | 0 | 0
clang | address,undefined | odr violation function | 0 | 0
clang | address,undefined | odr violation struct ret | 0 | 0
clang | address,undefined | operator star on empty optional | 0 | 0
clang | address,undefined | out of bounds pointer | 0 | 0
clang | address,undefined | preincrement plus postincrement | 0 | 0
clang | address,undefined | preincrement plus value | 0 | 0
clang | address,undefined | read from old type | 1 | 1
clang | address,undefined | reading uninitialized value add | 0 | 0
clang | address,undefined | reading uninitialized value cout | 0 | 0
clang | address,undefined | reading uninitialized value func arg | 1 | 1
clang | address,undefined | reading uninitialized value if | 1 | 56
clang | address,undefined | reading uninitialized value lib call cref | 0 | 0
clang | address,undefined | reading uninitialized value partial | 0 | 0
clang | address,undefined | reading uninitialized value printf | 0 | 0
clang | address,undefined | reading uninitialized value return | 1 | 1
clang | address,undefined | reference out of scope | 1 | 0
clang | address,undefined | reinterpret cast bad size | 1 | 1
clang | address,undefined | reinterpret cast float to int32 | 0 | 0
clang | address,undefined | reinterpret cast int32 to float | 0 | 0
clang | address,undefined | reinterpret cast int32 to uint32 | 0 | 0
clang | address,undefined | reinterpret cast uint32 to int32 | 0 | 0
clang | address,undefined | reinterpret cast unaligned bytes to uint32 | 0 | 0
clang | address,undefined | shifting more than width | 1 | 1
clang | address,undefined | signed integer overflow | 1 | 1
clang | address,undefined | sort comp reflexive | 0 | 0
clang | address,undefined | stack overflow | 1 | 1
clang | address,undefined | std vector reserve set read | 0 | 0
clang | address,undefined | strptime mktime unitialized | 0 | 0
clang | address,undefined | virtual call in constructor | 134 | 134
clang | address,undefined | virtual call in constructor helper | 134 | 134
clang | address,undefined | virtual call in constructor link | 134 | 134
clang | address,undefined | virtual call in destructor | 134 | 134
clang | address,undefined | virtual call in destructor helper | 134 | 134
clang | address,undefined | virtual call in destructor link | 134 | 134
clang | undefined | access after realloc | 0 | 0
clang | undefined | array out of bounds | 0 | 1
clang | undefined | automatic variable over stack | 1 | 1
clang | undefined | bad alignment | 0 | 1
clang | undefined | bad identifier name | 0 | 0
clang | undefined | delete incomplete type | 0 | 0
clang | undefined | dereferencing nullptr | 1 | 1
clang | undefined | divide by zero | 1 | 1
clang | undefined | initialize std string with nullptr | 134 | 134
clang | undefined | large double to int | 1 | 1
clang | undefined | malloc cast pod struct | 0 | 0
clang | undefined | mutate const value | 0 | 0
clang | undefined | odr violation function | 0 | 0
clang | undefined | odr violation struct ret | 0 | 0
clang | undefined | operator star on empty optional | 0 | 0
clang | undefined | out of bounds pointer | 0 | 0
clang | undefined | preincrement plus postincrement | 0 | 0
clang | undefined | preincrement plus value | 0 | 0
clang | undefined | read from old type | 1 | 1
clang | undefined | reading uninitialized value add | 0 | 0
clang | undefined | reading uninitialized value cout | 0 | 0
clang | undefined | reading uninitialized value func arg | 0 | 1
clang | undefined | reading uninitialized value if | 1 | 1
clang | undefined | reading uninitialized value lib call cref | 0 | 0
clang | undefined | reading uninitialized value partial | 0 | 0
clang | undefined | reading uninitialized value printf | 0 | 0
clang | undefined | reading uninitialized value return | 1 | 1
clang | undefined | reference out of scope | 0 | 0
clang | undefined | reinterpret cast bad size | 0 | 1
clang | undefined | reinterpret cast float to int32 | 0 | 0
clang | undefined | reinterpret cast int32 to float | 0 | 0
clang | undefined | reinterpret cast int32 to uint32 | 0 | 0
clang | undefined | reinterpret cast uint32 to int32 | 0 | 0
clang | undefined | reinterpret cast unaligned bytes to uint32 | 0 | 0
clang | undefined | shifting more than width | 1 | 1
clang | undefined | signed integer overflow | 1 | 1
clang | undefined | sort comp reflexive | 0 | 0
clang | undefined | stack overflow | 1 | 1
clang | undefined | std vector reserve set read | 0 | 0
clang | undefined | strptime mktime unitialized | 0 | 0
clang | undefined | virtual call in constructor | 134 | 134
clang | undefined | virtual call in constructor helper | 134 | 134
clang | undefined | virtual call in constructor link | 134 | 134
clang | undefined | virtual call in destructor | 134 | 134
clang | undefined | virtual call in destructor helper | 134 | 134
clang | undefined | virtual call in destructor link | 134 | 134
gcc | address | access after realloc | 1 | 1
gcc | address | array out of bounds | 1 | 1
gcc | address | automatic variable over stack | 1 | 1
gcc | address | bad alignment | 0 | 0
gcc | address | bad identifier name | 0 | 0
gcc | address | delete incomplete type | 0 | 0
gcc | address | dereferencing nullptr | 1 | 1
gcc | address | divide by zero | 1 | 132
gcc | address | initialize std string with nullptr | 134 | 134
gcc | address | large double to int | 0 | 0
gcc | address | malloc cast pod struct | 0 | 0
gcc | address | mutate const value | 0 | 0
gcc | address | odr violation function | 0 | 0
gcc | address | odr violation struct ret | 0 | 0
gcc | address | operator star on empty optional | 0 | 0
gcc | address | out of bounds pointer | 0 | 0
gcc | address | preincrement plus postincrement | 0 | 0
gcc | address | preincrement plus value | 0 | 0
gcc | address | read from old type | 0 | 0
gcc | address | reading uninitialized value add | 0 | 0
gcc | address | reading uninitialized value cout | 0 | 0
gcc | address | reading uninitialized value func arg | 1 | 1
gcc | address | reading uninitialized value if | 0 | 0
gcc | address | reading uninitialized value lib call cref | 0 | 0
gcc | address | reading uninitialized value partial | 0 | 0
gcc | address | reading uninitialized value printf | 0 | 0
gcc | address | reading uninitialized value return | 132 | 132
gcc | address | reference out of scope | 1 | 1
gcc | address | reinterpret cast bad size | 1 | 1
gcc | address | reinterpret cast float to int32 | 0 | 0
gcc | address | reinterpret cast int32 to float | 0 | 0
gcc | address | reinterpret cast int32 to uint32 | 0 | 0
gcc | address | reinterpret cast uint32 to int32 | 0 | 0
gcc | address | reinterpret cast unaligned bytes to uint32 | 0 | 0
gcc | address | shifting more than width | 0 | 0
gcc | address | signed integer overflow | 0 | 0
gcc | address | sort comp reflexive | 0 | 0
gcc | address | stack overflow | 1 | 124
gcc | address | std vector reserve set read | 0 | 0
gcc | address | strptime mktime unitialized | 0 | 0
gcc | address | virtual call in constructor helper | 134 | 134
gcc | address | virtual call in constructor link | 134 | 134
gcc | address | virtual call in destructor helper | 134 | 134
gcc | address | virtual call in destructor link | 134 | 134
gcc | address,leak,undefined | access after realloc | 1 | 1
gcc | address,leak,undefined | array out of bounds | 1 | 1
gcc | address,leak,undefined | automatic variable over stack | 1 | 1
gcc | address,leak,undefined | bad alignment | 1 | 1
gcc | address,leak,undefined | bad identifier name | 0 | 0
gcc | address,leak,undefined | delete incomplete type | 0 | 0
gcc | address,leak,undefined | dereferencing nullptr | 1 | 1
gcc | address,leak,undefined | divide by zero | 1 | 1
gcc | address,leak,undefined | initialize std string with nullptr | 134 | 134
gcc | address,leak,undefined | large double to int | 0 | 0
gcc | address,leak,undefined | malloc cast pod struct | 0 | 0
gcc | address,leak,undefined | mutate const value | 0 | 0
gcc | address,leak,undefined | odr violation function | 0 | 0
gcc | address,leak,undefined | odr violation struct ret | 0 | 0
gcc | address,leak,undefined | operator star on empty optional | 0 | 0
gcc | address,leak,undefined | out of bounds pointer | 0 | 0
gcc | address,leak,undefined | preincrement plus postincrement | 0 | 0
gcc | address,leak,undefined | preincrement plus value | 0 | 0
gcc | address,leak,undefined | read from old type | 1 | 1
gcc | address,leak,undefined | reading uninitialized value add | 0 | 0
gcc | address,leak,undefined | reading uninitialized value cout | 0 | 0
gcc | address,leak,undefined | reading uninitialized value func arg | 1 | 1
gcc | address,leak,undefined | reading uninitialized value if | 0 | 0
gcc | address,leak,undefined | reading uninitialized value lib call cref | 0 | 0
gcc | address,leak,undefined | reading uninitialized value partial | 0 | 0
gcc | address,leak,undefined | reading uninitialized value printf | 0 | 0
gcc | address,leak,undefined | reading uninitialized value return | 1 | 1
gcc | address,leak,undefined | reference out of scope | 1 | 1
gcc | address,leak,undefined | reinterpret cast bad size | 1 | 1
gcc | address,leak,undefined | reinterpret cast float to int32 | 0 | 0
gcc | address,leak,undefined | reinterpret cast int32 to float | 0 | 0
gcc | address,leak,undefined | reinterpret cast int32 to uint32 | 0 | 0
gcc | address,leak,undefined | reinterpret cast uint32 to int32 | 0 | 0
gcc | address,leak,undefined | reinterpret cast unaligned bytes to uint32 | 0 | 0
gcc | address,leak,undefined | shifting more than width | 1 | 1
gcc | address,leak,undefined | signed integer overflow | 1 | 1
gcc | address,leak,undefined | sort comp reflexive | 0 | 0
gcc | address,leak,undefined | stack overflow | 1 | 124
gcc | address,leak,undefined | std vector reserve set read | 0 | 0
gcc | address,leak,undefined | strptime mktime unitialized | 0 | 0
gcc | address,leak,undefined | virtual call in constructor helper | 134 | 134
gcc | address,leak,undefined | virtual call in constructor link | 134 | 134
gcc | address,leak,undefined | virtual call in destructor helper | 134 | 134
gcc | address,leak,undefined | virtual call in destructor link | 134 | 134
gcc | leak | access after realloc | 0 | 0
gcc | leak | array out of bounds | 0 | 0
gcc | leak | automatic variable over stack | 23 | 0
gcc | leak | bad alignment | 0 | 0
gcc | leak | bad identifier name | 0 | 0
gcc | leak | delete incomplete type | 0 | 0
gcc | leak | dereferencing nullptr | 23 | 23
gcc | leak | divide by zero | 23 | 132
gcc | leak | initialize std string with nullptr | 134 | 134
gcc | leak | large double to int | 0 | 0
gcc | leak | malloc cast pod struct | 0 | 0
gcc | leak | mutate const value | 0 | 0
gcc | leak | odr violation function | 0 | 0
gcc | leak | odr violation struct ret | 0 | 0
gcc | leak | operator star on empty optional | 0 | 0
gcc | leak | out of bounds pointer | 0 | 0
gcc | leak | preincrement plus postincrement | 0 | 0
gcc | leak | preincrement plus value | 0 | 0
gcc | leak | read from old type | 0 | 0
gcc | leak | reading uninitialized value add | 0 | 0
gcc | leak | reading uninitialized value cout | 0 | 0
gcc | leak | reading uninitialized value func arg | 0 | 23
gcc | leak | reading uninitialized value if | 0 | 0
gcc | leak | reading uninitialized value lib call cref | 0 | 0
gcc | leak | reading uninitialized value partial | 0 | 0
gcc | leak | reading uninitialized value printf | 0 | 0
gcc | leak | reading uninitialized value return | 132 | 23
gcc | leak | reference out of scope | 23 | 23
gcc | leak | reinterpret cast bad size | 0 | 0
gcc | leak | reinterpret cast float to int32 | 0 | 0
gcc | leak | reinterpret cast int32 to float | 0 | 0
gcc | leak | reinterpret cast int32 to uint32 | 0 | 0
gcc | leak | reinterpret cast uint32 to int32 | 0 | 0
gcc | leak | reinterpret cast unaligned bytes to uint32 | 0 | 0
gcc | leak | shifting more than width | 0 | 0
gcc | leak | signed integer overflow | 0 | 0
gcc | leak | sort comp reflexive | 0 | 0
gcc | leak | stack overflow | 23 | 124
gcc | leak | std vector reserve set read | 0 | 0
gcc | leak | strptime mktime unitialized | 0 | 0
gcc | leak | virtual call in constructor helper | 134 | 134
gcc | leak | virtual call in constructor link | 134 | 134
gcc | leak | virtual call in destructor helper | 134 | 134
gcc | leak | virtual call in destructor link | 134 | 134
gcc | undefined | access after realloc | 0 | 0
gcc | undefined | array out of bounds | 0 | 1
gcc | undefined | automatic variable over stack | 139 | 139
gcc | undefined | bad alignment | 0 | 0
gcc | undefined | bad identifier name | 0 | 0
gcc | undefined | delete incomplete type | 0 | 0
gcc | undefined | dereferencing nullptr | 1 | 1
gcc | undefined | divide by zero | 1 | 1
gcc | undefined | initialize std string with nullptr | 134 | 134
gcc | undefined | large double to int | 0 | 0
gcc | undefined | malloc cast pod struct | 0 | 0
gcc | undefined | mutate const value | 0 | 0
gcc | undefined | odr violation function | 0 | 0
gcc | undefined | odr violation struct ret | 0 | 0
gcc | undefined | operator star on empty optional | 0 | 0
gcc | undefined | out of bounds pointer | 0 | 0
gcc | undefined | preincrement plus postincrement | 0 | 0
gcc | undefined | preincrement plus value | 0 | 0
gcc | undefined | read from old type | 1 | 1
gcc | undefined | reading uninitialized value add | 0 | 0
gcc | undefined | reading uninitialized value cout | 0 | 0
gcc | undefined | reading uninitialized value func arg | 0 | 1
gcc | undefined | reading uninitialized value if | 0 | 0
gcc | undefined | reading uninitialized value lib call cref | 0 | 0
gcc | undefined | reading uninitialized value partial | 0 | 0
gcc | undefined | reading uninitialized value printf | 0 | 0
gcc | undefined | reading uninitialized value return | 1 | 1
gcc | undefined | reference out of scope | 1 | 1
gcc | undefined | reinterpret cast bad size | 1 | 1
gcc | undefined | reinterpret cast float to int32 | 0 | 0
gcc | undefined | reinterpret cast int32 to float | 0 | 0
gcc | undefined | reinterpret cast int32 to uint32 | 0 | 0
gcc | undefined | reinterpret cast uint32 to int32 | 0 | 0
gcc | undefined | reinterpret cast unaligned bytes to uint32 | 0 | 0
gcc | undefined | shifting more than width | 1 | 1
gcc | undefined | signed integer overflow | 1 | 1
gcc | undefined | sort comp reflexive | 0 | 0
gcc | undefined | stack overflow | 139 | 124
gcc | undefined | std vector reserve set read | 0 | 0
gcc | undefined | strptime mktime unitialized | 0 | 0
gcc | undefined | virtual call in constructor helper | 134 | 134
gcc | undefined | virtual call in constructor link | 134 | 134
gcc | undefined | virtual call in destructor helper | 134 | 134
gcc | undefined | virtual call in destructor link | 134 | 134
gcc | valgrind | access after realloc | 1 | 1
gcc | valgrind | array out of bounds | 0 | 0
gcc | valgrind | automatic variable over stack | 139 | 0
gcc | valgrind | bad alignment | 0 | 0
gcc | valgrind | bad identifier name | 0 | 0
gcc | valgrind | delete incomplete type | 0 | 0
gcc | valgrind | dereferencing nullptr | 139 | 139
gcc | valgrind | divide by zero | 136 | 132
gcc | valgrind | initialize std string with nullptr | 134 | 134
gcc | valgrind | large double to int | 0 | 0
gcc | valgrind | malloc cast pod struct | 0 | 0
gcc | valgrind | mutate const value | 0 | 0
gcc | valgrind | odr violation function | 0 | 0
gcc | valgrind | odr violation struct ret | 0 | 0
gcc | valgrind | operator star on empty optional | 0 | 0
gcc | valgrind | out of bounds pointer | 0 | 0
gcc | valgrind | preincrement plus postincrement | 0 | 0
gcc | valgrind | preincrement plus value | 0 | 0
gcc | valgrind | read from old type | 0 | 0
gcc | valgrind | reading uninitialized value add | 1 | 0
gcc | valgrind | reading uninitialized value cout | 1 | 0
gcc | valgrind | reading uninitialized value func arg | 1 | 139
gcc | valgrind | reading uninitialized value if | 1 | 0
gcc | valgrind | reading uninitialized value lib call cref | 1 | 1
gcc | valgrind | reading uninitialized value partial | 1 | 0
gcc | valgrind | reading uninitialized value printf | 1 | 0
gcc | valgrind | reading uninitialized value return | 132 | 139
gcc | valgrind | reference out of scope | 139 | 139
gcc | valgrind | reinterpret cast bad size | 0 | 1
gcc | valgrind | reinterpret cast float to int32 | 0 | 0
gcc | valgrind | reinterpret cast int32 to float | 0 | 0
gcc | valgrind | reinterpret cast int32 to uint32 | 0 | 0
gcc | valgrind | reinterpret cast uint32 to int32 | 0 | 0
gcc | valgrind | reinterpret cast unaligned bytes to uint32 | 0 | 0
gcc | valgrind | shifting more than width | 0 | 0
gcc | valgrind | signed integer overflow | 0 | 0
gcc | valgrind | sort comp reflexive | 0 | 0
gcc | valgrind | stack overflow | 139 | 124
gcc | valgrind | std vector reserve set read | 0 | 0
gcc | valgrind | strptime mktime unitialized | 1 | 1
gcc | valgrind | virtual call in constructor helper | 134 | 134
gcc | valgrind | virtual call in constructor link | 134 | 134
gcc | valgrind | virtual call in destructor helper | 134 | 134
gcc | valgrind | virtual call in destructor link | 134 | 134

### 3.2.1.Extra Dynamic Analysis Summary Clang
Debug (unoptimized) / RelWithDebInfo (optimized)

Undefined Behavior Type | address | address,undefined | undefined
--- |--- |--- | ---
access after realloc | ✔️ | ✔️ | ❌
array out of bounds | ✔️/❌ | ✔️ | ❌/✔️
automatic variable over stack | ✔️/❌ | ✔️ | ✔️
bad alignment | ❌ | ✔️ | ❌/✔️
bad identifier name | ❌ | ❌ | ❌
delete incomplete type | ❌ | ❌ | ❌
dereferencing nullptr | ✔️/❌ | ✔️ | ✔️
divide by zero | ❌ | ✔️ | ✔️
initialize std string with nullptr | ✔️ | ✔️ | ✔️
large double to int | ❌ | ✔️ | ✔️
malloc cast pod struct | ❌ | ❌ | ❌
mutate const value | ❌ | ❌ | ❌
odr violation function | ❌ | ❌ | ❌
odr violation struct ret | ❌ | ❌ | ❌
operator star on empty optional | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌
preincrement plus postincrement | ❌ | ❌ | ❌
preincrement plus value | ❌ | ❌ | ❌
read from old type | ❌ | ✔️ | ✔️
reading uninitialized value add | ❌ | ❌ | ❌
reading uninitialized value cout | ❌ | ❌ | ❌
reading uninitialized value func arg | ✔️ | ✔️ | ❌/✔️
reading uninitialized value if | ❌/✔️ | ✔️ | ✔️
reading uninitialized value lib call cref | ❌ | ❌ | ❌
reading uninitialized value partial | ❌ | ❌ | ❌
reading uninitialized value printf | ❌ | ❌ | ❌
reading uninitialized value return | ✔️ | ✔️ | ✔️
reference out of scope | ✔️/❌ | ✔️/❌ | ❌
reinterpret cast bad size | ✔️/❌ | ✔️ | ❌/✔️
reinterpret cast float to int32 | ❌ | ❌ | ❌
reinterpret cast int32 to float | ❌ | ❌ | ❌
reinterpret cast int32 to uint32 | ❌ | ❌ | ❌
reinterpret cast uint32 to int32 | ❌ | ❌ | ❌
reinterpret cast unaligned bytes to uint32 | ❌ | ❌ | ❌
shifting more than width | ❌ | ✔️ | ✔️
signed integer overflow | ❌ | ✔️ | ✔️
sort comp reflexive | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ✔️
std vector reserve set read | ❌ | ❌ | ❌
strptime mktime unitialized | ❌ | ❌ | ❌
virtual call in constructor | ✔️ | ✔️ | ✔️
virtual call in constructor helper | ✔️ | ✔️ | ✔️
virtual call in constructor link | ✔️ | ✔️ | ✔️
virtual call in destructor | ✔️ | ✔️ | ✔️
virtual call in destructor helper | ✔️ | ✔️ | ✔️
virtual call in destructor link | ✔️ | ✔️ | ✔️

### 3.2.2.Extra Dynamic Analysis Summary Gcc
Debug (unoptimized) / RelWithDebInfo (optimized)

Undefined Behavior Type | address | address,leak,undefined | leak | undefined | valgrind
--- |--- |--- |--- |--- | ---
access after realloc | ✔️ | ✔️ | ❌ | ❌ | ✔️
array out of bounds | ✔️ | ✔️ | ❌ | ❌/✔️ | ❌
automatic variable over stack | ✔️ | ✔️ | ✔️/❌ | ✔️ | ✔️/❌
bad alignment | ❌ | ✔️ | ❌ | ❌ | ❌
bad identifier name | ❌ | ❌ | ❌ | ❌ | ❌
delete incomplete type | ❌ | ❌ | ❌ | ❌ | ❌
dereferencing nullptr | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
divide by zero | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
initialize std string with nullptr | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
large double to int | ❌ | ❌ | ❌ | ❌ | ❌
malloc cast pod struct | ❌ | ❌ | ❌ | ❌ | ❌
mutate const value | ❌ | ❌ | ❌ | ❌ | ❌
odr violation function | ❌ | ❌ | ❌ | ❌ | ❌
odr violation struct ret | ❌ | ❌ | ❌ | ❌ | ❌
operator star on empty optional | ❌ | ❌ | ❌ | ❌ | ❌
out of bounds pointer | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus postincrement | ❌ | ❌ | ❌ | ❌ | ❌
preincrement plus value | ❌ | ❌ | ❌ | ❌ | ❌
read from old type | ❌ | ✔️ | ❌ | ✔️ | ❌
reading uninitialized value add | ❌ | ❌ | ❌ | ❌ | ✔️/❌
reading uninitialized value cout | ❌ | ❌ | ❌ | ❌ | ✔️/❌
reading uninitialized value func arg | ✔️ | ✔️ | ❌/✔️ | ❌/✔️ | ✔️
reading uninitialized value if | ❌ | ❌ | ❌ | ❌ | ✔️/❌
reading uninitialized value lib call cref | ❌ | ❌ | ❌ | ❌ | ✔️
reading uninitialized value partial | ❌ | ❌ | ❌ | ❌ | ✔️/❌
reading uninitialized value printf | ❌ | ❌ | ❌ | ❌ | ✔️/❌
reading uninitialized value return | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reference out of scope | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
reinterpret cast bad size | ✔️ | ✔️ | ❌ | ✔️ | ❌/✔️
reinterpret cast float to int32 | ❌ | ❌ | ❌ | ❌ | ❌
reinterpret cast int32 to float | ❌ | ❌ | ❌ | ❌ | ❌
reinterpret cast int32 to uint32 | ❌ | ❌ | ❌ | ❌ | ❌
reinterpret cast uint32 to int32 | ❌ | ❌ | ❌ | ❌ | ❌
reinterpret cast unaligned bytes to uint32 | ❌ | ❌ | ❌ | ❌ | ❌
shifting more than width | ❌ | ✔️ | ❌ | ✔️ | ❌
signed integer overflow | ❌ | ✔️ | ❌ | ✔️ | ❌
sort comp reflexive | ❌ | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
std vector reserve set read | ❌ | ❌ | ❌ | ❌ | ❌
strptime mktime unitialized | ❌ | ❌ | ❌ | ❌ | ✔️
virtual call in constructor | n/a | n/a | n/a | n/a | n/a
virtual call in constructor helper | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
virtual call in constructor link | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
virtual call in destructor | n/a | n/a | n/a | n/a | n/a
virtual call in destructor helper | ✔️ | ✔️ | ✔️ | ✔️ | ✔️
virtual call in destructor link | ✔️ | ✔️ | ✔️ | ✔️ | ✔️


### 4.Overall Summary
Undefined Behavior Type | Compiler Warning | Standalone Static Analysis | Runtime Crash | Extra Dynamic Analsyis
--- | --- | --- | --- | ---
access after realloc | ✔️ | ✔️ | ❌ | ✔️
array out of bounds | ✔️ | ✔️ | ✔️ | ✔️
automatic variable over stack | ❌ | ❌ | ✔️ | ✔️
bad alignment | ❌ | ❌ | ❌ | ✔️
bad identifier name | ❌ | ✔️ | ❌ | ❌
delete incomplete type | ✔️ | ✔️ | ❌ | ❌
dereferencing nullptr | ❌ | ✔️ | ✔️ | ✔️
divide by zero | ✔️ | ✔️ | ✔️ | ✔️
initialize std string with nullptr | ❌ | ✔️ | ✔️ | ✔️
large double to int | ❌ | ❌ | ❌ | ✔️
malloc cast pod struct | ❌ | ❌ | ❌ | ❌
mutate const value | ❌ | ✔️ | ❌ | ❌
non trivial destructor and global | ❌ | ❌ | n/a | n/a
odr violation function | ❌ | ✔️ | ❌ | ❌
odr violation function lib | ❌ | ❌ | n/a | n/a
odr violation struct ret | ❌ | ✔️ | ❌ | ❌
odr violation struct ret lib | ❌ | ❌ | n/a | n/a
operator star on empty optional | ❌ | ✔️ | ✔️ | ❌
out of bounds pointer | ✔️ | ❌ | ❌ | ❌
preincrement plus postincrement | ✔️ | ✔️ | ❌ | ❌
preincrement plus value | ✔️ | ✔️ | ❌ | ❌
read from old type | ❌ | ❌ | ❌ | ✔️
reading uninitialized value add | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value cout | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value func arg | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value if | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value lib call cref | ✔️ | ✔️ | ❌ | ✔️
reading uninitialized value partial | ❌ | ✔️ | ✔️ | ✔️
reading uninitialized value printf | ✔️ | ✔️ | ✔️ | ✔️
reading uninitialized value return | ✔️ | ✔️ | ✔️ | ✔️
reference out of scope | ✔️ | ✔️ | ✔️ | ✔️
reinterpret cast bad size | ✔️ | ❌ | ❌ | ✔️
reinterpret cast float to int32 | ✔️ | ❌ | ❌ | ❌
reinterpret cast int32 to float | ✔️ | ❌ | ❌ | ❌
reinterpret cast int32 to uint32 | ❌ | ❌ | ❌ | ❌
reinterpret cast uint32 to int32 | ❌ | ❌ | ❌ | ❌
reinterpret cast unaligned bytes to uint32 | ❌ | ❌ | ❌ | ❌
shifting more than width | ✔️ | ✔️ | ❌ | ✔️
signed integer overflow | ❌ | ❌ | ❌ | ✔️
sort comp reflexive | ❌ | ❌ | ❌ | ❌
stack overflow | ✔️ | ✔️ | ✔️ | ✔️
std vector reserve set read | ❌ | ✔️ | ✔️ | ❌
strptime mktime unitialized | ❌ | ✔️ | ❌ | ✔️
virtual call in constructor | ✔️ | ✔️ | ✔️ | ✔️
virtual call in constructor helper | ❌ | ✔️ | ✔️ | ✔️
virtual call in constructor lib | ❌ | ✔️ | n/a | n/a
virtual call in constructor link | ❌ | ❌ | ✔️ | ✔️
virtual call in destructor | ✔️ | ✔️ | ✔️ | ✔️
virtual call in destructor helper | ❌ | ✔️ | ✔️ | ✔️
virtual call in destructor lib | ❌ | ✔️ | n/a | n/a
virtual call in destructor link | ❌ | ❌ | ✔️ | ✔️

## Versions
- Linux 1b21937069a7 6.5.0-41-generic #41~22.04.2-Ubuntu SMP PREEMPT_DYNAMIC Mon Jun  3 11:32:55 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
- Ubuntu clang version 18.1.3 (1ubuntu1)
- clang-tidy: 18.1.3
- Cppcheck 2.13.0
- gcc (Ubuntu 13.2.0-23ubuntu4) 13.2.0
- GNU bash, version 5.2.21(1)-release (x86_64-pc-linux-gnu)
- GNU parallel 20231122
- MSVC: 2022 MSVC 19.40.33811.0
- Python 3.12.3
- valgrind-3.22.0
- Windows SDK version 10.0.22621.0 to target Windows 10.0.17763.

## Reference Warning Classes
Compiler | Name | Code | Class
--- | --- | --- | ---
clang | divide by zero  | division-by-zero | default
clang | infinite recursion | infinite-recursion | Most
clang | most | Most | all
clang | shift count overflow | shift-count-overflow | default
clang | uninitialized | uninitialized | Most
clang | return type| return-type  | Most
gcc | delete incomplete | delete-incomplete | default
gcc | divide by zero | div-by-zero | default
gcc | shift count overflow | shift-count-overflow | extra
gcc | strict aliasing | strict-aliasing | all
gcc | return type | return-type | all
gcc | uninitialized | uninitialized | all
MSVC | divide by zero | 4723 | W3
MSVC | uninitialized | 4700 | W1
MSVC | stack overflow | 4717 | W1
MSVC | shift count overflow | 4293 | W1
MSVC | truncation of constant value | 4309 | W2

## Notes
Valgrind was run on GCC compiled binaries. msan, asan, and ubsan are all different flags into clang's "fsanatize" parameter.

Passing means the process halted with a non zero error code. Tests were on intel x86\_64. MSVC was tested on Windows 10 and the rest was tested on Ubuntu 20.04. Debug mode and RelWithDebInfo is in reference to CMake's build types.

There is only one case of each type. It's expected that slightly different implementations of the same types of undefined behavior may yield different results. Multiple runs were not performed consistently for statistical purposes.

There were a few other static analyzers, but they didn't seem appropriate for these problems. I tried OCLint version 0.13.1, but it didn't provide any additional insights besides compiler warnings in regards to undefined behavior. It did warn about short variable names. I also tried cppclean 0.12. It wasn't able to identify undefined behavior issues. It was able to find static data, which is in the stack overflow code by design.

It's recommended for clang-tidy to have a compile database. If it doesn't it will not detect certain errors. For example, it wouldn't detect the stack overflow error.

## Analysis
When in debug mode, MSVC halted on the most undefined behavior. Clang and GCC both benefited with the additional "-Wall" flag to catch undefined behavior as warnings. No extra flags made MSVC catch more undefined behavior.

Valgrind caught a few more cases of undefined behavior over running the programs directly. The additional cases were reading uninitialized values and dereferencing an array out of its bounds. It did provide more actionable messages than just "seg fault." Clang with "-fsanitize=undefined" performed much better in RelWithDebInfo mode over just Debug mode. It caught all types but reading from an uninitialized value and out of bounds pointer.

asan was able to identify the array out of bounds error over the undefined option, but didn't detect other use cases. Once the optimizer works, the address sanitizer is not effective at detecting undefined behavior. Pairing it with ubsan combined the best of both tools.

msan was similar to asan, except it didn't identify any new cases. It also benefited from pairing up with ubsan, but ubsan by itself was good enough.

Reading from an uninitialized value is a very common mistake for beginners and experts. Compilers sometimes catch it as warnings. Valgrind can detect it, but clang with fsantize can often miss it.

## Updates
### 2022/07/25
clang 10->14
undefined behavior | new check
------------------ | ---------
reading uninitialized value lib call cref | -Wuninitialized-const-reference

gcc 9.3->11.2
undefined behavior | new check
------------------ | ---------
array out of bounds | -Warray-bounds
out of bound pointer | -Warray-bounds
reading uninitialized value lib call cref | -Wmaybe-uninitialized
type pun cast same line | -Wuninitialized
type pun cast two lines | -Wuninitialized

clang-tidy 10->14
undefined behavior | new check
------------------ | ---------
bad identifier name | bugprone-reserved-identifier
reading uninitialized value lib call cref | clang-diagnostic-uninitialized-const-reference

cppcheck 1.9->2.7
undefined behavior | new check
------------------ | ---------
odr violation struct ret | ctuOneDefinitionRuleViolation
reading uninitialized value return | missingReturn
std vector reserve set read | containerOutOfBounds


### 2024/07/06
gcc 11.2.0->13.2.0
undefined behavior | new check
------------------ | ---------
access after realloc | -Wuse-after-free
stack overflow | -Winfinite-recursion

clang-tidy 14.0 -> 18.1.3
undefined behavior | new check
------------------ | ---------
odr violation function | misc-include-cleaner*
odr violation struct ret | misc-include-cleaner*
operator star on empty optional | bugprone-unchecked-optional-access

*misc-include-cleaner doesn't really call out the ODR violation, but it is a strong indicator.

Clang's memory sanitizer removed. Its results were similar to address. Also, the results were questionable, since it didn't work with a memory compiled standard library.

The type pun examples were changed to reinterpret cast ones. There are more examples to stress that the standard has strict requirements on reinterpret cast. Still most of them aren't checked.

## Variability
Valgrind seems to have different results over time. This may be due to version upgrades from 3.11 to 1.13 or the very nature of undefined behavior itself. It was observed that array out of bounds was undetected by valgrind during the upgrade. Not detecting uninitialized memory in release with debug info went undetected at some point later.
