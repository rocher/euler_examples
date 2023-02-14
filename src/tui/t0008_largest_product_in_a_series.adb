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

with P0008; use P0008;
with TUI_Runner;

procedure T0008_Largest_Product_In_A_Series is
   P0008 : P0008_Type;
begin
   TUI_Runner.Main (P0008);
end T0008_Largest_Product_In_A_Series;
