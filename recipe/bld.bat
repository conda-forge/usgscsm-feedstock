mkdir build
cd build
cmake -G "Visual Studio 17 2022" ^
    -A x64 ^
    -D CMAKE_CXX_FLAGS="/utf-8 /DFMT_HEADER_ONLY" ^
    -D CMAKE_C_FLAGS="/utf-8" ^
    -D CMAKE_BUILD_TYPE=Release ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_PREFIX_PATH=%PREFIX% ^
    -D USGSCSM_BUILD_TESTS=OFF  ^
    -D USGSCSM_BUILD_DOCS=OFF  ^
    -D ALE_BUILD_DOCS=OFF  ^
    -D USGSCSM_EXTERNAL_DEPS=OFF ^
     %SRC_DIR%
if errorlevel 1 exit 1

cmake --build . --target ALL_BUILD --config Release
if errorlevel 1 exit 1

REM Install the full tree (libraries, headers, usgscsm_cam_test) the same way
REM the Unix build does, rather than copying a single dll.
cmake --install . --config Release
if errorlevel 1 exit 1
