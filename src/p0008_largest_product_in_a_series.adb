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

with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

with Euler_Int1_Tools; use Euler_Int1_Tools;

procedure P0008_Largest_Product_In_A_Series is

   Series : constant String :=
     "7316717653133062491922511967442657474235534919493496983520312774506326" &
     "2395783180169848018694788518438586156078911294949545950173795833195285" &
     "3208805511125406987471585238630507156932909632952274430435576689664895" &
     "0445244523161731856403098711121722383113622298934233803081353362766142" &
     "8280644448664523874930358907296290491560440772390713810515859307960866" &
     "7017242712188399879790879227492190169972088809377665727333001053367881" &
     "2202354218097512545405947522435258490771167055601360483958644670632441" &
     "5722155397536978179778461740649551492908625693219784686224828397224137" &
     "5657056057490261407972968652414535100474821663704844031998900088952434" &
     "5065854122758866688116427171479924442928230863465674813919123162824586" &
     "1786645835912456652947654568284891288314260769004224219022671055626321" &
     "1111093705442175069416589604080719840385096245544436298123098787992724" &
     "4284909188845801561660979191338754992005240636899125607176060588611646" &
     "7109405077541002256983155200055935729725716362695618826704282524836008" &
     "23257530420752963450";

   Product : Integer_Type;
   Answer  : Integer_Type := 0;

begin

   for I in Series'First .. Series'Last - 12 loop

      Product := 1;
      for C of Series (I .. I + 12) loop
         Product := @ * To_Number (C);
      end loop;
      Answer := Integer_Type'Max (@, Product);

   end loop;

   Put_Line ("Answer:" & Answer'Image);
   Assert (Answer = 23_514_624_000, "Incorrect Answer");

end P0008_Largest_Product_In_A_Series;
