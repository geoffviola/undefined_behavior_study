md build
cd build
cmake .. -G "Visual Studio 14 2015 Win64" 1> cmake.txt
cmake --build . --config Debug 1> build.txt 2> warnings.txt
mv warnings.txt "Debug/warnings.txt"
cd Debug
for /r "." %%a in (*.exe) do (call :subroutine "%%~fa")
cd ..
cmake --build . --config RelWithDebInfo 1> build.txt 2> warnings.txt
mv warnings.txt "RelWithDebInfo/warnings.txt"
cd RelWithDebInfo
for /r "." %%a in (*.exe) do (call :subroutine "%%~fa")

cd ..\..
echo Compiler warnings
python associate_warnings.py --cpp_dir=src --out_file="build/Debug/warnings_table.txt" --warnings_file="build/Debug/warnings.txt"
python associate_warnings.py --cpp_dir=src --out_file="build/RelWithDebInfo/warnings_table.txt" --warnings_file="build/RelWithDebInfo/warnings.txt"
echo "MSVC Debug"
type build\Debug\warnings_table.txt
echo "MSVC RelWithDebInfo"
type build\RelWithDebInfo\warnings_table.txt
echo Runtime Results
echo MSVC Debug
type build\Debug\results.txt
echo MSVC RelWithDebInfo
type build\RelWithDebInfo\results.txt
GOTO :eof

:subroutine
 %1
 echo %1 %errorlevel% >> results.txt
