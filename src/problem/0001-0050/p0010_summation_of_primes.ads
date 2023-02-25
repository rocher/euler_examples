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
--                 https://projecteuler.net/problem=10
--
--  Summation of primes
--  -------------------
--
--  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
--
--  Find the sum of all the primes below two million.
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0010_Summation_Of_Primes is

   type P0010_Type is new Text_IFace with null record;

   overriding function Get_Number (P : P0010_Type) return Natural is (10);

   overriding function Get_Title (P : P0010_Type) return String is
     ("Sum of primes");

   overriding function Get_Brief (P : P0010_Type) return String is
     ("Find the sum of all the primes below two million.");

   overriding function Get_Answer (P : P0010_Type) return String;

   overriding function Get_Notes (P : P0010_Type) return String is ("");
end P0010_Summation_Of_Primes;
