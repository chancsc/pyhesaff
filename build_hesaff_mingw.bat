SET ORIGINAL=%CD%

:: helper variables
call :build_hesaff
goto :exit

:build_hesaff
:: helper variables
set INSTALL32=C:\Program Files (x86)
set HESAFF_INSTALL="%INSTALL32%\Hesaff"

:: go into hesaff directory
cd %HOME%\code\hesaff
mkdir build
cd build

set OPENCV_BIN=%INSTALL32%\OpenCV\bin

:: Add OpenCV to PATH ?
:: set PATH=%OPENCV_BIN%;%PATH%
:: set PATH=%HOME%\code\opencv\include\opencv2;%PATH%
:: set PATH=%HOME%\code\opencv\include\opencv;%PATH%

:: OpenCV settings on windows
cmake ^
-G "MSYS Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%HESAFF_INSTALL% ^
-DCMAKE_C_FLAGS=-march=i486 ^
-DCMAKE_CXX_FLAGS=-march=i486 ^
-DOpenCV_DIR="%INSTALL32%\OpenCV" ^
..

:: make command that doesn't freeze on mingw
:: mingw32-make -j7 "MAKE=mingw32-make -j3" -f CMakeFiles\Makefile2 all
make
python %HOME%\code\hotspotter\_tpl\localize.py
exit /b

:exit
cd %ORIGINAL%
exit /b
