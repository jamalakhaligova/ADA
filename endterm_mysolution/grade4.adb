with Ada.Text_IO,Ada.Calendar, Ada.Numerics.Discrete_Random; use Ada.Text_IO;
procedure Grade4 is

   type Barr is array (Natural range <>,Natural range <>) of Boolean;

  package randomBoolean is new Ada.Numerics.Discrete_Random(Boolean);
      g:randomBoolean.Generator;

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
   subtype Virus_Type is Virus;

   task body Virus is
      act_x,act_y : Natural;
      dis_x,dis_y : Integer;
      got_virus : Boolean := False;
      tiny_virus_b : Boolean := False;
      rand : Boolean;
      type tinyVirusptr is access Virus_Type;
      tinyVirus : tinyVirusptr;

      procedure spread(varx,vary : Natural; dx,dy : Integer) is
      begin
         act_x := act_x + dis_x;
         act_y := act_y + dis_y;

            --exit when Organism.inArea(act_x,act_y);
      end spread;
   begin
      randomBoolean.Reset(g);

      act_x := varx;
      act_y := vary;
      dis_x := dx;
      dis_y := dy;
      while not got_virus loop
         --Put_Line(act_x'Image & " and " & act_y'Image);
         rand := randomBoolean.Random(g);
         if(rand) then
            Organism.Move(act_x,act_y,got_virus);
            spread(act_x,act_y,dis_x,dis_y);
            delay 1.0;
         else
            Put_Line("Couldn't infect at "& act_x'Image & " "& act_y'Image);
         end if;

      end loop;
      if(got_virus) then
         tinyVirus := new Virus_Type(act_x,act_y,dis_y,-dis_x);
         delay 0.5;
      end if;

end Virus;


   protected body Organism is
      entry Move(X,Y : Natural;is_infected : out Boolean) when True is begin
         --Put_Line(X'Image & " and " & Y'Image);
         if(a(X,Y)=True) then
               is_infected := True;
               a(X,Y):=False; --cell died
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
               elsif (i mod j =0 or j mod i=0) then
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

end Grade4;
