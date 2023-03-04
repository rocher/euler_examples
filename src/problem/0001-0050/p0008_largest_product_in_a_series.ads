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
--                 https://projecteuler.net/problem=8
--
--  Largest product in a series
--  ---------------------------
--
--  The four adjacent digits in the 1000-digit number that have the greatest
--  product are 9 × 9 × 8 × 9 = 5832.
--
--  Find the thirteen adjacent digits in the 1000-digit number that have the
--  greatest product. What is the value of this product?
--
-------------------------------------------------------------------------------

with TUI_Interface; use TUI_Interface;

package P0008_Largest_Product_In_A_Series is

   type P0008_Type is new TUI_IFace with null record;

   overriding function Number (P : P0008_Type) return Natural is (8);

   overriding function Title (P : P0008_Type) return String is
     ("Largest product in a series");

   overriding function Brief (P : P0008_Type) return String is
     ("Find the thirteen adjacent digits in the 1000-digit number that " &
      "have the greatest product. What is the value of this product?");

   overriding function Answer (P : P0008_Type) return String;

   overriding function Notes (P : P0008_Type) return String is ("");
end P0008_Largest_Product_In_A_Series;
