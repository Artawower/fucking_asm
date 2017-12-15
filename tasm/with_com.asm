begin segment
  org 100h
assume cs:begin, ds:begin
start:
  mov dx, offset Msg
  mov ah, 9
  int 21h
  int 20h

Msg db 'Hello!',13,10,'$'
Begin ends
  end start
