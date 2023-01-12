--
--  The following problem is take from Project Euler:
--
--                 https://projecteuler.net/problem=3
--
--  Largest prime factor
--  --------------------
--
--  The prime factors of 13195 are 5, 7, 13 and 29. What is the largest prime
--  factor of the number 600851475143 ?

with Ada.Text_IO;
with Euler_Tools;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure P0003_Largest_Prime_Factor is

   package Big_Natural_Tools is new Euler_Tools (Long_Integer);
   use Big_Natural_Tools;

   Number : constant Long_Integer := 600_851_475_143;
   Answer : Long_Integer          := Long_Integer (Sqrt (Float (Number)));

begin

   loop
      exit when Number mod Answer = 0 and then Is_Prime (Answer);
      Answer := @ - 1;
   end loop;

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0003_Largest_Prime_Factor;
