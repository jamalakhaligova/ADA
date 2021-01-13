with Ada.Text_IO,Ada.Numerics.Float_Random, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;
procedure CovidHos is
   use Ada.Numerics.Float_Random;
   package Random_Dur is new Ada.Numerics.Discrete_Random(Positive);

   G : Generator; --float generator
   IntG : Random_Dur.Generator; --integer generator

   protected Print is
      procedure Write(s:String);
   end Print;

   protected body Print is
      procedure Write(s:String) is
      begin
         Put_Line(s);
      end Write;
   end Print;

   task type Hospital is
      entry Open(hour : Float);
      entry GoIn;
      entry Close;
   end Hospital;

   task body Hospital is
    open_now : Boolean := false;
      cnt : Natural := 0;
   begin
      accept Open (hour : in Float) do
         open_now := true;
      end Open;
        while open_now loop
            delay 0.1; --allows patient enter each min
            select
                accept GoIn  do
                    cnt := cnt + 1;
                    delay 0.1; --allows patient enter each min
                end GoIn;
            or
                accept Close do
                    open_now := false;
                    Print.Write("Hospital were visited by " & cnt'Image);
                end Close;
            end select;
        end loop;
   end Hospital;

   type Hospital_Access is access Hospital;
   hospitalArr : array(1..3) of Hospital_Access;

   type Pstr is access String;

   task type Patient( Name:  Pstr);

   type Patient_Access is access Patient;

   task body Patient is
      --choose random hospital,arrive 10 sec later, enter and print name hosp num, if not open try in 5 sec again, else go home print name cant go hosp.
   rand1 : Positive;
   begin
      Random_Dur.Reset(IntG);
      rand1 := (Random_Dur.random(IntG) rem 3) + 1;
      delay 1.0; -- arrives 10 mins later
      for i in 1..2 loop
         select
            hospitalArr(rand1).GoIn;
            Print.Write(name.all & " visits hospital number " & rand1'Image);
         or
            delay 0.5; --after 5 mins tries once again
         end select;
      end loop;
      Print.Write(name.all & " couldnt visit hospital ");
   end Patient;

   H : Hospital_Access := new Hospital;

   patientArr : array(1..20) of Patient_Access;
begin
   Reset(G);
   for i in 1..20 loop
      patientArr(i) := new Patient(new String'("P"& i'Image));
   end loop;


   for i in 1..3 loop
      hospitalArr(i) := new Hospital;
      hospitalArr(i).Open(Random(G));
        delay 0.2; --hospitals opening at 2 mins intervals
    end loop;
    delay 1.0; -- after 10mins all hospitals close
    for i in 1..3 loop
        hospitalArr(i).Close;
    end loop;

end CovidHos;
