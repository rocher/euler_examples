--
--  The following problem is take from Project Euler:
--
--                 https://projecteuler.net/problem=4
--
--  Largest palindrome product
--  --------------------------
--
--  A palindromic number reads the same both ways. The largest palindrome
--  made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the
--  largest palindrome made from the product of two 3-digit numbers.

with Ada.Text_IO;
with Euler_Tools;

procedure P0004_Largest_Palindrome_Product is

   package Natural_Tools is new Euler_Tools (Natural);
   use Natural_Tools;

   N1     : Natural := 999;
   N2     : Natural := 999;
   Answer : Natural := 0;

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

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0004_Largest_Palindrome_Product;
