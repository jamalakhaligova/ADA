with Card_Dir; use Card_Dir;
package Coords is

    type Coord is private;

    function Get_X(C: Coord) return Integer; --returns the x coordinate.
    function Get_Y(C: Coord) return Integer;  --returns the y coordinate.

    procedure Set_X(C: out Coord;x_new : Integer);  --sets to new value the x coordinate.
    procedure Set_Y(C: out Coord;y_new : Integer);  --sets to new value the y coordinate.

    function Get_Distance(C_act,C_oth: Coord) return Integer; --the distance between actual object and another Coord object (without square root of a^2+b^2expression).
    procedure Change_To_Direction(CarDir : Cardinal_Direction ; C: in out Coord); --changes the coordinates based on the direction:
   generic
      type Item is private;
      type Map is array (Integer range <>, Integer range <>) of Item;
      function Coord_With_Array(Arr : Map;Coor : Coord) return Item;


private

    type Coord is record
                           x: Integer := 0;
                           y: Integer := 0;
                       end record;

end Coords;
