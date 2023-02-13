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
--                 https://projecteuler.net/problem=3
--
--  Largest prime factor
--  --------------------
--
--  The prime factors of 13195 are 5, 7, 13 and 29.

--  What is the largest prime factor of the number 600851475143?
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package P0003 is

   type P0003_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0003_Type) return Natural is (3);

   overriding function Get_Title (P : P0003_Type) return String is
     ("Largest primer factor");

   overriding function Get_Brief (P : P0003_Type) return String is
     ("What is the largest prime factor of the number 600851475143?");

   overriding function Get_Answer (P : P0003_Type) return String;

   overriding function Get_Notes (P : P0003_Type) return String is ("");
end P0003;
