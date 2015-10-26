erase mainline.obj
erase sum.obj
erase mainline.exe

nasm -f win32 sum.asm  --prefix _

@set INCLUDE=c:\program files\microsoft visual studio 10.0\vc\include
@set LIB=c:\program files\microsoft visual studio 10.0\vc\lib;c:\program files\microsoft sdks\windows\v7.0a\lib;

cl mainline.c sum.obj
