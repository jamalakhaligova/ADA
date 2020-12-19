package body Vector_package is

   function size(V: Vector) return Natural is
   begin
      return V.Index;

   end;
   function first(V: Vector) return Integer is
   begin
      return V.Data(1);
   end;
   function last(V: Vector) return Integer is
   begin
      return V.Data(V.Index);
   end;
   function is_Empty (V: Vector) return Boolean is
   begin
      return V.Index = 0;
   end;
   procedure insert(V: in out Vector; number: Integer) is
   begin
      if V.Index < V.Max then
         V.Index := V.Index + 1;
         V.Data(V.Index) := number;
      else
         New_Line;
         Put_Line("Can't insert anymore. Vector has reached max");
      end if;
   end insert;
   procedure assign(V: in out Vector; n, number: Integer ) is
   begin
      for I in 1..n loop
         if V.Index < V.Max then
            V.Index := V.Index +1;
            V.Data(V.Index) := number;
         else
            New_Line;
            Put_Line("Not possible to insert anymore. Vector reached max");
         end if;

      end loop;
   end;

   procedure pop(V: in out Vector) is
   begin
      V.Index := V.Index - 1;
   end;

   procedure remove(V: in out Vector; number: Integer; all_occurrences: Boolean:= False) is
      j : Natural := 0;
      count : Natural :=0;
      procedure swapels(a1,a2 : in out Integer) is
         tmp : Integer;
         begin
            tmp := a1;
            a1:= a2;
            a2 := tmp;
         end;
      begin
      if all_occurrences = True then

         for I in 1..V.Index loop
            if V.Data(I) /= number then
               j := j +1;
               V.Data(j) := V.Data(I);
            else
              count := count + 1;
            end if;
         end loop;
         V.Index := V.Index - count;
      else --all_occurences is False here
         for I in 1..V.Index loop
               if V.Data(I) = number then
                  swapels(V.Data(i),V.Data(Integer'Succ(i)));
               end if;
            end loop;
         V.Index := V.Index -1;
      end if;
     end;



   -- remove a number from the Vector, with all_occurrences False as default to remove first occurrence only, otherwise remove all occurrences
      procedure swap(V1, V2: in out Vector) is
      procedure swapels(a1,a2 : in out Integer) is
         tmp : Integer;
         begin
            tmp := a1;
            a1:= a2;
            a2 := tmp;
         end;
      begin
         if V1.Index = V2.Index then
            for i in 1..V1.Index loop
               swapels(V1.Data(i),V2.Data(i));
            end loop;
         elsif V1.Index > V2.Index then
            for i in 1.. V1.Index loop
               if i<= V2.Index then
                  swapels(V1.Data(i),V2.Data(i));
               else
                  V2.Index := V2.Index +1;
                  V2.Data(i) := V1.Data(i);
                  V1.Index := V1.Index -1;

               end if;
            end loop;

         elsif V2.Index > V1.Index then
            for i in 1.. V2.Index loop
               if i<= V1.Index then
                  swapels(V1.Data(i),V2.Data(i));
               else
                  V1.Index := V1.Index +1;
                  V1.Data(i) := V2.Data(i);
                  V2.Index := V2.Index -1;

               end if;
            end loop;

         end if;

      end;


      procedure join(V1, V2: in out Vector) is

      begin
         if V1.Index + V2.Index <= V1.Max then
            for I in 1..V2.Index loop
               V1.Index := V1.Index +1;
               V1.Data(V1.Index) := V2.Data(I);
             end loop;
         else
               New_Line;
               Put_Line("Join not possible, number of elements more than max");
         end if;
      end;

      function compare(V1, V2: Vector) return Boolean is
      allsame : Boolean :=True;

      function Max_Pos ( T: TArray ) return Positive is
         Mh: Positive := T'First;
      begin
         for I in T'Range loop
            if T(Mh) < T(I) then
               Mh := I;
            end if;
         end loop;
         return Mh;
      end;
      procedure Swap ( A, B: in out Integer ) is
         Tmp: Integer := A;
      begin
         A := B;
         B := Tmp;
      end;
      procedure Order ( T: in out Vector ) is
         Mh: Positive;
      begin
         for I in reverse 1..T.Index loop
            Mh := Max_Pos( T.Data(1..I) );
            Swap( T.Data(I), T.Data(Mh) );
         end loop;
      end;
      sortedV1 : Vector := V1;
      sortedV2 : Vector := V2;
      begin
      Order(sortedV1);
      Order(sortedV2);

      if sortedV1.Index = sortedV2.Index then
         for i in 1..sortedV1.Index loop
            if sortedV1.Data(i)=sortedV2.Data(i) and allsame then
               allsame := True;
            else
               allsame := False;
            end if;
         end loop;
      else
         return allsame = False;
      end if;
      return allsame;
      end;

      procedure copy(V: in out Vector; arr: TArray) is
   begin
      if V.Index + arr'Length<= V.Max then
         for i in 1..arr'Length loop
               V.Index:= V.Index+1;
               V.Data(V.Index) := arr(i);
         end loop;
      else
         New_Line;
         Put_Line("Can't copy. Vector's size is greater than max.");
      end if;
      end;

      procedure clear(V: in out Vector) is
      begin
         for i in 1..V.Index loop
            V.Data(i) := 0;
            pop(V);
      end loop;
      V.Index := 0;

      end;

      procedure print_Vector(V: in Vector) is
      begin
         Put("Data of vector: (");
         for i in 1..V.Index loop
         Ada.Integer_Text_IO.Put(Integer'(V.Data(i)));
         if i /= V.Index then
            Put(" ,");
         end if;
         end loop;
      Put("       )");
      end;



end Vector_package;
