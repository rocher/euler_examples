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

   type Runner_Callback is access procedure;

   function Canvas
     (P : Canvas_Type; Name : Canvas_Name)
      return Gnoga.Gui.Element.Canvas.Canvas_Access;

   procedure Create
     (P : in out Canvas_Type; View : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Stop_Callback :        Runner_Callback);

   overriding procedure Start_Plotter (P : in out Canvas_Type);

   overriding procedure Stop_Plotter (P : in out Canvas_Type);

   overriding procedure Clear_Plot (P : in out Canvas_Type);

   overriding procedure Set_Axes (P : in out Canvas_Type; Min, Max : Float);

   overriding procedure Set_Axes
     (P : in out Canvas_Type; X_Min, X_Max, Y_Min, Y_Max : Float);

   overriding procedure Draw_Grid
     (P : in out Canvas_Type; X_Major, X_Minor, Y_Major, Y_Minor : Float);

   overriding procedure Draw_Axes
     (P : in out Canvas_Type; X_Label, Y_Label : String);

   overriding procedure Draw_Axes_Square (P : in out Canvas_Type);

   overriding procedure Plot
     (P : in out Canvas_Type; Points : Point_List; Color : String);

   overriding procedure Rectangle
     (P : in out Canvas_Type; X0, Y0, X1, Y1 : Float; color : String);

   overriding procedure Arc
     (P : in out Canvas_Type; X0, Y0, Radius, Start_Angle, End_Angle : Float;
      color :        String);

private

   type Canvas_Type is limited new Plotter_IFace with record
      Back : Gnoga.Gui.Element.Canvas.Canvas_Type;
      Draw : Gnoga.Gui.Element.Canvas.Canvas_Type;
      Info : Gnoga.Gui.Element.Canvas.Canvas_Type;
   end record;

end Canvas_Plotter;
