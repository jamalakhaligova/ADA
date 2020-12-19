Generic Homework
----
Implement the airplane generic package.

Implementing coordination
Define an enumeration type (Cardinal_Direction), which represents the directions of an airplane and place it in a package Card_Dir.

The values of the type are:

N, NE, E, SE, S, SW, W, NW
Create a package (Coords) to represent coordinates, which contains the record (Coord) as private type ( a point has x and y coordinates of type Integer)

Implement the following functions:

Get_X(Coord) returns the x coordinate.

Get_Y(Coord) returns the y coordinate.

Implement the following procedures:

Set_X(Coord, Integer) : sets to new value the x coordinate.

Set_Y(Coord, Integer) : sets to new value the y coordinate.

Define the function (Get_Distance) which defines the distance between actual object and another Coord object (without square root of a^2+b^2expression).

Define a procedure (Change_To_Direction) which has 2 parameters one of Cardinal_Direction type and one of Coord type and changes the coordinates based on the direction:

If Cardinal_Direction is N then y is decreased by one.

If Cardinal_Direction isS then y is increased by one.

If Cardinal_Direction is E then x is increased by one.

If Cardinal_Direction is W then x decreased by one.

If Cardinal_Direction is NE then x increased and y is decreased by one

If Cardinal_Direction is SE then x and y are increased by one.

If Cardinal_Direction is SW then x decreased, and y is increased by one.

If Cardinal_Direction is NW then x and y are decreased by one.

Define a generic function (Coord_With_Array) with the following generic parameters:

Item : elements of the array have this type

Map : a two-dimensional array with Integer type and Item elements.

The function takes a Coord type object and Map type array and returns the element of the Map which is on the (X, Y) represented by Coord.

Implement the airplane
Define a generic package which implements the Aircraft type. It has 2 generic parameters: an (Id) for airplane identifications, and the (<) operator to compare Id type variables.

In the package include the Aircraft_Type type which has the discriminant (Name) giving the identity of an airplane, and it has two field one represents the airplane position and the other one decides if an airplane is flying (Is_In_The_Air).

Implement the following operations.

Ascend(Aircraft_Type) : an airplane takes off.

Land(Aircraft_Type) : an airplane lands.

Get_Is_In_The_Air(Aircraft_Type) : gives back if an airplane is in air or not.

Get_Coord(Aircraft_Type) : gives back the position of an airplain.

Set_Coord(Aircraft_Type, Coord) : changes the position of an airplane, this should be private.

Set_Card_Dir_Coord(Aircraft_Type, Cardinal_Direction) : changes by Cardinal_Direction the position of an airplane, it works like Change_To_Direction.

Start(Aircraft_Type) : places an airplane in random position.

Compare(Aircraft_Type, Aircraft_Type) : two airplanes can be compared using (<) generic parameter, and print equal, bigger or smaller

Get_Distance(Aircraft_Type, Aircraft_Type) : returns the distance between two Aircraft_Type-objects.

Create an Action generic procedure which has a generic parameter procedure which can change the status of an Aircraft_Type. The generic parameter procedure has 3 out parameters: the airplane id, coordinates and if is in the air.

Please check your implementation with the main demo provided.

Notes :

The random position of Start(Aircraft_Type) should be between 0 and 100.

Check the following program for the random generator:

    with Ada.Numerics.Discrete_Random, Ada.Integer_Text_IO, Ada.Text_IO;
    use Ada.Integer_Text_IO, Ada.Text_IO;

    procedure test is
      package Random_int is new Ada.Numerics.Discrete_Random (Integer);
      G : Random_int.Generator;
    begin
      Random_int.Reset(G);

      for i in 1..10 loop
        Put("random Integer : ");
        Put(Random_int.Random(G));
        new_line;
      end loop;

    end test;
The demo program:
```
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
```
