rem use local build folder
mkdir build
cd build

rem configure
cmake .. ^
	-G "NMake Makefiles" ^
	-DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

rem build
cmake --build .
if errorlevel 1 exit 1

rem test
ctest -V
if errorlevel 1 exit 1

rem install
cmake --build . --target install
if errorlevel 1 exit 1
