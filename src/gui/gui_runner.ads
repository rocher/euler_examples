-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Graphic_Interface; use Graphic_Interface;

package GUI_Runner is

   type Graphic_Class_Access is access all Graphic_IFace'Class;

   procedure Main (A_Problem : Graphic_Class_Access);

end GUI_Runner;
