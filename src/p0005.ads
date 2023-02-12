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

with Problem_Interface; use Problem_Interface;

package P0005 is

   type P0005_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0005_Type) return Natural is (5);

   overriding function Get_Title (P : P0005_Type) return String is
     ("Smallest multiple");

   overriding function Get_Brief (P : P0005_Type) return String is
     ("Find the smallest positive number evenly divisible by 1..20.");

   overriding function Get_Answer (P : P0005_Type) return String;

   overriding function Get_Notes (P : P0005_Type) return String is ("");
end P0005;
