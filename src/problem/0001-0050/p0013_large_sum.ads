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
--                 https://projecteuler.net/problem=13
--
--  Large sum
--  ---------
--
--  Work out the first ten digits of the sum of the following one-hundred
--  50-digit numbers.
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package P0013_Large_Sum is

   type P0013_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0013_Type) return Natural is (13);

   overriding function Get_Title (P : P0013_Type) return String is
     ("Large sum");

   overriding function Get_Brief (P : P0013_Type) return String is
     ("Work out the first ten digits of the sum of the following " &
      "one-hundred 50-digit numbers.");

   overriding function Get_Answer (P : P0013_Type) return String;

   overriding function Get_Notes (P : P0013_Type) return String is
     ("List of numbers attached in the problem description.");
end P0013_Large_Sum;
