
@set INCLUDE=c:\program files\microsoft visual studio 10.0\vc\include
@set LIB=c:\program files\microsoft visual studio 10.0\vc\lib;c:\program files\microsoft sdks\windows\v7.0a\lib;

nasm -f win32 randint.asm  --prefix _
cl mainline.c randint.obj
