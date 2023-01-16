-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=3
--
--  Largest prime factor
--  --------------------
--
--  The prime factors of 13195 are 5, 7, 13 and 29.

--  What is the largest prime factor of the number 600851475143?
--
-------------------------------------------------------------------------------

with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

with Euler_Int2_Tools; use Euler_Int2_Tools;

procedure P0003_Largest_Prime_Factor is

   Number : constant Integer_Type := 600_851_475_143;

   Answer : Integer_Type := Square_Root (Number);

begin

   loop
      exit when Is_Divisor (Number, Answer) and then Is_Prime (Answer);
      Answer := @ - 1;
   end loop;

   Put_Line ("Answer:" & Answer'Image);
   Assert (Answer = 6_857, "Incorrect Answer");

end P0003_Largest_Prime_Factor;
