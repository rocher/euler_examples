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

with Problem_Interface; use Problem_Interface;

package P0006_Sum_Square_Difference is

   type P0006_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0006_Type) return Natural is (6);

   overriding function Get_Title (P : P0006_Type) return String is
     ("Sum square difference");

   overriding function Get_Brief (P : P0006_Type) return String is
     ("Find the difference between the sum of the squares of the first one " &
      "hundred natural numbers and the square of the sum.");

   overriding function Get_Answer (P : P0006_Type) return String;

   overriding function Get_Notes (P : P0006_Type) return String is ("");
end P0006_Sum_Square_Difference;
