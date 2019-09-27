:: use local build folder
mkdir build
cd build

:: force cmake to use nmake
set "CMAKE_GENERATOR=NMake Makefiles"

:: configure
cmake .. ^
	-G "%CMAKE_GENERATOR%" ^
	-DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"
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
