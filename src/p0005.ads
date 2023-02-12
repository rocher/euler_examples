-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package P0005 is

   type P0005_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0005_Type) return Natural is (5);

   overriding function Get_Title (P : P0005_Type) return String is
     ("Smallest multiple");

   overriding function Get_Brief (P : P0005_Type) return String is
     ("Find the smallest positive number evenly divisible by 1..20.");

   overriding function Get_Answer (P : P0005_Type) return String;

   overriding function Get_Notes (P : P0005_Type) return String is ("");
end P0005;
