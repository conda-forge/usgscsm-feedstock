mkdir build
cd build
cmake -G "Visual Studio 15 2017 Win64" ^
    -D CMAKE_BUILD_TYPE=Release ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_PREFIX_PATH=%PREFIX% ^
    -D USGSCSM_BUILD_TESTS=OFF  ^
    -D USGSCSM_BUILD_DOCS=OFF  ^
    -D ALE_BUILD_DOCS=OFF  ^
    -D USGSCSM_EXTERNAL_DEPS=OFF
     %SRC_DIR%
if errorlevel 1 exit 1

cmake --build . --target ALL_BUILD --config Release
copy Release\usgscsm.dll %LIBRARY_BIN%
if errorlevel 1 exit 1
