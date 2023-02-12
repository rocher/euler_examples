-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0001 is

   overriding function Get_Answer (S : P0001_Type) return String is
      Answer : Integer_Type;
   begin
      Answer :=
        Sum_Multiples (3, 1_000) + Sum_Multiples (5, 1_000) -
        Sum_Multiples (15, 1_000);

      return To_String (Answer);
   end Get_Answer;

end P0001;
