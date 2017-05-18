type mas = array [0..9] of shortint;
{$L PASCAL1.OBJ}
function find_neg2(var ThisMas :mas; length_mas :integer): integer; near;
external;

function find_neg(var ThisMas :mas; length_mas :integer): byte; near; assembler;
asm
  mov cx, length_mas
  les si, ThisMas
  xor bx, bx
  xor ax, ax

 @main:
    mov al, byte ptr [es:si]
    inc si
    or al,al
    jns @m2
    inc bx
  @m2:
    loop @main
  mov ax, bx
end;
{$L PASCAL.OBJ}
function find_neg1(var ThisMas :mas; length_mas :integer): integer; near;
external;



const m : mas = ($5, -$2, $4, -$10, $12, $3, $6, -$2, -$10, -$2);
var
count_neg :integer;
begin
writeln('HELLO WORLD');
count_neg := find_neg(m, 10);
writeln(count_neg);

count_neg := find_neg1(m, 10);
writeln(count_neg);
count_neg := find_neg2(m, 10);
writeln(count_neg);
end.
