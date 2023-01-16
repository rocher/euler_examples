--  ---------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=21
--
--  Amicable numbers
--  ----------------
--
--  Let d(n) be defined as the sum of proper divisors of n (numbers less than
--  n which divide evenly into n). If d(a) = b and d(b) = a, where a ≠ b,
--  then a and b are an amicable pair and each of a and b are called amicable
--  numbers.
--
--  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22,
--  44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1,
--  2, 4, 71 and 142; so d(284) = 220.
--
--  Evaluate the sum of all the amicable numbers under 10000.
-------------------------------------------------------------------------------

with Text_IO;     use Text_IO;
with Euler_Tools; use Euler_Tools;

procedure P0021_Amicable_Numbers is

   D_A, D_B : Integer_Type;

   Answer : Integer_Type := 0;

begin

   for A in 1 .. 9_998 loop
      for B in A + 1 .. 9_999 loop
         D_A := Sum (Divisors (A, True));
         D_B := Sum (Divisors (B, True));
         if D_A = B and then D_B = A then
            Answer := @ + A + B;
         end if;
      end loop;
   end loop;

   Put_Line ("Answer:" & Answer'Image);

end P0021_Amicable_Numbers;
