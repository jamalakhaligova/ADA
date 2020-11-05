with ada.Text_IO, PQueue_Type;
use ada.Text_IO;

procedure MainPQ is
   package IntegerPQueue is new PQueue_Type(Integer, Integer);

   procedure myaction (P, D: Integer) is
      begin
      Put_Line ("( " & Integer'Image(P) &" , "& Integer'Image(D) & " )");
   end myaction;

   procedure PQ_foreach is new IntegerPQueue.ForEach(myaction);

   use IntegerPQueue;

   S  : PQueue(10);
   S2  : PQueue(10);
   P, D : Integer;
   B    : Boolean;
begin

   Put_Line("First queue Size :" &  Integer'image(Size(S)));
   new_line;
   Put_Line("Second queue Size :" &  Integer'image(Size(S2)));
   new_line;

   Get(S2, P, D, B);
   if B then
   Put_Line("Second queue Get( state:" & Boolean'image(B) & ", Data:" & Integer'image(D) & "   priority :" & Integer'image(P) & ")"); 
   else
      Put_Line("Second queue Get ( state:" & Boolean'image(B) & " )  queue is empty" );
   end if;
   new_line;

   Remove(S, P, D, B);
   if B then
      Put_Line("First queue Remove( state:" & Boolean'image(B) & ", Data:" & Integer'image(D) & "   priority :" & Integer'image(P) & ")"); 
   else
      Put_Line("First queue Remove ( state:" & Boolean'image(B) & " )  queue is empty" );
   end if;
   new_line;

   Put_Line("Insert (8,1), (5,1) in first queue");
   Insert_2(S, 8, 1);
   Insert(S, 5, 1);
   Put_Line("First queue Size :" &  Integer'image(Size(S)));
   new_line;

   Put_Line("Insert (41,3), (3,4) in first queue");
   Insert_2(S, 41, 3);
   Insert(S, 3, 4);
   Put_Line("First queue:"); PQ_foreach(S);
   new_line;

   Put_Line("Insert (16,11), (42,31), (58,21) in second queue");
   Insert_2(S2, 16, 11);
   Insert(S2, 42, 31);
   Insert_2(S2, 58, 21);

   Put_Line("Second queue Size :" &  Integer'image(Size(S2)));
   new_line;

   Put_Line("Insert (5,1), (31,4) in second queue");
   Insert(S2, 5, 1);
   Insert_2(S2, 31, 4);
   Put_Line("Second queue:"); PQ_foreach(S2);
   new_line;

   Get(S2, P, D, B);
   if B then
   Put_Line("Second queue Get( state:" & Boolean'image(B) & ", Data:" & Integer'image(D) & "   priority :" & Integer'image(P) & ")"); 
   else
      Put_Line("Second queue Get ( state:" & Boolean'image(B) & " )  queue is empty" );
   end if;
   new_line;

   Put_Line("Second queue Size :" &  Integer'image(Size(S2)));
   new_line;

   Remove(S2, P, D, B);
   Put_Line("Second queue Remove( state:" & Boolean'image(B) & ", Data:" & Integer'image(D) & "   priority :" & Integer'image(P) & ")"); 
   new_line;

   Put_Line("Second queue:"); PQ_foreach(S2);
   new_line;

   Put_Line("Second queue Size :" &  Integer'image(Size(S2)));
   new_line;

   Put_Line("Compair");
   Put_Line("First smaller than second:" & Boolean'Image(S < S2));
   new_line;

   Put_Line("Compair");
   Put_Line("Second smaller than first:" & Boolean'Image(S2 < S));
   new_line;

   Put_Line("Union ( first = first + second ):");
   S := S + S2;
   PQ_foreach(S);
   new_line;

   Put_Line("Insert (1,1), (50,3) in first queue");
   Insert_2(S, 1, 1);
   Insert(S, 50, 3);
   new_line;

   Put_Line("First queue:"); PQ_foreach(S);
   new_line;

   Put_Line("Compair");
   Put_Line("First smaller than second: " & Boolean'Image(S < S2));
   new_line;

   Put_Line("Union ( second = first + second ):");
   S2 := S + S2;
   PQ_foreach(S2);
   new_line;

   Get(S2, P, D, B);
   if B then
   Put_Line("Second queue Get( state:" & Boolean'image(B) & ", Data:" & Integer'image(D) & "   priority :" & Integer'image(P) & ")"); 
   else
      Put_Line("Second queue Get ( state:" & Boolean'image(B) & " )  queue is empty" );
   end if;
   new_line;


   Remove(S2, P, D, B);
   if B then
      Put_Line("Second queue Remove( state:" & Boolean'image(B) & ", Data:" & Integer'image(D) & "   priority :" & Integer'image(P) & ")"); 
   else
      Put_Line("Second queue Remove ( state:" & Boolean'image(B) & " )  queue is empty" );
   end if;
   new_line;

   Get(S2, P, D, B);
   if B then
   Put_Line("Second queue Get( state:" & Boolean'image(B) & ", Data:" & Integer'image(D) & "   priority :" & Integer'image(P) & ")"); 
   else
      Put_Line("Second queue Get ( state:" & Boolean'image(B) & " )  queue is empty" );
   end if;
   new_line;

   Put_Line("Second queue:"); PQ_foreach(S);
   new_line;
end MainPQ;
