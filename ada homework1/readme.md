ADA 1. Homework
----
Here is your first mandatory homework.

Create the Vector type and its operations. Place the Vector type in a package together with its operations. Represent the Vector in a limited record with discriminant. Define an array called TArray containing Integer numbers. Use the following specification; in a main.adb file test extensively every operation of the package.

```
package Vector_package is

   subtype Length is Positive range 1..1000;
   
   type Vector(Max: Length := 100) is limited private;
   type TArray is array(Positive range <>) of Integer;

   function size(V: Vector) return Natural; -- the size of a Vector
   function first(V: Vector) return Integer; -- first number from the Vector
   function last(V: Vector) return Integer; -- last number from the Vector
   function is_Empty (V: Vector) return Boolean; -- is Vector empty
   procedure insert(V: in out Vector; number: Integer); -- insert a number into the Vector
   procedure assign(V: in out Vector; n, number: Integer );  -- insert a number to the Vector n times
   procedure pop(V: in out Vector); -- remove a number from the Vector
   procedure remove(V: in out Vector; number: Integer; all_occurrences: Boolean:= False); -- remove a number from the Vector, with all_occurrences False as default to remove first occurrence only, otherwise remove all occurrences
   procedure swap(V1, V2: in out Vector); -- swap two Vectors
   procedure join(V1, V2: in out Vector); -- join two Vectors into the first
   function compare(V1, V2: Vector) return Boolean; -- compare if two Vectors have the same numbers
   procedure copy(V: in out Vector; arr: TArray); -- copy numbers from the array to the Vector
   procedure clear(V: in out Vector); -- clear the Vector and make it empty 
   procedure print_Vector(V: in Vector); -- prints the Vector

 private
...
```
