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

with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

with Euler_Tools; use Euler_Tools;

procedure P0004_Largest_Palindrome_Product is

   N1     : Integer_Type := 999;
   N2     : Integer_Type := 999;
   Answer : Integer_Type := 0;

begin

   loop
      Answer := N1 * N2;
      exit when Is_Palindrome (Answer);

      N1 := N1 - 1;
      if N1 = 900 then
         N2 := N2 - 1;
         N1 := N2;
      end if;
   end loop;

   Put_Line ("Answer:" & Answer'Image);
   Put_Line ("Info: N1 =" & N1'Image & ", N2 =" & N2'Image);
   Assert (Answer = 906_609, "Incorrect Answer");

end P0004_Largest_Palindrome_Product;
