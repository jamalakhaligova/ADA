generic
   type Data is private;
   type Priority is (<>);
   with function "<"( A, B: Priority ) return Boolean is <>;
package PQueue_Type is

 type PQueue(Max : Integer) is private;

   -- first insert version: inserts so that it keeps ordered
   procedure Insert ( PQ : in out PQueue; P : in Priority; D : in Data );
   -- second insert version
   procedure Insert_2 ( PQ : in out PQueue; P : in Priority; D : in Data );
   procedure Get ( PQ : in PQueue; P : out Priority; D : out Data; Found : out Boolean );
   procedure Remove (PQ : in out PQueue; P : out Priority; D : out Data; Found : out boolean);
   function Size (PQ : PQueue) return integer;
   function "<"( A, B: PQueue ) return Boolean;
   function "+"( A, B: PQueue ) return  PQueue;
   generic
       with procedure Action (P : in Priority; D : in Data);
   procedure ForEach ( PQ : in out PQueue);
private
   type DataArr is array (Integer range <>) of Data;
   type PriorityArr is array (Integer range <>) of Priority;
   type PQueue(Max : Integer) is record
      D : DataArr(1..Max);
      P : PriorityArr(1..Max);
      S : Integer := 0;
   end record;
end PQueue_Type;
