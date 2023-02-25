-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

package body Plotter_Canvas is

   function Canvas
     (P : Plotter_Canvas_Type; Name : Canvas_Name)
      return Gnoga.Gui.Element.Canvas.Canvas_Access
   is

   begin
      return
        (if Name = Back then P.Back'Unrestricted_Access
         elsif Name = Draw then P.Draw'Unrestricted_Access
         else P.Info'Unrestricted_Access);
   end Canvas;

   function Setup
     (P    : in out Plotter_Canvas_Type;
      View :        Gnoga.Gui.View.Pointer_To_View_Base_Class) return Boolean
   is
      use Gnoga.Gui.Element.Canvas;
   begin
      P.Back.Create
        (Parent => View.all, Width => View.Width, Height => View.Height,
         ID     => "Canvas.Back");
      P.Back.Style ("position", "absolute");
      P.Back.Style ("left", 0);
      P.Back.Style ("top", 0);
      P.Back.Border;

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
     (P : in out Plotter_Canvas_Type; X_Min, X_Max, Y_Min, Y_Max : Integer)
      return Boolean is
     (True);

   overriding function Draw_Grid
     (P                                  : in out Plotter_Canvas_Type;
      X_Major, X_Minor, Y_Major, Y_Minor :        Natural) return Boolean is
     (True);

   overriding function Draw_Axes
     (P : in out Plotter_Canvas_Type; X_Label, Y_Label : String)
      return Boolean is
     (True);

   overriding function Draw_Axes_Square
     (P : in out Plotter_Canvas_Type) return Boolean is
     (True);

   overriding function Clear_Plot
     (P : in out Plotter_Canvas_Type) return Boolean is
     (True);

end Plotter_Canvas;
