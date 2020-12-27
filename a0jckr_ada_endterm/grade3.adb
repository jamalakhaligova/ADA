with Ada.Text_IO,Ada.Calendar, Ada.Numerics.Discrete_Random; use Ada.Text_IO;
procedure Grade3 is

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

   task type Virus(varx,vary: Natural; dx,dy: Integer);
   task body Virus is
      act_x,act_y : Natural;
      dis_x,dis_y : Integer;
      got_virus : Boolean := False;

      procedure spread(varx,vary : Natural; dx,dy : Integer) is
      begin
         loop
            act_x := act_x + dis_x;
            act_y := act_y + dis_y;
            exit when Organism.inArea(act_x,act_y);
         end loop;
      end spread;
   begin
      act_x := varx;
      act_y := vary;
      dis_x := dx;
      dis_y := dy;
      while not got_virus loop
         Organism.Move(act_x,act_y,got_virus);
         spread(act_x,act_y,dis_x,dis_y);
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
               elsif (i mod j =0) then
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

   type Virusptr is access Virus;

   f,t,s : Virusptr;

begin

   Organism.Init;
   f := new Virus(2,7,1,0);
   t := new Virus(2,3,1,1);
   s := new Virus(10,2,-1,1);

end Grade3;
