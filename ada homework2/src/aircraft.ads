with Ada.Numerics.Discrete_Random, Ada.Text_IO, Coords,Card_Dir; use Coords,Card_Dir;
generic
   type Id is (<>);
   with function "<" (A,B: Id) return Boolean is <>;
   package Aircraft is
   type Aircraft_Type(Name : Id) is private;


   procedure Ascend(AirC: in out Aircraft_Type); --an airplane takes off.
   procedure Land(AirC: in out Aircraft_Type); --an airplane lands.
   function Get_Is_In_The_Air(AirC: in Aircraft_Type) return Boolean; --gives back if an airplane is in air or not.
   function Get_Coord(AirC: in Aircraft_Type) return Coord;  -- gives back the position of an airplain.
   procedure Set_Coord(AirC: in out Aircraft_Type; new_Coor: in Coord); -- changes the position of an airplane, this should be private.
   procedure Set_Card_Dir_Coord(AirC: in out Aircraft_Type; Car_Dir : Cardinal_Direction); --changes by Cardinal_Direction the position of an airplane, it works like Change_To_Direction.
   procedure Start(AirC: in out Aircraft_Type); -- places an airplane in random position.
   procedure Compare(AirC1,AirC2: in out Aircraft_Type); -- two airplanes can be compared using (<) generic parameter, and print equal, bigger or smaller
   function Get_Distance(AirC1,AirC2: Aircraft_Type) return Integer; --returns the distance between two Aircraft_Type-objects.

   generic
      with procedure Change(newId: out Id; inAir: out boolean; airPos: out Coord);
      procedure Action(Airc : in out Aircraft_Type);



private
   type Aircraft_Type(Name : Id) is record
                                        --airname : Id := Name;
                                        Pos_Airplane : Coord;
                                        Is_In_The_Air: Boolean := False;
                                    end record;
end Aircraft;
