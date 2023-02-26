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

with Text_Interface; use Text_Interface;

package P0005_Smallest_Multiple is

   type P0005_Type is new Text_IFace with null record;

   overriding function Number (P : P0005_Type) return Natural is (5);

   overriding function Title (P : P0005_Type) return String is
     ("Smallest multiple");

   overriding function Brief (P : P0005_Type) return String is
     ("What is the smallest positive number that is evenly divisible by " &
      "all of the numbers from 1 to 20?");

   overriding function Answer (P : P0005_Type) return String;

   overriding function Notes (P : P0005_Type) return String is ("");
end P0005_Smallest_Multiple;
