call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\vcvars32.bat"
cd build
msbuild.exe /m /nologo /verbosity:minimal /p:Configuration=Release /t:Clean,Build zlib.sln
msbuild.exe /m /nologo /verbosity:minimal /p:Configuration=Debug /t:Clean,Build zlib.sln
mkdir ..\include
copy /y src\zlib.h ..\include
copy /y src\zconf.h ..\include

mkdir ..\lib
copy /y Release\zlib.lib ..\lib\zlib_release.lib
copy /y Debug\zlib.lib ..\lib\zlib_debug.lib
msbuild.exe /m /nologo /verbosity:minimal /p:Configuration=Release /t:Clean zlib.sln
msbuild.exe /m /nologo /verbosity:minimal /p:Configuration=Debug /t:Clean zlib.sln
rmdir /s /q Release
rmdir /s /q Debug
