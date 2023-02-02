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

with Ada.Text_IO;      use Ada.Text_IO;
with Euler_Int1_Tools; use Euler_Int1_Tools;

procedure P0006_Sum_Square_Difference is

   Σ_Of_Squares : constant Integer_Type := Sum_Squares (100);
   Square_Of_Σ  : constant Integer_Type := Sum_Sequence (100)**2;

   Answer : Integer_Type;

begin

   Answer := Square_Of_Σ - Σ_Of_Squares;

   Put_Line ("Answer:" & Answer'Image);

end P0006_Sum_Square_Difference;
