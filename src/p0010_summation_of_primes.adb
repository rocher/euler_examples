--
--  The following problem is take from Project Euler:
--
--                 https://projecteuler.net/problem=10
--
--  Summation of primes
--  -------------------
--
--  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17. Find the sum of all
--  the primes below two million.

with Ada.Text_IO;
with Euler_Tools;

procedure P0010_Summation_Of_Primes is

   package Natural_Tools is new Euler_Tools (Long_Integer);
   use Natural_Tools;

   Answer : Long_Integer := 0;
   Prime  : Long_Integer := Prime_First;

begin

   loop
      Answer := @ + Prime;
      Prime  := Prime_Next;

      exit when Prime > 2_000_000;
   end loop;

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0010_Summation_Of_Primes;
