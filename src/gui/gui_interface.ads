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

   type Status_Type is tagged null record;

   type GUI_IFace is abstract new Status_Type and TUI_IFace with private;
   type GUI_IFace_Access is access all GUI_IFace'Class;

   procedure Plotter_Setup
     (G : GUI_IFace; Plotter : Plotter_IFace_Access) is abstract;

   procedure On_Start
     (G : in out GUI_IFace; Plotter : Plotter_IFace_Access) is abstract;

   procedure Start (G : in out GUI_IFace);

   procedure Stop (G : in out GUI_IFace);

   function Is_Started (G : GUI_IFace) return Boolean;

   function Is_Stopped (G : GUI_IFace) return Boolean;

   procedure Wait_To_Continue (G : in out GUI_IFace);

   --  -----------------------------------------------------------------------

   procedure On_Step (G : in out GUI_IFace);

   procedure On_Continue (G : in out GUI_IFace);

   procedure On_Stop (G : in out GUI_IFace);

private
   type Status_Value is (Stop, Run, Step, Pause);

   type GUI_IFace is abstract new Status_Type and TUI_IFace with record
      Status : Status_Value := Stop;
      pragma Atomic (Status);
   end record;

end GUI_Interface;
