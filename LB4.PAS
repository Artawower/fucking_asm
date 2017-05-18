type mas = array [0..9] of shortint;

function find_neg(var ThisMas :mas; length_mas :integer): byte; near; assembler;
asm
  mov cx, length_mas
  les si, ThisMas
  xor bx, bx
  xor ax, ax

 @main:
    mov al, byte ptr [es:si]
inc si
    cmp al,0
    or al,al
    jns @m2
    inc bx
  @m2:
    loop @main
  mov ax, bx
end;
{$L pascal.obj}
function find_neg1(var ThisMas :mas; length_mas :integer): byte; near;
external;

const m : mas = ($5, -$2, $4, -$10, $12, $3, $6, -$2, -$10, -$2);
var
count_neg :integer;
begin
writeln('HELLO WORLD');
count_neg := find_neg(m, 10);
write(count_neg);

count_neg := find_neg1(m, $8);
write(count_neg);
end.
