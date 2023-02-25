-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package Graphic_Interface is

   type Graphic_IFace is interface and Text_IFace;

   function Setup (G : Graphic_IFace) return Boolean is abstract;
   function Update (G : Graphic_IFace) return Boolean is abstract;

end Graphic_Interface;
