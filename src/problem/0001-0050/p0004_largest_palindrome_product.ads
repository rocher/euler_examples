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
--                 https://projecteuler.net/problem=4
--
--  Largest palindrome product
--  --------------------------
--
--  A palindromic number reads the same both ways. The largest palindrome
--  made from the product of two 2-digit numbers is 9009 = 91 × 99.
--
--  Find the largest palindrome made from the product of two 3-digit numbers.
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0004_Largest_Palindrome_Product is

   type P0004_Type is new Text_IFace with null record;

   overriding function Number (P : P0004_Type) return Natural is (4);

   overriding function Title (P : P0004_Type) return String is
     ("Largest palindrome product");

   overriding function Brief (P : P0004_Type) return String is
     ("Find the largest palindrome made from the product of two " &
      "3-digit numbers.");

   overriding function Answer (P : P0004_Type) return String;

   overriding function Notes (P : P0004_Type) return String;
end P0004_Largest_Palindrome_Product;
