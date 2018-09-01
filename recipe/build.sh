#!/bin/bash

mkdir -p build
pushd build

cmake .. \
	-Wno-dev \
	-DCMAKE_INSTALL_PREFIX=${PREFIX} \
	-DCMAKE_INSTALL_LIBDIR="lib"
ctest -V
cmake --build . --target install -- -j${CPU_COUNT}

popd
