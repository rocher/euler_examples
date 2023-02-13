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
--                 https://projecteuler.net/problem=5
--
--  Smallest multiple
--  -----------------
--
--  2520 is the smallest number that can be divided by each of the numbers
--  from 1 to 10 without any remainder.
--
--  What is the smallest positive number that is evenly divisible by all of
--  the numbers from 1 to 20?
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0005 is

   overriding function Get_Answer (P : P0005_Type) return String is
      Answer       : Integer_Type := 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 20;
      Factor       : Integer_Type;
      Is_Divisible : Boolean;
   begin

      loop
         Factor       := 19;
         Is_Divisible := True;

         loop
            Is_Divisible := Is_Divisor (Answer, Factor);

            exit when Factor = 2 or else not Is_Divisor (Answer, Factor);
            Factor := @ - 1;
         end loop;

         exit when Is_Divisible;
         Answer := @ + 20;
      end loop;

      return To_String (Answer);
   end Get_Answer;

end P0005;
