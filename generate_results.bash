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
mkdir -p clang_fsanitize/debug
cd clang_fsanitize/debug
export CXX=clang++
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="-fsanitize=undefined  -fno-sanitize-recover=undefined"
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
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-fsanitize=undefined -fno-sanitize-recover=undefined"
make -j6
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./$file
        echo $file $? >> runtime_results.txt
    fi
done

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
cd ../..
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
echo clang_fsanitize debug
cat clang_fsanitize/debug/runtime_results.txt
echo
echo clang_fsanitize rel_with_deb_info
cat clang_fsanitize/rel_with_deb_info/runtime_results.txt
echo
echo GCC valgrind debug
cat gcc/debug/valgrind_results.txt
echo
echo GCC valgrind rel_with_deb_info
cat gcc/debug/valgrind_results.txt
