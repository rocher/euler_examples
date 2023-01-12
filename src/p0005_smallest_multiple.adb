--
--  The following problem is take from Project Euler:
--
--                 https://projecteuler.net/problem=5
--
--  Smallest multiple
--  -----------------
--
--  2520 is the smallest number that can be divided by each of the numbers
--  from 1 to 10 without any remainder. What is the smallest positive number
--  that is evenly divisible by all of the numbers from 1 to 20?

with Ada.Text_IO;

procedure P0005_Smallest_Multiple is

   Answer    : Natural := 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 20;
   Divisible : Boolean;
   N         : Natural;

begin

   loop
      N         := 19;
      Divisible := True;
      loop
         Divisible := @ and then (Answer mod N = 0);
         exit when N = 2 or else not Divisible;
         N := N - 1;
      end loop;
      exit when Divisible;
      Answer := @ + 20;
   end loop;

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0005_Smallest_Multiple;
