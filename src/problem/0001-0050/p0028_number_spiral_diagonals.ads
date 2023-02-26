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
--                 https://projecteuler.net/problem=28
--
--  Number spiral diagonals
--  -----------------------
--
--  Starting with the number 1 and moving to the right in a clockwise
--  direction a 5 by 5 spiral is formed as follows:
--
--                 21 22 23 24 25
--                 20  7  8  9 10
--                 19  6  1  2 11
--                 18  5  4  3 12
--                 17 16 15 14 13
--
--  It can be verified that the sum of the numbers on the diagonals is 101.
--
--  What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
--  formed in the same way?
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0028_Number_Spiral_Diagonals is

   type P0028_Type is new Text_IFace with null record;

   overriding function Number (P : P0028_Type) return Natural is (28);

   overriding function Title (P : P0028_Type) return String is
     ("Number spiral diagonals");

   overriding function Brief (P : P0028_Type) return String is
     ("What is the sum of the numbers on the diagonals in a 1001 by 1001 " &
      "spiral formed in the same way?");

   overriding function Answer (P : P0028_Type) return String;

   overriding function Notes (P : P0028_Type) return String is ("");
end P0028_Number_Spiral_Diagonals;
