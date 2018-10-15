#!/usr/bin/env bash

mkdir -p build/gcc/debug
cd build/gcc/debug

cmake ../../.. -DCMAKE_BUILD_TYPE=Debug
make -j6
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./$file
        echo $file $? >> runtime_results.txt
        timeout 5 valgrind --error-exitcode=1 ./$file
        echo $file $? >> valgrind_results.txt
    fi
done

cd ..
mkdir rel_with_deb_info
cd rel_with_deb_info
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j6
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./$file
        echo $file $? >> runtime_results.txt
        timeout 5 valgrind --error-exitcode=1 ./$file
        echo $file $? >> valgrind_results.txt
    fi
done

cd ../..
mkdir -p clang/debug
cd clang/debug
export CXX=clang++
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug
make -j6
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./$file
        echo $file $? >> runtime_results.txt
    fi
done

cd ..
mkdir rel_with_deb_info
cd rel_with_deb_info
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j6
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./$file
        echo $file $? >> runtime_results.txt
    fi
done

cd ../..

clang_build() {
mkdir -p clang_fsanitize_$1/debug
cd clang_fsanitize_$1/debug
export CXX=clang++
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="-fsanitize=$1  -fno-sanitize-recover=$1"
make -j6
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./$file
        echo $file $? >> runtime_results.txt
    fi
done

cd ..
mkdir rel_with_deb_info
cd rel_with_deb_info
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-fsanitize=$1 -fno-sanitize-recover=$1"
make -j6
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./$file
        echo $file $? >> runtime_results.txt
    fi
done
cd ../..
}

clang_build undefined
clang_build address

#print results
echo
echo
echo VERSIONS
echo 
uname -a
gcc --version
valgrind --version
echo 
clang++ --version
echo
echo
echo DATA
echo clang debug
cat clang/debug/runtime_results.txt
echo
echo clang rel_with_deb_info
cat clang/rel_with_deb_info/runtime_results.txt
echo
echo GCC debug
cat gcc/debug/runtime_results.txt
echo
echo GCC rel_with_deb_info
cat gcc/debug/runtime_results.txt
echo
echo clang_fsanitize_address debug
cat clang_fsanitize_address/debug/runtime_results.txt
echo
echo clang_fsanitize_address rel_with_deb_info
cat clang_fsanitize_address/rel_with_deb_info/runtime_results.txt
echo
echo clang_fsanitize_undefined debug
cat clang_fsanitize_undefined/debug/runtime_results.txt
echo
echo clang_fsanitize_undefined rel_with_deb_info
cat clang_fsanitize_undefined/rel_with_deb_info/runtime_results.txt
echo
echo GCC valgrind debug
cat gcc/debug/valgrind_results.txt
echo
echo GCC valgrind rel_with_deb_info
cat gcc/debug/valgrind_results.txt
