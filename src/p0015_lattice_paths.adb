--
--  The following problem is take from Project Euler:
--
--                 https://projecteuler.net/problem=14
--
--  Lattice paths
--  -------------
--
--  Starting in the top left corner of a 2×2 grid, and only being able to
--  move to the right and down, there are exactly 6 routes to the bottom
--  right corner. How many such routes are there through a 20×20 grid?

with Ada.Text_IO;
with Euler_Tools;

procedure P0015_Lattice_Paths is

   package L3_Tools is new Euler_Tools (Long_Long_Long_Integer);
   use L3_Tools;

   Answer : Long_Long_Long_Integer;

begin

   Answer := Combination (40, 20);

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0015_Lattice_Paths;
