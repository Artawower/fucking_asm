  type mas = array [0..9] of shortint;
  function find_max_elem(var massiv :mas; length_mas :integer): shortint; near; assembler;
  asm
    mov cx, length_mas
    les si, massiv
    mov al, byte ptr [es:si]

    @main:
      mov bl, byte ptr[es:si]
      inc si
      cmp al, bl
      jg @m2
      mov al, bl
    @m2:
      loop @main

  end;
  {$L KOL4_1.OBJ}
  function find_max_elem_LP(var massiv :mas; length_mas :integer): shortint; near;
  external;
  {$L KOL4_2.OBJ}
  function find_max_elem_hand(var massiv :mas; length_mas :integer): shortint; near;
  external;

  const m : mas = (11, -5, 123, -11, 44, 1, 8, 14, 24, 81);
  var
  max_elem :shortint;
  begin
  max_elem := find_max_elem(m, 10);
  write('Max shortint number in massiv = ');
  writeln(max_elem);

  max_elem := find_max_elem_LP(m, 10);
  write('Max shortint number in massiv (large pascal) = ');
  writeln(max_elem);

  max_elem := find_max_elem_hand(m, 10);
  write('Max shortint number in massiv (hand mode) = ');
  writeln(max_elem);
  end.
