-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Gnoga.Gui.Element.Canvas;
with Gnoga.Gui.View;

with Plotter_Interface; use Plotter_Interface;

package Canvas_Plotter is

   type Canvas_Type is limited new Plotter_IFace with private;

   type Canvas_Name is (Back, Draw, Top);

   function Setup
     (P : in out Canvas_Type; View : Gnoga.Gui.View.Pointer_To_View_Base_Class)
      return Boolean;

   function Canvas
     (P : Canvas_Type; Name : Canvas_Name)
      return Gnoga.Gui.Element.Canvas.Canvas_Access;

   overriding function Initialize
     (P : in out Canvas_Type; X_Min, X_Max, Y_Min, Y_Max : Integer;
      X0, Y0, Width, Height :        Natural) return Boolean;

   overriding function Draw_Grid
     (P : in out Canvas_Type; X_Major, X_Minor, Y_Major, Y_Minor : Natural)
      return Boolean;

   overriding function Draw_Axes
     (P : in out Canvas_Type; X_Label, Y_Label : String) return Boolean;

   overriding function Draw_Axes_Square
     (P : in out Canvas_Type) return Boolean;

   overriding function Clear_Plot (P : in out Canvas_Type) return Boolean;

private

   type Canvas_Type is limited new Plotter_IFace with record
      Back : Gnoga.Gui.Element.Canvas.Canvas_Type;
      Draw : Gnoga.Gui.Element.Canvas.Canvas_Type;
      Info : Gnoga.Gui.Element.Canvas.Canvas_Type;
   end record;

end Canvas_Plotter;
