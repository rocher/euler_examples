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

with TUI_Interface; use TUI_Interface;

package P0003_Largest_Prime_Factor is

   type P0003_Type is new TUI_IFace with null record;

   overriding function Number (P : P0003_Type) return Natural is (3);

   overriding function Title (P : P0003_Type) return String is
     ("Largest primer factor");

   overriding function Brief (P : P0003_Type) return String is
     ("What is the largest prime factor of the number 600851475143?");

   overriding function Answer (P : P0003_Type) return String;

   overriding function Notes (P : P0003_Type) return String is ("");
end P0003_Largest_Prime_Factor;
