#!/usr/bin/env bash

ROOT_DIR=$(pwd)
PATH=${PATH}:${ROOT_DIR}
SRC_DIR=${ROOT_DIR}/src

mkdir -p build
cd build

function my_time {
  echo -n "$1 "
  # BSD date doesn't provide sub second measurements
  before=$(python3 -c "import time; print(time.time())")
  $@
  if [ "$?" -ne "0" ]
  then
    python3 -c "import time; print(str(time.time() - ${before}) + 's')"
  fi
}

mkdir -p clang-tidy
cd clang-tidy
export CXX=clang++
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=TRUE ../.. > cmake.txt
cp compile_commands.json ../..
clang-tidy --quiet -checks=*,-fuchsia-default-arguments,-cppcoreguidelines-owning-memory,-cppcoreguidelines-pro-type-reinterpret-cast,-cppcoreguidelines-no-malloc,-hicpp-no-malloc,-modernize-use-trailing-return-type,-fuchsia-default-arguments-calls,-llvmlibc-*,-readability-identifier-length,-altera-struct-pack-align,-altera-unroll-loops ${SRC_DIR}/*.cpp 1> warnings.txt
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

function run_executable {
    $(timeout 1 ./${1} > intermediate_results/${1}_output.txt 2>&1)
    echo ${1} $? > intermediate_results/${1}_result.txt
}
export -f run_executable

function run_executable_with_valgrind {
    $(timeout 5 valgrind --error-exitcode=1 ./${1} > intermediate_results/${1}_valgrind_output.txt 2>&1)
    echo ${1} $? > intermediate_results/${1}_valgrind_result.txt
}
export -f run_executable_with_valgrind

function run_folder {
    with_valgrind=${1}
    declare -a executable_files
    executables_count=0
    for file in `ls -1` ; do
        if [ -x $file ] && [ -f $file ] ; then
            executable_files[executables_count]=$file
            let "executables_count++"
        fi
    done
    mkdir -p intermediate_results
    [[ "$with_valgrind" = true ]] && multiplier=2 || multiplier=1
    num_jobs=$(($executables_count*$multiplier))
    for (( i=0; i<=$(( $executables_count -1 )); i++ ))
    do
       echo -ne "kicking off $(($i*$multiplier+1))/$num_jobs\r"
       sem -j+0 run_executable ${executable_files[$i]}
       if [ "$with_valgrind" = true ] ; then
           echo -ne "kicking off $(($i*$multiplier+2))/$num_jobs\r"
           sem -j+0 run_executable_with_valgrind ${executable_files[$i]}
       fi
    done
    echo -ne '\n'
    sem --wait
    rm -f runtime_results.txt
    if [ "$with_valgrind" = true ] ; then
        rm -f valgrind_results.txt
    fi
    for file in "${executable_files[@]}" ; do
        cat intermediate_results/${file}_result.txt >> runtime_results.txt
        if [ "$with_valgrind" = true ] ; then
            cat intermediate_results/${file}_valgrind_result.txt >> valgrind_results.txt
        fi
    done
}

echo "gcc debug"
export CXX='g++'
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
run_folder true

cd ..
mkdir -p rel_with_deb_info
cd rel_with_deb_info
echo "gcc rel with deb info"
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
run_folder true

cd ../..
mkdir -p clang/debug
cd clang/debug
export CXX=clang++
echo "clang debug"
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
run_folder false

cd ..
mkdir -p rel_with_deb_info
cd rel_with_deb_info
echo "clang rel with deb info"
cmake ../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
run_folder false

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
run_folder false

cd ..
mkdir -p rel_with_deb_info
cd rel_with_deb_info
echo $1 $2 rel with deb info
cmake ../../../.. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-fsanitize=$2 -fno-sanitize-recover=$2" > cmake.txt
make -j $(nproc) 1> make.txt 2> warnings.txt
associate_warnings.py --cpp_dir=${SRC_DIR}
run_folder false
cd ../..
}

mkdir -p clang_fsanitize
cd clang_fsanitize

fsanitize_build clang address
fsanitize_build clang undefined
fsanitize_build clang address,undefined

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
echo linux kernel
uname -a
echo
echo gcc
gcc --version
echo
echo valgrind
valgrind --version
echo 
echo clang++
clang++ --version
echo
echo clang-tidy
clang-tidy --version
echo
echo cppcheck
cppcheck --version
echo
echo parallell
parallel --version
echo
echo bash
bash --version
echo
echo python3
python3 --version

echo

export LC_CTYPE=C.UTF-8
print_results.py
