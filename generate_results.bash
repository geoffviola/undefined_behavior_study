#!/usr/bin/env bash

ROOT_DIR=$(pwd)
PATH=${PATH}:${ROOT_DIR}
SRC_DIR=${ROOT_DIR}/src

mkdir -p build
cd build

mkdir -p clang-tidy
cd clang-tidy
export CXX=clang++
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=TRUE ../.. > cmake.txt
cp compile_commands.json ../..
clang-tidy -checks=*,-fuchsia-default-arguments ${SRC_DIR}/*.cpp 1> warnings.txt
rm ../../compile_commands.json
associate_warnings.py --cpp_dir=${SRC_DIR}
cd ..

mkdir -p cppcheck
cd cppcheck
cppcheck ${SRC_DIR}/*.cpp 1> cppcheck.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
cd ..

mkdir -p gcc/debug
cd gcc/debug

echo "gcc debug"
export CXX='g++'
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
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
mkdir -p rel_with_deb_info
cd rel_with_deb_info
echo "gcc rel with deb info"
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
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
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo $file $? >> runtime_results.txt
    fi
done

cd ..
mkdir -p rel_with_deb_info
cd rel_with_deb_info
echo "clang rel with deb info"
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo $file $? >> runtime_results.txt
    fi
done

cd ../..

fsanitize_build() {
mkdir -p $2/debug
cd $2/debug
if [ "$1" == "gcc" ]; then
  export CXX='g++'
else
  export CXX=$1++
fi
echo $1 $2 debug
cmake ../../../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="-fsanitize=$2  -fno-sanitize-recover=$2" > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo $file $? >> runtime_results.txt
    fi
done

cd ..
mkdir -p rel_with_deb_info
cd rel_with_deb_info
echo $1 $2 rel with deb info
cmake ../../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-fsanitize=$2 -fno-sanitize-recover=$2" > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
for file in `ls -1` ; do
    if [ -x $file ] && [ -f $file ] ; then
        timeout 1 ./${file} > ${file}_output.txt 2>&1
        echo $file $? >> runtime_results.txt
    fi
done
cd ../..
}

mkdir -p clang_fsanitize
cd clang_fsanitize

fsanitize_build clang address
fsanitize_build clang memory
fsanitize_build clang undefined
fsanitize_build clang address,undefined
fsanitize_build clang memory,undefined

cd ..

mkdir -p gcc_fsanitize
cd gcc_fsanitize

fsanitize_build gcc address
fsanitize_build gcc leak
fsanitize_build gcc undefined
fsanitize_build gcc address,leak,undefined

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
