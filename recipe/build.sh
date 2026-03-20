#!/bin/bash

mkdir -p build
pushd build

# configure
cmake \
  ${SRC_DIR} \
  ${CMAKE_ARGS} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
;

# build
cmake --build .

# test
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]]; then
ctest -V
fi

# install
cmake --build . --target install
