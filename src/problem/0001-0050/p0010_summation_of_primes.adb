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

with Euler_Tools_Int1; use Euler_Tools_Int1;

package body P0010_Summation_Of_Primes is

   overriding function Answer (P : P0010_Type) return String is
      Answer : Integer_Type := 0;
      Prime  : Integer_Type := Prime_First;
   begin

      loop
         Answer := @ + Prime;
         Prime  := Prime_Next;

         exit when Prime > 2_000_000;
      end loop;

      return To_String (Answer);
   end Answer;

end P0010_Summation_Of_Primes;
