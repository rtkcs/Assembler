
@set INCLUDE=c:\program files\microsoft visual studio 10.0\vc\include
@set LIB=c:\program files\microsoft visual studio 10.0\vc\lib;c:\program files\microsoft sdks\windows\v7.0a\lib;

nasm -f win32 show.asm  --prefix _

nasm -f win32 out.asm  --prefix _

cl mainline.c show.obj out.obj
