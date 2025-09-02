/**
18 Concepts Library
18.7 Callable Concepts
18.7.7 Concept strict_weak_order
2 The term strict refers to the requirement of an irreflexive relation (!comp(x,
x) for all x), and the term weak to requirements that are not as strong as those
for a total ordering, but stronger than those for a partial ordering. If we
define equiv(a, b) as !comp(a, b) && !comp(b, a), then the requirements are that
comp and equiv both be transitive relations:

https://eel.is/c++draft/concept.strictweakorder#2

1.0 < NaN == false
NaN < 1.0 == false
but 1 != NaN
So < fails to define equals for NaN and other values
*/

#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <functional>
#include <vector>

int main() {
    // NOLINTNEXTLINE(cppcoreguidelines-avoid-magic-numbers,readability-magic-numbers)
    std::vector<double> my_vec{{-1.0, std::nan(""), -2.0, 0.0, std::nan("")}};
    std::sort(my_vec.begin(), my_vec.end());
    for (const double value : my_vec) {
        // Avoid iostream because a lack of instrumentation may produce false
        // positives for libc++ with memory sanitizer
        // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg,hicpp-vararg)
        printf("%f, ", value);
    }
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg,hicpp-vararg)
    printf("\n");

    return EXIT_SUCCESS;
}
