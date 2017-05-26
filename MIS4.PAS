type mas = array[0.. 4] of word;
function max (var x: mas;n:integer; k:integer): word; near; assembler;
asm
  @met:

  les si ,x
  mov dx ,k
  add si ,dx

  mov cx, n
  mov ax, word ptr [es:si]

  @func:
  mov bx, word ptr [es:si]
  cmp bx, ax
  jna @again

  mov ax, bx

  @again:
  inc si
  inc si
  loop @func
end;
{$L MIS4_1.OBJ}
function max1(var x: mas;n:integer; k:integer): word; near;
external;
{$L MIX4_2.OBJ}
function max2(var x: mas;n:integer; k:integer): word; near;
external;

const m: mas = (3,2, 6,9,12);
var y: mas;
begin
y:=m;
writeln (max(y, 5,2));
writeln (max1(y, 5,2));
writeln (max2(y, 5,2));
end.
