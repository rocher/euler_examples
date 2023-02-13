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
--  natural numbers and the square of the sum is 3025 - 385 = 2640.
--
--  Find the difference between the sum of the squares of the first one
--  hundred natural numbers and the square of the sum.
--
-------------------------------------------------------------------------------

with Euler_Int1_Tools; use Euler_Int1_Tools;

package body P0006 is

   overriding function Get_Answer (P : P0006_Type) return String is
      Σ_Of_Squares : constant Integer_Type := Sum_Squares (100);
      Square_Of_Σ  : constant Integer_Type := Sum_Sequence (100)**2;
      Answer       : Integer_Type;
   begin

      Answer := Square_Of_Σ - Σ_Of_Squares;

      return To_String (Answer);
   end Get_Answer;

end P0006;
