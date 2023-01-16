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
--                 https://projecteuler.net/problem=10
--
--  Summation of primes
--  -------------------
--
--  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
--
--  Find the sum of all the primes below two million.
--
-------------------------------------------------------------------------------

with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

with Euler_Int1_Tools; use Euler_Int1_Tools;

procedure P0010_Summation_Of_Primes is

   Answer : Integer_Type := 0;
   Prime  : Integer_Type := Prime_First;

begin

   loop
      Answer := @ + Prime;
      Prime  := Prime_Next;

      exit when Prime > 2_000_000;
   end loop;

   Put_Line ("Answer:" & Answer'Image);
   Assert (Answer = 142_913_828_922, "Incorrect Answer");

end P0010_Summation_Of_Primes;
