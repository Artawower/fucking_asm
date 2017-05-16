public min
code segment public
assume cs: code, ds: data
min proc near
  mov ax, data
  mov ds, ax
  xor dx, dx
  push bp
  mov bp, sp
  mov si, [bp + 4]
  mov ax, [si]
  mov si, [bp + 6]
  mov cx, [si]

  sub ax, cx
  jns bg2
  js bg1
  bg1:
      mov dx, offset min1
      mov ah, 9
      int 21h
      mov ax, 4c00h
      int 21h
  bg2:
      mov dx, offset min2
      mov ah, 9
      int 21h
      mov ax, 4c00h
      int 21h
min  endp
code ends

data Segment public
min1       db 'The first number bigger then two', 13,10,'$'
min2       db 'The second number bigger then one', 13,10,'$'
Result dw
data ends
end
