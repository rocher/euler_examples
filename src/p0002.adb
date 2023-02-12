-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0002 is

   function Get_Answer (P : P0002_Type) return String is
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

end P0002;
