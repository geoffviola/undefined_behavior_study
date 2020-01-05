if (-not (Test-Path build)) {
    md build
}
cd build
cmake .. -G "Visual Studio 16 2019" -A x64

function Build-And-Run($Config) {
  echo "Build $Config"
  cmake --build . --config $Config 1> warnings_enc.txt
  Get-Content warnings_enc.txt | Set-Content -Encoding utf8 warnings.txt
  if (Test-Path $Config/warnings.txt) {
    rm $Config/warnings.txt
  }
  mv warnings.txt "$Config/warnings.txt"
  cd $Config
  echo "Run $Config"
  Run-All-Programs
  cd ..
}

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
    $wait_status=$p.WaitForExit(1000)
    if ($wait_status -ne "True") {echo $p.kill()}
    Add-Content -path results.txt -Value "$([io.path]::GetFileNameWithoutExtension($_.FullName)) $($p.ExitCode)"
  }
}

Build-And-Run -Config Debug
Build-And-Run -Config RelWithDebInfo

cd ..

echo "Compiler warnings"
python associate_warnings.py --cpp_dir=src --out_file="build/Debug/warnings_table.txt" --warnings_file="build/Debug/warnings.txt"
python associate_warnings.py --cpp_dir=src --out_file="build/RelWithDebInfo/warnings_table.txt" --warnings_file="build/RelWithDebInfo/warnings.txt"
type build\warnings_enc.txt
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
