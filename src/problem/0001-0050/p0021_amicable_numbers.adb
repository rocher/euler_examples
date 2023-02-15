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
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0021_Amicable_Numbers is

   Amicable_Counter : Natural := 0;

   overriding function Get_Answer (P : P0021_Type) return String is
      Answer : Integer_Type := 0;
   begin

      for A in 1 .. 9_998 loop
         for B in A + 1 .. 9_999 loop
            if Are_Amicable (A, B) then
               Answer           := @ + A + B;
               Amicable_Counter := @ + 1;
            end if;
         end loop;
      end loop;

      return To_String (Answer);
   end Get_Answer;

   overriding function Get_Notes (P : P0021_Type) return String is
     ("There are" & Amicable_Counter'Image & " amicable numbers < 1000.");

end P0021_Amicable_Numbers;
