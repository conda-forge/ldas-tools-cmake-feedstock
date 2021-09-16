#!/bin/bash

mkdir -p build
pushd build

# configure
cmake ${CMAKE_ARGS} .. -DCMAKE_INSTALL_PREFIX=${PREFIX}

# build
cmake --build .

# test
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]]; then
ctest -V
fi

# install
cmake --build . --target install
