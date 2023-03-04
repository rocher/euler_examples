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
--                 https://projecteuler.net/problem=1
--
--  Multiples of 3 or 5
--  -------------------
--
--  If we list all the natural numbers below 10 that are multiples of 3 or 5,
--  we get 3, 5, 6 and 9. The sum of these multiples is 23.
--
--  Find the sum of all the multiples of 3 or 5 below 1000.
--
-------------------------------------------------------------------------------

with TUI_Interface; use TUI_Interface;

package P0001_Multiples_Of_3_Or_5 is

   type P0001_Type is new TUI_IFace with null record;

   overriding function Number (P : P0001_Type) return Natural is (1);

   overriding function Title (P : P0001_Type) return String is
     ("Multiples of 3 or 5");

   overriding function Brief (P : P0001_Type) return String is
     ("Find the sum of all the multiples of 3 or 5 below 1000.");

   overriding function Answer (P : P0001_Type) return String;

   overriding function Notes (P : P0001_Type) return String is ("");
end P0001_Multiples_Of_3_Or_5;
