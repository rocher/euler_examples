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
--                 https://projecteuler.net/problem=16
--
--  Power digit sum
--  ---------------
--
--  2¹⁵ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
--
--  What is the sum of the digits of the number 2¹⁰⁰⁰?
--
-------------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with Euler_Tools; use Euler_Tools;

procedure T0016_Power_Digit_Sum is

   Power  : constant Big_Natural := 2**1_000;
   Str    : constant String      := To_String (Power);
   Answer : Natural              := 0;

begin

   for C of Str loop
      Answer := @ + To_Number (C);
   end loop;

   Put_Line ("Answer:" & Answer'Image);

end T0016_Power_Digit_Sum;
