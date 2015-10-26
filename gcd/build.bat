erase *.obj
erase *.exe

@set INCLUDE=c:\program files\microsoft visual studio 9.0\vc\include
@set LIB=c:\program files\microsoft visual studio 9.0\vc\lib;c:\program files\microsoft sdks\windows\v6.0a\lib;

nasm -f win32 gcdmem.asm  --prefix _
cl mainlinemem.c gcdmem.obj

nasm -f win32 gcdlocal.asm  --prefix _
cl mainlinelocal.c gcdlocal.obj

nasm -f win32 gcdargs.asm  --prefix _
cl mainlineargs.c gcdargs.obj

nasm -f win32 gcd.asm  --prefix _
cl mainline.c gcd.obj
