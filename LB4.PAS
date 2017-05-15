type mas = array [0..9] of shortint;

function find_neg(var ThisMas :mas; length_mas :integer): byte; near; assembler;
asm
  mov cx, length_mas
  les si, ThisMas
  xor bx, bx
  mov ah, 0

 @main:
    mov al, byte ptr [es:si]
inc si
    cmp al,0
    or al,al

    // js @m1
    jns @m2

  // @m1:
    inc bx
  //   loop @main
  @m2:
    loop @main

  mov ax, bx
  ret 
end;


const m : mas = ($5, -$2, $4, -$10, $12, $3, $6, -$2, -$10, -$2);
var
count_neg :integer;
begin
write('HELLO WORLD');
count_neg := find_neg(m, 10);
write(count_neg);
end.
