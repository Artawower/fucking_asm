type mas = array [0..9] of integer;
function counting_elem(var ThisMas :mas; length_mas :integer; elem:integer): integer; near; assembler;
asm
mov dx, elem
mov cx, length_mas
les si, ThisMas
mov bx, 0

@main:
  mov ax, [es:si]
  add si, 2
  cmp ax, dx
  jne @m2
  inc bx
@m2:
  loop @main
mov ax, bx
end;

{$L MISB4_1.OBJ}
function counting_elem1(var ThisMas :mas; length_mas :integer; elem:integer): integer; near;
external;
{$L MISB4_2.OBJ}
function counting_elem2(var ThisMas :mas; length_mas :integer; elem:integer): integer; near;
external;

const m : mas = (5, -2, 4, -10, 12, 3, 6, 4, -10, 4);
var
sd :integer;
begin
sd := counting_elem(m, 10, 4);
writeln(sd);
sd := counting_elem1(m, 10, 4);
writeln(sd);
sd := counting_elem2(m, 10, 4);
writeln(sd);
end.
