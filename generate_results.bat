md build
cd build
cmake .. -G "Visual Studio 15 2017 Win64"
cmake --build . --config Debug
cd Debug
for /r "." %%a in (*.exe) do (call :subroutine "%%~fa")
cd ..
cmake --build . --config RelWithDebInfo
cd RelWithDebInfo
for /r "." %%a in (*.exe) do (call :subroutine "%%~fa")

cd ..\..
echo MSVC Debug
type build\Debug\results.txt
echo MSVC RelWithDebInfo
type build\RelWithDebInfo\results.txt
python print_results.py
GOTO :eof

:subroutine
 %1
 echo %1 %errorlevel% >> results.txt
