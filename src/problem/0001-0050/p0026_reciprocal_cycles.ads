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

with Text_Interface; use Text_Interface;

package P0026_Reciprocal_Cycles is

   type P0026_Type is new Text_IFace with null record;

   overriding function Get_Number (P : P0026_Type) return Natural is (26);

   overriding function Get_Title (P : P0026_Type) return String is
     ("Reciprocal cycles");

   overriding function Get_Brief (P : P0026_Type) return String is
     ("Find the value of d < 1000 for which 1/d contains the longest " &
      "recurring cycle in its decimal fraction part.");

   overriding function Get_Answer (P : P0026_Type) return String;

   overriding function Get_Notes (P : P0026_Type) return String;
end P0026_Reciprocal_Cycles;
