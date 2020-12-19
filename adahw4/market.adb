with Ada.Text_IO,Ada.Numerics.Discrete_Random,Ada.Calendar;
use Ada.Text_IO;
procedure Market is

   subtype Index is Positive range 1..10;
   package randomPos is new Ada.Numerics.Discrete_Random(Index);

   infected_count : Natural := 0;

   type Position is record
     x: Natural;
     y: Natural;
   end record;

   type Direction is (left,right,up,down);
   package randomDir is new Ada.Numerics.Discrete_Random(Direction);

   protected Generator is
      procedure Init;
      function GetRandPos return Position;
      function GetRandDir return Direction;
   private
      k:randomPos.Generator;
      l:randomDir.Generator;
   end Generator;

   protected body Generator is
      procedure Init is
      begin
         randomPos.Reset(k);
         randomDir.Reset(l);
      end Init;
      function GetRandPos return Position is
         x:Index;
         y:Index;
      begin

         x:=randomPos.Random(k);
         y:=randomPos.Random(k);
         return (x,y);
      end GetRandPos;

      function GetRandDir return Direction is
      begin
         return randomDir.Random(l);
      end GetRandDir;
   end Generator;

   protected Monitor is
      procedure Print(s:String);
   end Monitor;

   protected body Monitor is
      procedure Print(s:String) is
      begin
         Put_Line(s);
      end Print;
   end Monitor;

   type Barr is array (Natural range <>,Natural range <>) of Boolean;
   protected Area is
      procedure Init;
      function inArea(pos:Position) return Boolean;
      procedure infectCell(pos:Position);
      function isInfected(pos:Position) return Boolean;
      function getInfectedPerc return Natural;

   private
      a : Barr(1..10,1..10);
   end Area;

   protected body Area is
      procedure Init is
      begin

         for i in 1..10 loop
            for j in 1..10 loop
               a(i,j):=False; --no covid at first
            end loop;
         end loop;
      end Init;

      procedure infectCell(pos:Position) is
      begin
         a(pos.x,pos.y):=True;
      end infectCell;

      function isInfected(pos:Position) return Boolean is
      begin
         return a(pos.x,pos.y);
      end isInfected;


      function inArea(pos:Position) return Boolean is
      begin
         if (pos.x>=1 and then pos.x<=10 and then
          pos.y>=1 and then pos.y<=10)
       then
         return True;
      else
         return False;
      end if;
      end inArea;

      function getInfectedPerc return Natural is
         cnt : Natural:=0;
      begin
         for i in 1..10 loop
            for j in 1..10 loop
               if a(i,j) then
                  cnt:=cnt+1;
               end if;
            end loop;
         end loop;
         return cnt;
      end getInfectedPerc;
   end Area;

   type Pstr is access String;
   task type Customer(name : Pstr ; is_infected : Boolean);


   task Organizer is
      entry Create;
   end Organizer;

   task body Customer is
      pos:Position:=Generator.GetRandPos;
      movement:Natural:=0;
      is_sick : Boolean := is_infected;
      procedure move is
         tmp:Position;
         dir:Direction;
      begin
         loop
            tmp:=pos;
            dir:=Generator.GetRandDir;
            case dir is
               when left => tmp.x:=pos.x-1;
               when right => tmp.x:=pos.x+1;
               when up => tmp.y:=pos.y-1;
               when down => tmp.y:=pos.y+1;
            end case;
            exit when Area.inArea(tmp);
         end loop;
         pos:=tmp;
      end move;

   begin
      while movement<4 loop
         --if not Organizer'Callable then
         --   exit;
         --end if;
         --Monitor.Print("Current position : " & pos.x'Image & " , "& pos.y'Image);
         if is_sick then
            Area.infectCell(pos);
            --Monitor.Print("One more cell infected");
         end if;
         if Area.isInfected(pos) then
            is_sick := True;
         end if;
         movement:=movement+1;
         delay 0.5;
         move;
      end loop;
      if is_sick then
            Monitor.Print(name.all &" named customer has infected");
            infected_count := infected_count + 1;
      end if;
      if Organizer'Callable then
         Monitor.Print( name.all &" named customer finished"); -- this means 4 movements so 2 mins done
         Organizer.Create;
      end if;

   end Customer;
   type CustomerPtr is access Customer;
   task body Organizer is
      start : Ada.Calendar.Time;
      a,b,c,d,e,tmp: CustomerPtr;
      total_customers : Natural := 5;

   begin
      Generator.Init;
      Area.Init;
      a:=new Customer(new String'("c1"),True);
      b:=new Customer(new String'("c2"),True);
      c:=new Customer(new String'("c3"),True);
      d:=new Customer(new String'("c4"),True);
      e:=new Customer(new String'("c5"),True);

      start:=Ada.Calendar.Clock;
      loop
         if Ada.Calendar."-"( Ada.Calendar.Clock, start ) >=60.0 then
            exit;
         end if;
         select
            accept Create  do
               tmp:=new Customer(new String'("cus "& total_customers'Image),False);
               Monitor.Print("Created new customer");
               total_customers := total_customers + 1;
            end Create;
         end select;

      end loop;
      Monitor.Print("Percentage of territory is infected : " & Area.getInfectedPerc'Image);
      --Monitor.Print("Infected customers : " & infected_count'Image);
      --Monitor.Print("Total customers : " & total_customers'Image);
      Monitor.Print("Out of "& total_customers'Image &" customers, "& infected_count'Image & " got infected.");
      --exit;
   end Organizer;


begin
   --  Insert code here.
   null;
end Market;
