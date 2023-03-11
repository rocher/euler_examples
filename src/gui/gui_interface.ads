-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with TUI_Interface;     use TUI_Interface;
with Plotter_Interface; use Plotter_Interface;

package GUI_Interface is

   type GUI_IFace is interface and TUI_IFace;
   type GUI_IFace_Access is access all GUI_IFace'Class;

   procedure Plotter_Setup
     (G : GUI_IFace; Plotter : Plotter_IFace_Access) is abstract;

   procedure On_Start
     (G : GUI_IFace; Plotter : Plotter_IFace_Access) is abstract;

   procedure On_Step
     (G : GUI_IFace; Plotter : Plotter_IFace_Access) is abstract;

   procedure On_Continue
     (G : GUI_IFace; Plotter : Plotter_IFace_Access) is abstract;

   procedure On_Stop
     (G : GUI_IFace; Plotter : Plotter_IFace_Access) is abstract;

end GUI_Interface;
