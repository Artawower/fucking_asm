public OutputMsg, find_deg_elem
code segment
assume cs: code, ds:data, ss: stek


OutputMsg proc near
; поместить строку в dx
  mov ah, 9
  int 21h
  ret
OutputMsg endp

find_deg_elem proc near
  mov cx, 8
  xor bx, bx

  main:
    mov si, 0
    mov ah, 0
    mov al, byte ptr mas[si]
    inc si
    js m1
    jns m2
  m1:
    inc bx
    loop main
  m2:
    loop main

  push bx
  ret
find_deg_elem  endp

start:
  mov ax, data
  mov ds, ax
  ; call find_deg_elem
  mov ax, -10d

  mov ax, 4c00h
  int 21h





code ends

data Segment
  str_number dq
  mas        db 1, 2, 3, 4, 5, -10, 12, -3
  Msg1       db 'Pls input the first(1) number: ', 13,10,'$'
Result dw
data ends

stek segment stack
  dw 128 dup (?)
stek ends
end Start
