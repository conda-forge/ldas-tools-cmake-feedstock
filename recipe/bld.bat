:: use local build folder
mkdir build
cd build

:: configure
cmake .. -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

:: build
cmake --build .
if errorlevel 1 exit 1

:: test
ctest -V
if errorlevel 1 exit 1

:: install
cmake --build . --target install
if errorlevel 1 exit 1
