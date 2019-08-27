md build
cd build
cmake .. -G "Visual Studio 16 2019 Win64"
echo Build Debug
cmake --build . --config Debug 1> warnings.txt
mv warnings.txt "Debug/warnings.txt"
cd Debug
echo Run Debug
for /r "." %%a in (*.exe) do (call :subroutine "%%~fa")
cd ..
echo Build RelWithDebInfo
cmake --build . --config RelWithDebInfo 1> warnings.txt
mv warnings.txt "RelWithDebInfo/warnings.txt"
cd RelWithDebInfo
echo Run RelWithDebInf
for /r "." %%a in (*.exe) do (call :subroutine "%%~fa")

cd ..\..
echo Compiler warnings
python associate_warnings.py --cpp_dir=src --out_file="build/Debug/warnings_table.txt" --warnings_file="build/Debug/warnings.txt"
python associate_warnings.py --cpp_dir=src --out_file="build/RelWithDebInfo/warnings_table.txt" --warnings_file="build/RelWithDebInfo/warnings.txt"
echo MSVC Debug Compiler Warnings Start
type build\Debug\warnings_table.txt
echo MSVC Debug Compiler Warnings End
echo MSVC RelWithDebInfo Compiler Warnings Start
type build\RelWithDebInfo\warnings_table.txt
echo MSVC RelWithDebInfo Compiler Warnings End
echo Runtime Results
echo MSVC Debug Crashes Start
type build\Debug\results.txt
echo MSVC Debug Crashes End
echo MSVC RelWithDebInfo Crashes Start
type build\RelWithDebInfo\results.txt
echo MSVC RelWithDebInfo Crashes End
GOTO :eof

:subroutine
 %1
 Set ProgramError=%errorlevel%
 For %%A in ("%1%") do (
    Set Filename=%%~nA
 )
 echo %Filename% %ProgramError% >> results.txt
