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
--                 https://projecteuler.net/problem=26
--
--  Reciprocal cycles
--  -----------------
--
--  A unit fraction contains 1 in the numerator. The decimal representation
--  of the unit fractions with denominators 2 to 10 are given:
--
--                 1/2  = 0.5
--                 1/3  = 0.(3)
--                 1/4  = 0.25
--                 1/5  = 0.2
--                 1/6  = 0.1(6)
--                 1/7  = 0.(142857)
--                 1/8  = 0.125
--                 1/9  = 0.(1)
--                 1/10 = 0.1
--
--  Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can
--  be seen that 1/7 has a 6-digit recurring cycle.
--
--  Find the value of d < 1000 for which 1/d contains the longest recurring
--  cycle in its decimal fraction part.
--
-------------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Euler_Tools; use Euler_Tools;

procedure P0026_Reciprocal_Cycles is

   DDiv         : Decimal_Division_Type;
   Decimals     : Natural;
   Cycle_Length : Natural;
   Max_Length   : Natural := 0;
   Answer       : Natural;

begin

   for N in 2 .. 999 loop
      Decimals := 100;
      loop
         DDiv := Decimal_Division (1, N, Decimals);
         exit when DDiv.Cycle > 0 or else DDiv.Remainders.Last_Element = 0;
         Decimals := @ + 100;
      end loop;

      Cycle_Length := Length (DDiv.Decimals) + 1 - DDiv.Cycle;
      if Cycle_Length > Max_Length then
         Max_Length := Cycle_Length;
         Answer     := N;
      end if;
   end loop;

   Put_Line ("Answer:" & Answer'Image);

end P0026_Reciprocal_Cycles;
