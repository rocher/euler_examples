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
--                 https://projecteuler.net/problem=16
--
--  Power digit sum
--  ---------------
--
--  2¹⁵ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
--
--  What is the sum of the digits of the number 2¹⁰⁰⁰?
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package P0016_Power_Digit_Sum is

   type P0016_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0016_Type) return Natural is (16);

   overriding function Get_Title (P : P0016_Type) return String is
     ("Power digit sum");

   overriding function Get_Brief (P : P0016_Type) return String is
     ("What is the sum of the digits of the number 2^1000?");

   overriding function Get_Answer (P : P0016_Type) return String;

   overriding function Get_Notes (P : P0016_Type) return String is ("");
end P0016_Power_Digit_Sum;
