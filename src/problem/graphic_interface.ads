-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package Graphic_Interface is

   type Graphic_Type is interface and Problem_Type;

   function Setup (G : Graphic_Type) return Boolean is abstract;
   function Update (G : Graphic_Type) return Boolean is abstract;

end Graphic_Interface;
