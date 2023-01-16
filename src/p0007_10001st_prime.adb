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
--                 https://projecteuler.net/problem=7
--
--  10001st prime
--  -------------
--
--  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
--  see that the 6th prime is 13.
--
--  What is the 10001st prime number?
--
-------------------------------------------------------------------------------

with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

with Euler_Tools; use Euler_Tools;

procedure P0007_10001st_Prime is

   Answer : Integer_Type;

begin

   Answer := Prime_Nth (10_001);

   Put_Line ("Answer:" & Answer'Image);
   Assert (Answer = 104_743, "Incorrect Answer");

end P0007_10001st_Prime;
