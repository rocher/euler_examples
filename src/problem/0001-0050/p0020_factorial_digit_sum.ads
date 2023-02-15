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
--                 https://projecteuler.net/problem=20
--
--
--  Factorial digit sum
--
--  n! means n × (n − 1) × ... × 3 × 2 × 1
--
--  For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800, and the sum of the
--  digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
--
--  Find the sum of the digits in the number 100!
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package P0020_Factorial_Digit_Sum is

   type P0020_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0020_Type) return Natural is (20);

   overriding function Get_Title (P : P0020_Type) return String is
     ("Factorial digit sum");

   overriding function Get_Brief (P : P0020_Type) return String is
     ("Find the sum of the digits in the number 100!");

   overriding function Get_Answer (P : P0020_Type) return String;

   overriding function Get_Notes (P : P0020_Type) return String is ("");
end P0020_Factorial_Digit_Sum;
