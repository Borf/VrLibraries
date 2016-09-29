cd %~DP0
cd vrpn

echo build\ >> .gitignore

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
rmdir /s /q pc_win32
rmdir /s /q quat\pc_win32

msbuild vrpn.sln /m /t:Clean,Build /p:Configuration=Release
msbuild vrpn.sln /m /t:Clean,Build /p:Configuration=Debug
cd %~DP0
cd vrpn

rmdir /s /q build
mkdir build
cd build
mkdir include
mkdir include\vrpn
mkdir include\quat
xcopy ..\*.h include\vrpn
xcopy ..\quat\*.h include\quat
mkdir lib
cd lib
mkdir release
mkdir debug
xcopy ..\..\pc_win32\debug\*.lib debug
xcopy ..\..\pc_win32\release\*.lib release
xcopy ..\..\quat\pc_win32\debug\*.lib debug
xcopy ..\..\quat\pc_win32\release\*.lib release
cd ..
cd ..
move build ..\vrpn_build
pause