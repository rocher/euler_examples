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
--                 https://projecteuler.net/problem=30
--
--  Digit fifth powers
--  ------------------
--
--  Surprisingly there are only three numbers that can be written as the sum
--  of fourth powers of their digits:
--
--                 1634 = 1⁴ + 6⁴ + 3⁴ + 4⁴
--                 8208 = 8⁴ + 2⁴ + 0⁴ + 8⁴
--                 9474 = 9⁴ + 4⁴ + 7⁴ + 4⁴
--
--  As 1 = 14 is not a sum it is not included.
--
--  The sum of these numbers is 1634 + 8208 + 9474 = 19316.
--
--  Find the sum of all the numbers that can be written as the sum of fifth
--  powers of their digits.
--
-------------------------------------------------------------------------------

with TUI_Interface; use TUI_Interface;

package P0030_Digit_Fifth_Powers is

   type P0030_Type is new TUI_IFace with null record;

   overriding function Number (P : P0030_Type) return Natural is (30);

   overriding function Title (P : P0030_Type) return String is
     ("Digit fifth powers");

   overriding function Brief (P : P0030_Type) return String is
     ("Find the sum of all the numbers that can be written as the sum of " &
      "fifth powers of their digits.");

   overriding function Answer (P : P0030_Type) return String;

   overriding function Notes (P : P0030_Type) return String;
end P0030_Digit_Fifth_Powers;
