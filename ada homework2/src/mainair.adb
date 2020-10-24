with Aircraft, Ada.Text_IO, Ada.Integer_Text_IO, Coords, Card_Dir;
use Ada.Text_IO, Ada.Integer_Text_IO, Coords, Card_Dir;

procedure mainair is
  package My_Aircraft is new Aircraft(character);
  use My_Aircraft;

  A:Aircraft_Type('1');
  B:Aircraft_Type('2');

  procedure Change(I:out character; B:out boolean; C:out Coord) is
  begin
    I := '3';
    B := false;
    Set_X(C,10);
    Set_Y(C,5);
  end Change;

  type Map is array (Integer range <>, Integer range <>) of Integer;

  tmp_cnt_map:Integer:=1;
  My_map:Map(0..100,0..100);
  function Coord_With_map is new Coord_With_Array(Integer, Map);

procedure My_Action is new Action(Change);
begin

  for i in 0..100 loop
    for j in 0..100 loop
      My_map(i,j) := tmp_cnt_map;
      tmp_cnt_map := tmp_cnt_map + 1;
    end loop;
  end loop;

  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");
  Put("coord of B: (");Put(integer'Image(Get_X(Get_Coord(B))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(B))));Put_line(" )");
  new_line;

  Put_Line("After Start for A , B");
  Start(A); Start(B);

  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");
  Put("coord of B: (");Put(integer'Image(Get_X(Get_Coord(B))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(B))));Put_line(" )");
  new_line;


  Land(A);
  if Get_Is_In_The_Air(A) then Put_Line("A is in the air");
  else Put_Line("A not in the air");
  end if;
  if Get_Is_In_The_Air(B) then Put_Line("B is in the air");
  else Put_Line("B not in the air");
  end if;
  new_line;

  Ascend(A);
  Put_Line("After Ascend A");
  if Get_Is_In_The_Air(A) then Put_Line("A is in the air");
  else Put_Line("A not in the air");
  end if;
  new_line;

  Put("comparing A and B : ");  Compare(A,B);
  new_line;

  Put_line("After using Action on A : ");
  My_Action(A);
  Put("x coord of A:");Put(integer'Image(Get_X(Get_Coord(A))));
  Put(" -- y coord of A:");Put_Line(integer'Image(Get_Y(Get_Coord(A))));
  if Get_Is_In_The_Air(A) then Put_Line("A Is in the air");
  else Put_Line("A not in the air");
  end if;
  new_line;

  Put_Line("Changing directions of A : ");

  Set_Card_Dir_Coord(A, N);
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");

  Set_Card_Dir_Coord(A, SE);
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");

  Set_Card_Dir_Coord(A, NW);
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");

  Set_Card_Dir_Coord(A, NE);
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");

  Set_Card_Dir_Coord(A, E);
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");

  Set_Card_Dir_Coord(A, W);
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");

  Set_Card_Dir_Coord(A, S);
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");

  Set_Card_Dir_Coord(A, SW);
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");


  new_line;
  Put("coord of A: (");Put(integer'Image(Get_X(Get_Coord(A))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(A))));Put_line(" )");
  Put("coord of B: (");Put(integer'Image(Get_X(Get_Coord(B))));Put(" ,");Put(integer'Image(Get_Y(Get_Coord(B))));Put_line(" )");
  new_line;

  Put("Distance: ");
  Put_Line(integer'Image(Get_Distance(A,B)));
  new_line;

  Put("A place on map: ");
  Put_Line(Integer'image(Coord_With_map(My_map, Get_Coord(A))));

  Put("B place on map: ");
  Put_Line(Integer'image(Coord_With_map(My_map, Get_Coord(B))));
end mainair;
