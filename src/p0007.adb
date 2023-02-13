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

with Euler_Tools; use Euler_Tools;

package body P0007 is

   overriding function Get_Answer (P : P0007_Type) return String is
      Answer : Integer_Type;
   begin

      Answer := Prime_Nth (10_001);

      return To_String (Answer);
   end Get_Answer;

end P0007;
