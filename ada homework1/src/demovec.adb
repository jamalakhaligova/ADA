with Vector_package, Ada.Integer_Text_IO,Ada.Text_IO; use Vector_package, Ada.Text_IO;
procedure DemoVec is


   V: Vector(5);
   V2: Vector(5);
   Arr : TArray := (1,8);

begin
   insert(V,2);
   insert(V,5);

   insert(V2,5);
   insert(V2,2);
   --assign(V2,3,7);
   if (compare(V,V2)=True) then
      Put_Line("They have same numbers");
   else
      Put_Line("Not same numbers");  -- my sample not same (2,5) and (2,5,7,7,7)
   end if;

   print_Vector(V); -- (2,5)
   New_Line;
   New_Line;
   print_Vector(V2); -- (2,5,7,7,7)
   New_Line;
   New_Line;

   if (compare(V,V2)=True) then
      Put_Line("They are same");
   else
      Put_Line("Not same");  -- my sample not same (2,5) and (2,5,7,7,7)
   end if;

   swap(V,V2);
   New_Line;
   New_Line;
   print_Vector(V); --(2,5,7,7,7)
   New_Line;
   New_Line;
   print_Vector(V2); -- (2,5)
   remove(V,7,all_occurrences => True); --(2,5); it was (2,5,7,7,7) before
   join(V,V2); -- (2,5) and (2,5) --> (2,5,2,5)
   New_Line;
   New_Line;
   print_Vector(V); --(2,5,2,5) works correctly
   copy(V2,Arr); --V2: (2,5) ; Arr: (1,8) -> expected : (2,5,1,8)
   New_Line;
   New_Line;
   print_Vector(V2); -- (2,5,1,8) works correctly.
   remove(V2,8,all_occurrences => False); -- -> expected output: (2,5,1)
   New_Line;
   New_Line;
   print_Vector(V2); -- (2,5,1) works correctly
   New_Line;
   New_Line;
   Ada.Integer_Text_IO.Put(size(V)); -- 4 (2,5,2,5)
   New_Line;
   Ada.Integer_Text_IO.Put(first(V)); --2
   New_Line;
   Ada.Integer_Text_IO.Put(last(V)); -- 5
   New_Line;
   if(is_Empty(V)) then Put_Line("It is empty"); else Put_Line("Not empty"); end if;  -- V:(2,5,2,5) -> expected Not empty
   clear(V); -- testing clear.
   New_Line;
   if(is_Empty(V)) then Put_Line("It is empty"); else Put_Line("Not empty"); end if; -- It is empty, clear works correctly.


end DemoVec;
