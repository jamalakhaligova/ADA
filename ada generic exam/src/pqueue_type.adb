with Ada.Text_IO; use Ada.Text_IO;

package body PQueue_Type is



-----------------------------------------------------------
   --  First approach (insert at the right position so no need to sort)
   procedure Insert( PQ : in out PQueue; P : in Priority; D : in Data ) is
      i : Integer;
      b : Boolean := false;
   begin
      if PQ.S = PQ.Max then
         Put_Line("queue full");
      end if;
      i := PQ.S+1;
      while not b loop
         if i = 1 then
            PQ.P(i) := P;
            PQ.D(i) := D;
            b := true;
         elsif PQ.P(i - 1) < P then
            PQ.P(i) := PQ.P(i - 1);
            PQ.D(i) := PQ.D(i - 1);
         else
            PQ.P(i) := P;
            PQ.D(i) := D;
            b := true;
         end if;
         i := i - 1;
      end loop;
      PQ.S := PQ.S + 1;
   end;


-----------------------------------------------------------
   -- Second approach (insert and then sort) 
   procedure Swap ( PQ : in out PQueue; i,j:Integer) is
    Tmp_data: Data := PQ.D(i);
    Tmp_priority: Priority := PQ.P(i);
      begin
    PQ.D(i) := PQ.D(j);
    PQ.P(i) := PQ.P(j);
    PQ.D(j) := Tmp_data;
    PQ.P(j) := Tmp_priority;
   end ;

   function min_priority( PQ : in PQueue; j:Integer) return Integer is
      max_ind: Integer:= 1;
   begin
      for i in 1..j loop
         if PQ.P(max_ind) > PQ.P(I) then 
            max_ind:=I;
         end if;
      end loop;
      return max_ind;
   end ;

   procedure Insert_2 ( PQ : in out PQueue; P : in Priority; D : in Data ) is
   tmp_index:Integer;
   begin
      PQ.S := PQ.S + 1;
      PQ.D(PQ.S) := D;
      PQ.P(PQ.S) := P;

      for I in reverse 1..PQ.S loop
         tmp_index := min_priority( PQ , I);
         Swap( PQ, tmp_index, i);
      end loop;
   end;
-----------------------------------------------------------


   procedure Get ( PQ : in PQueue; P : out Priority; D : out Data; Found : out Boolean ) is
   begin
      if PQ.S > 0 then
         P := PQ.P(1);
         D := PQ.D(1);
         Found := True;
      else
         Found:=False;
      end if;
   end;


   function Size (PQ : PQueue) return integer is
   begin
      return PQ.S;
   end;

   procedure Remove (PQ : in out PQueue; P : out Priority; D : out Data; Found : out boolean) is
   begin
      if PQ.S > 0 then
         P := PQ.P(1);
         D := PQ.D(1);
         Found := True;
      else
         Found:=False;
      end if;

      if Found then
         PQ.S := PQ.S - 1;
         for i in 1.. PQ.S loop
            PQ.D(i) := PQ.D(i + 1);
            PQ.P(i) := PQ.P(i + 1);
         end loop;
      end if;
   end;


   function "<"( A, B: PQueue ) return Boolean is
      P1, P2 : Priority;
      D1, D2 : Data;
      B1, B2 : Boolean;
   begin
      Get(A, P1, D1, B1);
      Get(B, P2, D2, B2);
      if B1 and B2 then
         return P1 < P2;
      else
           Put_Line("one queue empty"); return False;
      end if;
   end;


   function Contains(PQ : in PQueue; P : in Priority; D : in Data) return boolean is
   begin
      for i in 1 .. PQ.S loop
         if (PQ.D(i) = D and PQ.P(i) = P) then
            return true;
         end if;
      end loop;
      return false;
   end;



   function "+"( A, B: PQueue ) return  PQueue is
      C : PQueue := A;
      E : PQueue := B;
      P : Priority;
      D : Data;
      F : Boolean;
   begin
      Remove(E,P,D,F);
      while F loop
         if not Contains(C, P, D) then
            Insert(C, P, D);
         end if;

         Remove(E,P,D,F);
      end loop;

      return C;
   end;


   procedure ForEach ( PQ : in out PQueue) is
   begin
       for i in 1 .. PQ.S loop
         Action (PQ.P(i), PQ.D(i));
      end loop;
   end;

end PQueue_Type;
