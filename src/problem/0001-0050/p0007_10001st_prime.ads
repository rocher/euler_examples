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
--                 https://projecteuler.net/problem=7
--
--  10001st prime
--  -------------
--
--  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
--  see that the 6th prime is 13.
--
--  What is the 10001st prime number?
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0007_10001st_prime is

   type P0007_Type is new Text_IFace with null record;

   overriding function Get_Number (P : P0007_Type) return Natural is (7);

   overriding function Get_Title (P : P0007_Type) return String is
     ("10001st prime");

   overriding function Get_Brief (P : P0007_Type) return String is
     ("What is the 10001st prime number?");

   overriding function Get_Answer (P : P0007_Type) return String;

   overriding function Get_Notes (P : P0007_Type) return String is ("");
end P0007_10001st_prime;
