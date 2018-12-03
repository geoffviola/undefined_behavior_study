#!/usr/bin/env bash

ROOT_DIR=$(pwd)
PATH=${PATH}:${ROOT_DIR}
SRC_DIR=${ROOT_DIR}/src

mkdir build
cd build

mkdir clang-tidy
cd clang-tidy
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=TRUE .. > cmake.txt
clang-tidy -checks=* ${SRC_DIR}/*.cpp 1> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
cd ..

mkdir cppcheck
cd cppcheck
cppcheck ${SRC_DIR}/*.cpp 1> cppcheck.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
cd ..

mkdir -p gcc/debug
cd gcc/debug

echo "gcc debug"
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug > cmake.txt
make -j6 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo ${file} $? >> runtime_results.txt
        timeout 5 valgrind --error-exitcode=1 ./${file} > ${file}_valgrind_output.txt 2>&1
        echo $file $? >> valgrind_results.txt
    fi
done

cd ..
mkdir rel_with_deb_info
cd rel_with_deb_info
echo "gcc rel with deb info"
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo > cmake.txt
make -j6 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo ${file} $? >> runtime_results.txt
        timeout 5 valgrind --error-exitcode=1 ./${file} > ${file}_valgrind_output.txt 2>&1
        echo $file $? >> valgrind_results.txt
    fi
done

cd ../..
mkdir -p clang/debug
cd clang/debug
export CXX=clang++
echo "clang debug"
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug > cmake.txt
make -j6 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo $file $? >> runtime_results.txt
    fi
done

cd ..
mkdir rel_with_deb_info
cd rel_with_deb_info
echo "clang rel with deb info"
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo > cmake.txt
make -j6 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo $file $? >> runtime_results.txt
    fi
done

cd ../..

clang_build() {
mkdir -p $1/debug
cd $1/debug
export CXX=clang++
echo clang $1 debug
cmake ../../../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="-fsanitize=$1  -fno-sanitize-recover=$1" > cmake.txt
make -j6 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo $file $? >> runtime_results.txt
    fi
done

cd ..
mkdir rel_with_deb_info
cd rel_with_deb_info
echo clang $1 rel with deb info
cmake ../../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-fsanitize=$1 -fno-sanitize-recover=$1" > cmake.txt
make -j6 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo $file $? >> runtime_results.txt
    fi
done
cd ../..
}

mkdir clang_fsanitize
cd clang_fsanitize

clang_build address
clang_build memory
clang_build undefined
clang_build address,undefined
clang_build memory,undefined

cd ..

mkdir -p msvc
cd msvc
../../download_msvc_files.py
cd ../..

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

export LC_CTYPE=C.UTF-8
print_results.py
