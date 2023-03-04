-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Gnoga.Gui.Element.Canvas.Context_2D;

use Gnoga.Gui.Element.Canvas.Context_2D;
use Gnoga.Gui.Element.Canvas;

package body Plotter_Canvas is

   subtype Pixel is Natural;

   X_Width, Y_Width : Integer;
   --  overall width and height of canvas (pixels)

   X_Orig, Y_Orig : Natural;
   --  origin of mathematical (0,0) in the canvas (pixels)

   X_Min, X_Max, Y_Min, Y_Max : Integer;
   --  min and max of X and Y relative to the origin

   X_Tick_Major, X_Tick_Minor, Y_Tick_Major, Y_Tick_Minor : Natural;
   --  ticks for X and Y

   function Canvas
     (P : Canvas_Type; Name : Canvas_Name)
      return Gnoga.Gui.Element.Canvas.Canvas_Access
   is

   begin
      return
        (if Name = Back then P.Back'Unrestricted_Access
         elsif Name = Draw then P.Draw'Unrestricted_Access
         else P.Info'Unrestricted_Access);
   end Canvas;

   function Setup
     (P : in out Canvas_Type; View : Gnoga.Gui.View.Pointer_To_View_Base_Class)
      return Boolean
   is
      Context : Context_2D_Type;
   begin
      P.Back.Create
        (Parent => View.all, Width => View.Width, Height => View.Height,
         ID     => "Canvas.Back");
      P.Back.Style ("position", "absolute");
      P.Back.Style ("left", 0);
      P.Back.Style ("top", 0);
      P.Back.Border;

      Context.Get_Drawing_Context_2D (P.Back);
      Context.Fill_Color ("#eee");
      Context.Fill_Rectangle ((0, 0, P.Back.Width, P.Back.Height));

      P.Draw.Create
        (Parent => View.all, Width => View.Width, Height => View.Height,
         ID     => "Canvas.Draw");
      P.Draw.Style ("position", "absolute");
      P.Draw.Style ("left", 0);
      P.Draw.Style ("top", 0);

      P.Info.Create
        (Parent => View.all, Width => View.Width, Height => View.Height,
         ID     => "Canvas.Info");
      P.Info.Style ("position", "absolute");
      P.Info.Style ("left", 0);
      P.Info.Style ("top", 0);
      --  P.Info.On_Mouse_Down_Handler (Mouse_Down'Unrestricted_Access);

      return True;
   end Setup;

   overriding function Initialize
     (P : in out Canvas_Type; X_Min, X_Max, Y_Min, Y_Max : Integer;
      X0, Y0, Width, Height :        Natural) return Boolean
   is
   begin
      return True;
   end Initialize;

   overriding function Draw_Grid
     (P : in out Canvas_Type; X_Major, X_Minor, Y_Major, Y_Minor : Natural)
      return Boolean is
     (True);

   overriding function Draw_Axes
     (P : in out Canvas_Type; X_Label, Y_Label : String) return Boolean is
     (True);

   overriding function Draw_Axes_Square (P : in out Canvas_Type) return Boolean
   is
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (P.Back);

      Context.Begin_Path;
      Context.Stroke_Color ("#111");
      Context.Line_Width (2);
      Context.Move_To (0, 0);
      Context.Line_To (5_000, 0);
      Context.Line_To (5_000, 5_000);
      Context.Line_To (0, 5_000);
      Context.Line_To (0, 0);
      Context.Stroke;

      return True;
   end Draw_Axes_Square;

   overriding function Clear_Plot (P : in out Canvas_Type) return Boolean is
     (True);

end Plotter_Canvas;
