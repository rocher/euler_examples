--
--  The following problem is take from Project Euler:
--
--                 https://projecteuler.net/problem=6
--
--  Sum square difference
--  ---------------------
--
--  The sum of the squares of the first ten natural numbers is,
--
--                 1² + 2² +...+ 10² = 385
--
--  The square of the sum of the first ten natural numbers is,
--
--                 (1 + 2 +...+ 10)² = 3025
--
--  Hence the difference between the sum of the squares of the first ten
--  natural numbers and the square of the sum is 3025 - 385 = 2640. Find the
--  difference between the sum of the squares of the first one hundred
--  natural numbers and the square of the sum.

with Ada.Text_IO;
with Euler_Tools;

procedure P0006_Sum_Square_Difference is

   package Long_Natural_Tools is new Euler_Tools (Long_Integer);
   use Long_Natural_Tools;

   Σ_Squares : constant Long_Integer := Sum_Squares (100);
   Squared_Σ : constant Long_Integer := Sum_Sequence (100)**2;

   Answer : Long_Integer;

begin

   Answer := Squared_Σ - Σ_Squares;

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0006_Sum_Square_Difference;
