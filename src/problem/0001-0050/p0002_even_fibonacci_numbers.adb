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
--                 https://projecteuler.net/problem=2
--
--  Even Fibonacci numbers
--  ----------------------
--
--  Each new term in the Fibonacci sequence is generated by adding the
--  previous two terms. By starting with 1 and 2, the first 10 terms will be:
--
--                 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
--
--  By considering the terms in the Fibonacci sequence whose values do not
--  exceed four million, find the sum of the even-valued terms.
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0002_Even_Fibonacci_Numbers is

   overriding function Get_Answer (P : P0002_Type) return String is
      Number : Integer_Type := Fibonacci_Start;
      Answer : Integer_Type := 0;
   begin

      loop
         if Is_Even (Number) then
            Answer := @ + Number;
         end if;
         Number := Fibonacci_Next;
         exit when Number > 4_000_000;
      end loop;

      return To_String (Answer);
   end Get_Answer;

end P0002_Even_Fibonacci_Numbers;