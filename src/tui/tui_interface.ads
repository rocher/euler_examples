-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

package TUI_Interface is

   type TUI_IFace is interface;

   --  Information functions
   function Number (P : TUI_IFace) return Natural is abstract;
   function Title (P : TUI_IFace) return String is abstract;
   function Brief (P : TUI_IFace) return String is abstract;

   --  Problem solution
   function Answer (P : TUI_IFace) return String is abstract;
   function Notes (P : TUI_IFace) return String is abstract;

end TUI_Interface;
