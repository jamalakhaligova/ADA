
package body Aircraft is

   procedure Ascend(AirC: in out Aircraft_Type) is
   begin
      AirC.Is_In_The_Air := True;
   end;

   procedure Land(AirC: in out Aircraft_Type) is
   begin
      AirC.Is_In_The_Air := False;
   end;

   function Get_Is_In_The_Air(AirC: in Aircraft_Type) return Boolean is
   begin
      return AirC.Is_In_The_Air;
   end;

   function Get_Coord(AirC: in Aircraft_Type) return Coord is
   begin
      return AirC.Pos_Airplane;
   end;

   procedure Set_Coord(AirC: in out Aircraft_Type; new_Coor: in Coord) is
   begin
      AirC.Pos_Airplane := new_Coor;
   end;

   procedure Set_Card_Dir_Coord(AirC: in out Aircraft_Type; Car_Dir : in Cardinal_Direction) is
   begin
       Change_To_Direction(Car_Dir,AirC.Pos_Airplane);
   end;

   procedure Start(AirC: in out Aircraft_Type) is
      package Random_int is new Ada.Numerics.Discrete_Random (Integer);
      G : Random_int.Generator;
      x1 : Integer;
      y1 : Integer ;
   begin


      Random_int.Reset(G);
      x1 := Random_int.Random(G) mod 100;
      y1 := Random_int.Random(G) mod 100;

      Set_X(AirC.Pos_Airplane,x1);
      Set_Y(AirC.Pos_Airplane,y1);
   end;

   procedure Compare(AirC1,AirC2: in out Aircraft_Type) is
   begin
      if AirC1.Name < AirC2.Name then
          Ada.Text_IO.Put_Line("Smaller");
      elsif AirC1.Name = AirC2.Name then
          Ada.Text_IO.Put_Line("Equal");
      else
          Ada.Text_IO.Put_Line("Bigger");
      end if;

   end;


   function Get_Distance(AirC1,AirC2: Aircraft_Type) return Integer is
      Cord1 : Coord := AirC1.Pos_Airplane;
      Cord2 : Coord := AirC2.Pos_Airplane;
   begin
      return Get_Distance(Cord1,Cord2);
      exception
      when others => return -1;
   end;


  procedure Action(Airc: in out Aircraft_Type) is
  newId : Id := Airc.Name;
  begin
      Change(newId => newId,inAir => Airc.Is_In_The_Air, airPos => Airc.Pos_Airplane);
  end;


end Aircraft;
