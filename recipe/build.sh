#!/bin/bash

mkdir -p build
pushd build

# configure
cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX}

# build
cmake --build .

# test
ctest -V

# install
cmake --build . --target install
