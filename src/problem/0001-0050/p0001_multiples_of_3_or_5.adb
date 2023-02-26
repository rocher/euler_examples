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
--                 https://projecteuler.net/problem=1
--
--  Multiples of 3 or 5
--  -------------------
--
--  If we list all the natural numbers below 10 that are multiples of 3 or 5,
--  we get 3, 5, 6 and 9. The sum of these multiples is 23.
--
--  Find the sum of all the multiples of 3 or 5 below 1000.
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0001_Multiples_Of_3_Or_5 is

   overriding function Answer (P : P0001_Type) return String is
      Answer : Integer_Type;
   begin
      Answer :=
        Sum_Multiples (3, 1_000) + Sum_Multiples (5, 1_000) -
        Sum_Multiples (15, 1_000);

      return To_String (Answer);
   end Answer;

end P0001_Multiples_Of_3_Or_5;
