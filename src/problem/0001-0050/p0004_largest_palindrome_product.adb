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

with Euler_Tools; use Euler_Tools;

package body P0004_Largest_Palindrome_Product is

   N1 : Integer_Type := 999;
   N2 : Integer_Type := 999;

   overriding function Get_Answer (P : P0004_Type) return String is
      Answer : Integer_Type := 0;
   begin

      loop
         Answer := N1 * N2;
         exit when Is_Palindrome (Answer);

         N1 := N1 - 1;
         if N1 = 900 then  --  ! Intuition: N1 > 900, N2 > 900
            N2 := N2 - 1;
            N1 := N2;
         end if;
      end loop;

      return To_String (Answer);
   end Get_Answer;

   overriding function Get_Notes (P : P0004_Type) return String is
     ("The two 3-digit numbers are" & N1'Image & " and" & N2'Image);

end P0004_Largest_Palindrome_Product;
