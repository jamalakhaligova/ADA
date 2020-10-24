package body Coords is

   function Get_X(C: Coord) return Integer is
   begin
      return C.x;
   end;

   function Get_Y(C: Coord) return Integer is
   begin
      return C.y;
   end;


   procedure Set_X(C: out Coord;x_new : Integer) is
   begin
      C.x := x_new;
   end;

   procedure Set_Y(C: out Coord;y_new : Integer) is
   begin
      C.y := y_new;
   end;


   function Get_Distance(C_act, C_oth :  Coord) return Integer is
   begin
      return ((C_oth.x - C_act.x)**2 + (C_oth.y - C_act.y)**2);
   end;

   procedure Change_To_Direction(CarDir : Cardinal_Direction ; C: in out Coord) is
   begin

      case CarDir is
         when N    => C.y := C.y - 1;
         when S    => C.y := C.y + 1;
         when E    => C.x := C.x  + 1;
         when W    => C.x := C.x  - 1;
         when NE    => C.x := C.x + 1; C.y := C.y - 1;
         when SE    => C.x := C.x + 1; C.y := C.y + 1;
         when SW    => C.x := C.x - 1; C.y := C.y + 1;
         when NW    => C.x := C.x - 1; C.y := C.y - 1;
         when others => -- error has already been signaled to user
            null;
      end case;
   end;


   function Coord_With_Array(Arr : Map;Coor : Coord) return Item is
   begin
      return Arr(Coor.x,Coor.y);
   end;


end Coords;
