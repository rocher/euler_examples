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
   function Number (P : Text_IFace) return Natural is abstract;
   function Title (P : Text_IFace) return String is abstract;
   function Brief (P : Text_IFace) return String is abstract;

   --  Problem solution
   function Answer (P : Text_IFace) return String is abstract;
   function Notes (P : Text_IFace) return String is abstract;

end Text_Interface;
