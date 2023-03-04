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

with TUI_Interface; use TUI_Interface;

package P0010_Summation_Of_Primes is

   type P0010_Type is new TUI_IFace with null record;

   overriding function Number (P : P0010_Type) return Natural is (10);

   overriding function Title (P : P0010_Type) return String is
     ("Sum of primes");

   overriding function Brief (P : P0010_Type) return String is
     ("Find the sum of all the primes below two million.");

   overriding function Answer (P : P0010_Type) return String;

   overriding function Notes (P : P0010_Type) return String is ("");
end P0010_Summation_Of_Primes;
