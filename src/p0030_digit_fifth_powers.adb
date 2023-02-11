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

with Ada.Text_IO; use Ada.Text_IO;
with Euler_Tools; use Euler_Tools;

procedure P0030_Digit_Fifth_Powers is

   P5 : constant array (0 .. 9) of Integer_Type := [for I in 0 .. 9 => I**5];

   Powers : Integer_Type;
   Answer : Integer_Type := 0;

begin

   for Number in 11 .. 999_999 loop
      Powers := 0;
      for I in 1 .. Length (Number) loop
         Powers := @ + P5 (Sub_Number (Number, I, 1));
      end loop;
      if Powers = Number then
         Answer := @ + Number;
      end if;
   end loop;

   Put_Line ("Answer:" & Answer'Image);

end P0030_Digit_Fifth_Powers;
