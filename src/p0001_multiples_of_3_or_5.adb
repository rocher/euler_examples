--
--  The following problem is take from Project Euler:
--
--                 https://projecteuler.net/problem=1
--
--  Multiples of 3 or 5
--  -------------------
--
--  If we list all the natural numbers below 10 that are multiples of 3 or 5,
--  we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of
--  all the multiples of 3 or 5 below 1000.

with Ada.Text_IO;
with Euler_Tools;

procedure P0001_Multiples_Of_3_Or_5 is

   package Natural_Tools is new Euler_Tools (Natural);
   use Natural_Tools;

   Answer : Natural;

begin

   Answer :=
     Sum_Multiples (3, 1_000) + Sum_Multiples (5, 1_000) -
     Sum_Multiples (15, 1_000);

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0001_Multiples_Of_3_Or_5;
