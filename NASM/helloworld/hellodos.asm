; nasm hellodos.asm -o hellodos.com       
       
       org 100h         ;
       mov dx,string    ;move the string into the dx register
       mov ah,9         ;move 9 into as register -> display what is in dx register                                              
       int 21h          ;make an interrupt, process what is in registers
       mov ah,4Ch       ;move 4Ch into the ah register -> stop the program
       int 21h          ;make an interrupt, process what is in registers -> stop the program
string db 'Hello, World from Windows NTB with beep!',0Dh,0Ah,0Dh,0Ah,0Dh,0Ah,07h,'$'
