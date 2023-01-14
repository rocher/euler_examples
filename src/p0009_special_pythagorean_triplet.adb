--  ---------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=9
--
--  Special Pythagorean triplet
--  ---------------------------
--
--  A Pythagorean triplet is a set of three natural numbers, a < b < c, for
--  which,
--
--                 a² + b² = c²
--
--  For example, 3² + 4² = 9 + 16 = 25 = 5².
--
--  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
--  Find the product abc.
--
-------------------------------------------------------------------------------

with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

procedure P0009_Special_Pythagorean_Triplet is

   A, B   : Natural;
   Answer : Natural;

begin

   A := 3;

   Main_Loop :
   loop

      B := A + 1;

      loop

         if A**2 + B**2 = (1_000 - A - B)**2 then
            Answer := A * B * (1_000 - A - B);
            exit Main_Loop;
         end if;

         exit when B = 900;
         B := B + 1;
      end loop;

      A := A + 1;
   end loop Main_Loop;

   Put_Line ("Answer:" & Answer'Image);
   Put_Line
     ("Info: a =" & A'Image & ", b =" & B'Image & ", c =" &
      Natural'Image (1_000 - A - B));
   Put_Line
     ("      a² + b² =" & Natural'Image (A**2) & " +" & Natural'Image (B**2) &
      " =" & Natural'Image ((1_000 - A - B)**2) & " = c²");
   Assert (Answer = 31_875_000, "Incorrect Answer");

end P0009_Special_Pythagorean_Triplet;
