md build
cd build
cmake .. -G "Visual Studio 14 2015 Win64"
cmake --build . --config Debug
cd Debug
for /r "." %%a in (*.exe) do start "" "%%~fa"
cd ..
cmake --build . --config RelWithDebInfo
cd RelWithDebInfo
for /r "." %%a in (*.exe) do start "" "%%~fa"
