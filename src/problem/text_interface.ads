-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

package Text_Interface is

   type Text_IFace is interface;

   --  Information functions
   function Get_Number (P : Text_IFace) return Natural is abstract;
   function Get_Title (P : Text_IFace) return String is abstract;
   function Get_Brief (P : Text_IFace) return String is abstract;

   --  Problem solution
   function Get_Answer (P : Text_IFace) return String is abstract;
   function Get_Notes (P : Text_IFace) return String is abstract;

end Text_Interface;
