-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Euler_Int2_Tools; use Euler_Int2_Tools;

package body P0003 is

   overriding function Get_Answer (P : P0003_Type) return String is
      Number : constant Integer_Type := 600_851_475_143;
      Answer : Integer_Type          := Square_Root (Number);
   begin

      loop
         exit when Is_Divisor (Number, Answer) and then Is_Prime (Answer);
         Answer := @ - 1;
      end loop;

      return To_String (Answer);
   end Get_Answer;

end P0003;
