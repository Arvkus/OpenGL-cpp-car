@echo off
if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
) else (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
)
set compilerflags=/Od /Zi /EHsc /std:c++latest /I include /I dependencies
set linkerflags=/OUT:bin\main.exe lib\SDL2.lib lib\OpenGL32.lib
cl.exe %compilerflags% src\* /link %linkerflags% 
del bin\*.ilk *.obj *.pdb
del bin\*.pdb