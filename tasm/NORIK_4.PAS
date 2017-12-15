{ поиск максимального значения в массиве слов без знака}
  type mas = array [0..9] of word;
  function find_max(var massiv :mas; length_mas :integer): integer; near; assembler;
  asm
    mov cx, length_mas
    les si, massiv
    xor bx, bx
    xor ax, ax
    mov al, byte ptr [es:si]

    @main:
      mov bl, byte ptr[es:si]
      inc si
      cmp ax, bx
      jnb @m2
      mov ax, bx
    @m2:
      loop @main
  end;
  {$L NORIK4_1.OBJ}
  function find_max1(var massiv :mas; length_mas :integer): integer; near;
  external;
  {$L NORIK4_2.OBJ}
  function find_max2(var massiv :mas; length_mas :integer): integer; near;
  external;

  const m : mas = (5, 2, 22, 10, 12, 3, 6, 2, 10, 2);
  var
  max_elem :integer;
  begin
  max_elem := find_max(m, 10);
  writeln(max_elem);
  max_elem := find_max1(m, 10);
  writeln(max_elem);
  max_elem := find_max2(m, 10);
  writeln(max_elem);
  end.
