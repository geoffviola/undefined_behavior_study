echo "start"
if (-not (Test-Path build)) {
    md build
}
cd build
cmake .. -G "Visual Studio 16 2019" -A x64
echo "Build Debug"
cmake --build . --config Debug 1> warnings.txt
Get-Content warnings.txt | Set-Content -Encoding utf8 warnings.txt
if (Test-Path Debug/warnings.txt) {
  rm Debug/warnings.txt
}
mv warnings.txt "Debug/warnings.txt"
cd Debug
echo "Run Debug"

function Run-All-Programs() {
  if (Test-Path results.txt) {
    rm results.txt
  }
  Get-ChildItem -recurse -include "*.exe" |
  Foreach-Object {
	$pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName = $_.FullName
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null
    $wait_status=$p.WaitForExit(500)
    if ($wait_status -ne "True") {echo $p.kill()}
    Add-Content -path results.txt -Value "$([io.path]::GetFileNameWithoutExtension($_.FullName)) $($p.ExitCode)"
  }
}

Run-All-Programs
cd ..

echo "Build RelWithDebInfo"
cmake --build . --config RelWithDebInfo 1> warnings.txt
if (Test-Path RelWithDebInfo/warnings.txt) {
  rm RelWithDebInfo/warnings.txt
}
mv warnings.txt "RelWithDebInfo/warnings.txt"
cd RelWithDebInfo
echo "Run RelWithDebInfo"

Run-All-Programs
cd ../..

echo "Compiler warnings"
python associate_warnings.py --cpp_dir=src --out_file="build/Debug/warnings_table.txt" --warnings_file="build/Debug/warnings.txt"
python associate_warnings.py --cpp_dir=src --out_file="build/RelWithDebInfo/warnings_table.txt" --warnings_file="build/RelWithDebInfo/warnings.txt"
echo "MSVC Debug Compiler Warnings Start"
type build\Debug\warnings_table.txt
echo "MSVC Debug Compiler Warnings End"
echo "MSVC RelWithDebInfo Compiler Warnings Start"
type build\RelWithDebInfo\warnings_table.txt
echo "MSVC RelWithDebInfo Compiler Warnings End"
echo "Runtime Results"
echo "MSVC Debug Crashes Start"
type build\Debug\results.txt
echo "MSVC Debug Crashes End"
echo "MSVC RelWithDebInfo Crashes Start"
type build\RelWithDebInfo\results.txt
echo "MSVC RelWithDebInfo Crashes End"
