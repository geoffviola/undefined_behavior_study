#pragma once

extern int global_int;

class NonTrivialDestructor {
public:
  ~NonTrivialDestructor();
};

NonTrivialDestructor *new_non_trivial_destructor_ptr();
