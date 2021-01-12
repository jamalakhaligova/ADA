with Ada.Text_IO,Ada.Calendar, Ada.Numerics.Discrete_Random; use Ada.Text_IO;
procedure Grade2 is

   type Barr is array (Natural range <>,Natural range <>) of Boolean;

      protected Organism is
      entry Move(X,Y : Natural; is_infected : out Boolean);
      function inArea(x,y:Natural) return Boolean;
      procedure Init;
   private
      X, Y : Natural;
      is_infected : Boolean;
      a : Barr(2..10,2..10);
   end Organism;

   task Virus;
   task body Virus is
      varx,vary : Natural;
      got_virus : Boolean := False;

      procedure spread(varx,vary : in out Integer) is
      dx : Natural := 1;
      dy : Natural := 0;
      begin
         loop
            varx := varx + dx;
            vary := vary + dy;
            exit when Organism.inArea(varx,vary);
         end loop;
      end spread;

   begin
      varx := 2;
      vary := 7;
      while not got_virus loop
         Organism.Move(varx,vary,got_virus);
         spread(varx,vary);
         delay 2.0;
      end loop;
end Virus;


   protected body Organism is
      entry Move(X,Y : Natural;is_infected : out Boolean) when True is begin
         if(a(X,Y)=True) then
            is_infected := True;
            Put_Line("virus is infected at "& X'Image &","& Y'Image);
         else
            Put_Line("virus is at "& X'Image &","& Y'Image);
         end if;
      end Move;

      procedure Init is
        cnt : Natural := 0;
      begin
        for i in 2..10 loop
            for j in 2..10 loop
               if (i=j)then
                  a(i,j) := True;
               else
                  a(i,j) := False;
               end if;
            end loop;
         end loop;
      end Init;

   function inArea(x,y : Natural) return Boolean is
      begin
         if (x>=2 and then x<=10 and then
          y>=2 and then y<=10)
       then
         return True;
      else
         return False;
      end if;
      end inArea;
   end Organism;

begin
   Organism.Init;

end Grade2;
