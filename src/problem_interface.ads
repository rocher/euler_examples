-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

package Problem_Interface is

   type Problem_Type is interface;

   --  Information functions
   function Get_Number (P : Problem_Type) return Natural is abstract;
   function Get_Title (P : Problem_Type) return String is abstract;
   function Get_Brief (P : Problem_Type) return String is abstract;

   --  Problem solution
   function Get_Answer (P : Problem_Type) return String is abstract;
   function Get_Notes (P : Problem_Type) return String is abstract;

end Problem_Interface;
