--
--  The following problem is take from Project Euler:
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

with Ada.Text_IO;

procedure P0009_Special_Pythagorean_Triplet is

   Answer : Natural;

begin

   main :
   for a in 3 .. 900 loop
      for b in a + 1 .. 900 loop
         if a**2 + b**2 = (1_000 - a - b)**2 then
            Answer := a * b * (1_000 - a - b);
            exit main;
         end if;
      end loop;
   end loop main;

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0009_Special_Pythagorean_Triplet;
