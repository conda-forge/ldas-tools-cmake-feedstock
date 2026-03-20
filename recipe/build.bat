mkdir build
cd build

cmake ^
  %CMAKE_ARGS% ^
  -G "NMake Makefiles" ^
  -DCMAKE_BUILD_TYPE:STRING=Release ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
  "%SRC_DIR%"
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --parallel "%CPU_COUNT%" --verbose
if %ERRORLEVEL% neq 0 exit 1

ctest -V
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --parallel "%CPU_COUNT%" --verbose --target install
if %ERRORLEVEL% neq 0 exit 1
