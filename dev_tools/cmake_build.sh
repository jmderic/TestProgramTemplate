#!/bin/bash -xe

# Usage:
# [dev_tools]$ ./cmake_build_and_maybe_ut.sh
# or
# [dev_tools]$ BLD_DIR=~/dev/ovpn/OB-O3/build_20240923_175113 ./cmake_build_and_maybe_ut.sh
# or
# [dev_tools]$ CC=clang-15 CXX=clang++-15 BLD_TYPE=Release ./cmake_build_and_maybe_ut.sh
# or
# [dev_tools]$ BUILD_ONLY=1 EXTRA_FLAGS="-DKVM_TEST=1 -DHAVE_RENAME_NEWER=TRUE" ./cmake_build_and_maybe_ut.sh

SCRIPT_DIR=$(dirname $(readlink -e "${BASH_SOURCE[0]}"))

# following could be Release or Debug (but maybe ASAN better than Debug)
BLD_TYPE=${BLD_TYPE:-ASAN}

source $SCRIPT_DIR/build_vars

cd $BLD_DIR
cmake -G Ninja --log-level=VERBOSE $EXTRA_FLAGS -DCMAKE_BUILD_TYPE=$BLD_TYPE -DUSE_WERROR=true -DUSE_MBEDTLS=false ../test-code

ninja -v -k 0

# ninja -t deps > deps_20220609_100626.log
# ninja -t targets all | grep CXX_EXECUTABLE_LINKER

# emacs M-x compile rebuild command executed from the build directory
# BLD_DIR=`pwd` BLD_TYPE=emacs_rebuild source ../test-code/dev_tools/build_vars && ninja -v -k 0

: cmake/ninja build SUCCESS $(date '+%Y%m%d_%H%M%S')
