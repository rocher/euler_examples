-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Gnoga.Gui.Element; use Gnoga.Gui.Element;
with Gnoga.Gui.Element.Canvas.Context_2D;
with UXStrings;

use Gnoga.Gui.Element.Canvas;
use Gnoga.Gui.Element.Canvas.Context_2D;

with Text_IO; use Text_IO;

package body Canvas_Plotter is

   Font_Family_Axis   : constant String  := "Arial";
   Font_Height_Medium : constant String  := "12px";
   Font_Height_Small  : constant String  := "10px";
   Font_Size_Medium   : constant Natural := 12;
   Font_Size_Small    : constant Natural := 10;

   type Axis_Type is record
      Min       : Float;   -- math x min
      Max       : Float;   -- math x max
      Width     : Natural; -- screen width, pixels
      Margin    : Natural; -- screen margin, pixels
      Has_Ticks : Boolean := False;
   end record;

   X, Y : Axis_Type;

   --------------
   -- Screen_X --
   --------------

   function Screen_X (Px : Float) return Natural is
      Sx : constant Float := (Px - X.Min) / (X.Max - X.Min);
   begin
      return
        Natural
          (Float (X.Margin) +
           Float'Rounding ((Float (X.Width) - 2.0 * Float (X.Margin)) * Sx));
   end Screen_X;

   function Sx (Px : Float) return Natural renames Screen_X;

   --------------
   -- Screen_Y --
   --------------

   function Screen_Y (Py : Float) return Natural is
      Sy : constant Float := (Py - Y.Min) / (Y.Max - Y.Min);
   begin
      return
        Natural
          (Float (Y.Width - Y.Margin) -
           Float'Rounding ((Float (Y.Width) - 2.0 * Float (Y.Margin)) * Sy));
   end Screen_Y;

   function Sy (Py : Float) return Natural renames Screen_Y;

   ------------
   -- Math_X --
   ------------

   function Math_X (Sx : Natural) return Float is
      Dx : constant Float :=
        Float (Sx - X.Margin) / Float (X.Width - 2 * X.Margin);
   begin
      return Dx * (X.Max - X.Min) + X.Min;
   end Math_X;

   function Mx (Sx : Natural) return Float renames Math_X;

   ------------
   -- Math_X --
   ------------

   function Math_Y (Sy : Natural) return Float is
      Dy : constant Float :=
        Float (Sy - Y.Width + Y.Margin) / Float (Y.Width - 2 * Y.Margin);
   begin
      return Dy * (Y.Max - Y.Min) + Y.Min;
   end Math_Y;

   function My (Sy : Natural) return Float renames Math_Y;

   ---------
   -- UXS --
   ---------

   function UXS
     (Item : UXStrings.ASCII_Character_Array) return UXStrings.UXString renames
     UXStrings.From_ASCII;

   ------------
   -- Canvas --
   ------------

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

   ------------
   -- Create --
   ------------

   procedure Create
     (P : in out Canvas_Type; View : Gnoga.Gui.View.Pointer_To_View_Base_Class)
   is
      Context : Context_2D_Type;
   begin
      P.Back.Create
        (Parent => View.all, Width => View.Width, Height => View.Height,
         ID     => "Canvas.Back");
      P.Back.Style ("position", "absolute");
      P.Back.Style ("left", 0);
      P.Back.Style ("top", 0);

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
   end Create;

   --------------
   -- Set_Axes --
   --------------

   overriding procedure Set_Axes (P : in out Canvas_Type; Min, Max : Float) is
      Margin : constant Natural :=
        Natural'Max (P.Back.Width, P.Back.Height) * 3 / 100;
      Length : Float;
   begin
      X.Width  := P.Back.Width;
      X.Margin := Margin;

      Y.Width  := P.Back.Height;
      Y.Margin := Margin;

      if X.Width <= Y.Width then
         X.Min  := Min;
         X.Max  := Max;
         Length :=
           (Max - Min) * Float (Y.Width - 2 * Y.Margin) /
           Float (X.Width - 2 * X.Margin);
         Y.Min  := -Length / 2.0;
         Y.Max  := Length / 2.0;
      else
         Y.Min  := Min;
         Y.Max  := Max;
         Length :=
           (Max - Min) * Float (X.Width - 2 * X.Margin) /
           Float (Y.Width - 2 * Y.Margin);
         X.Min  := -Length / 2.0;
         X.Max  := Length / 2.0;
      end if;
   end Set_Axes;

   --------------
   -- Set_Axes --
   --------------

   overriding procedure Set_Axes
     (P : in out Canvas_Type; X_Min, X_Max, Y_Min, Y_Max : Float)
   is
      Margin : constant Natural :=
        Natural'Max (P.Back.Width, P.Back.Height) * 3 / 100;
   begin
      X.Min    := X_Min;
      X.Max    := X_Max;
      X.Width  := P.Back.Width;
      X.Margin := Margin;

      Y.Min    := Y_Min;
      Y.Max    := Y_Max;
      Y.Width  := P.Back.Height;
      Y.Margin := Margin;
   end Set_Axes;

   ---------------
   -- Draw_Grid --
   ---------------

   overriding procedure Draw_Grid
     (P : in out Canvas_Type; X_Major, X_Minor, Y_Major, Y_Minor : Float)
   is
      Context : Context_2D_Type;
      Px, Py  : Float;
      Length  : Natural;
      Count   : Natural;

      --  #region Internal procedures
      procedure Draw_X (Δx : Float; Is_Major : Boolean) is
      begin
         if Δx = 0.0 then
            return;
         end if;

         if Is_Major then
            X.Has_Ticks := True;
         end if;

         Px    := 0.0;
         Count := 0;
         loop
            Context.Move_To (Sx (Px), Sy (Y.Min));
            Context.Line_To (Sx (Px), Sy (Y.Max));
            Px    := @ - Δx;
            Count := @ + 1;
            exit when Px < X.Min;
         end loop;
         if Is_Major and then (Count = 0 or else Px - X.Min < Δx / 3.0) then
            Context.Move_To (Sx (X.Min), Sy (Y.Min));
            Context.Line_To (Sx (X.Min), Sy (Y.Max));
         end if;

         Px    := 0.0;
         Count := 0;
         loop
            Context.Move_To (Sx (Px), Sy (Y.Min));
            Context.Line_To (Sx (Px), Sy (Y.Max));
            Px    := @ + Δx;
            Count := @ + 1;
            exit when Px > X.Max;
         end loop;
         if Is_Major and then (Count = 0 or else X.Max - Px < Δx / 3.0) then
            Context.Move_To (Sx (X.Max), Sy (Y.Min));
            Context.Line_To (Sx (X.Max), Sy (Y.Max));
         end if;
      end Draw_X;

      procedure Draw_Y (Δy : Float; Is_Major : Boolean) is
      begin
         if Δy = 0.0 then
            return;
         end if;

         if Is_Major then
            Y.Has_Ticks := True;
         end if;

         Py    := 0.0;
         Count := 0;
         loop
            Context.Move_To (Sx (X.Min), Sy (Py));
            Context.Line_To (Sx (X.Max), Sy (Py));
            Py    := @ - Δy;
            Count := @ + 1;
            exit when Py < Y.Min;
         end loop;
         if Is_Major and then (Count = 0 or else Py - Y.Min < Δy / 3.0) then
            Context.Move_To (Sx (X.Min), Sy (Y.Min));
            Context.Line_To (Sx (X.Max), Sy (Y.Min));
         end if;

         Py    := 0.0;
         Count := 0;
         loop
            Context.Move_To (Sx (X.Min), Sy (Py));
            Context.Line_To (Sx (X.Max), Sy (Py));
            Py    := @ + Δy;
            Count := @ + 1;
            exit when Py > Y.Max;
         end loop;
         if Is_Major and then (Count = 0 or else Y.Max - Py < Δy / 3.0) then
            Context.Move_To (Sx (X.Min), Sy (Y.Max));
            Context.Line_To (Sx (X.Max), Sy (Y.Max));
         end if;
      end Draw_Y;
      --  #end region

   begin
      Context.Get_Drawing_Context_2D (P.Back);

      --  minor ticks
      Context.Stroke_Color ("#ccc");
      Context.Line_Width (1);
      Context.Set_Line_Dash (Center_Dash_List);

      Context.Begin_Path;
      Draw_X (X_Minor, False);
      Draw_Y (Y_Minor, False);
      Context.Stroke;

      --  major ticks
      Context.Stroke_Color ("#999");
      Context.Line_Width (1);
      Context.Set_Line_Dash (Empty_Dash_List);

      Context.Begin_Path;
      Draw_X (X_Major, True);
      Draw_Y (Y_Major, True);
      Context.Stroke;

      --  labels
      Context.Font
        (Family => UXS (Font_Family_Axis), Height => UXS (Font_Height_Small));
      Context.Fill_Color ("#000");

      if X_Major > 0.0 then
         Context.Text_Baseline (Top);
         Context.Text_Alignment (Center);
         Px    := -X_Major;
         Count := 0;
         loop
            exit when Px < X.Min;
            Length := Font_Size_Small / 2 * UXStrings.Length (UXS (Px'Image));
            Context.Fill_Text
              (UXS (Px'Image), Sx (Px) - Length / 2,
               Sy (0.0) + Font_Size_Small + 2, Length);
            Px := @ - X_Major;
         end loop;

         Px    := X_Major;
         Count := 0;
         loop
            exit when Px > X.Max;
            Length := Font_Size_Small / 2 * UXStrings.Length (UXS (Px'Image));
            Context.Fill_Text
              (UXS (Px'Image), Sx (Px) - Length / 2,
               Sy (0.0) + Font_Size_Small + 2, Length);
            Px := @ + X_Major;
         end loop;
      end if;

      if Y_Major > 0.0 then
         Context.Text_Baseline (Bottom);
         Context.Text_Alignment (Right);
         Py    := -Y_Major;
         Count := 0;
         loop
            exit when Py < Y.Min;
            Length := Font_Size_Small / 2 * UXStrings.Length (UXS (Py'Image));
            Context.Fill_Text
              (UXS (Py'Image), Sx (0.0) - Length - 3, Sy (Py) - 2, Length);
            Py := @ - Y_Major;
         end loop;

         Py    := Y_Major;
         Count := 0;
         loop
            exit when Py > Y.Max;
            Length := Font_Size_Small / 2 * UXStrings.Length (UXS (Py'Image));
            Context.Fill_Text
              (UXS (Py'Image), Sx (0.0) - Length - 3, Sy (Py) - 2, Length);
            Py := @ + Y_Major;
         end loop;
      end if;
   end Draw_Grid;

   ---------------
   -- Draw_Axes --
   ---------------

   overriding procedure Draw_Axes
     (P : in out Canvas_Type; X_Label, Y_Label : String)
   is
      Context : Context_2D_Type;
      Length  : Natural;
   begin
      Context.Get_Drawing_Context_2D (P.Back);

      Context.Stroke_Color ("#000");
      Context.Line_Width (2);
      Context.Begin_Path;

      Context.Move_To (Sx (X.Min), Sy (0.0));
      Context.Line_To (Sx (X.Max), Sy (0.0));

      Context.Move_To (Sx (0.0), Sy (Y.Min));
      Context.Line_To (Sx (0.0), Sy (Y.Max));

      Context.Font (UXS (Font_Family_Axis), UXS (Font_Height_Medium));
      Context.Fill_Color ("#000");

      Context.Text_Alignment (Left);
      Context.Text_Baseline (Top);
      Length := 6 * UXStrings.Length (UXS (X_Label));
      Context.Fill_Text
        (UXS (X_Label), Sx (X.Max) - Length / 2,
         Sy (0.0) + 2 +
         (if X.Has_Ticks then Font_Size_Medium * 2 else Font_Size_Medium),
         Length);

      Context.Text_Alignment (Center);
      Context.Text_Baseline (Bottom);
      Length := 6 * UXStrings.Length (UXS (Y_Label));
      Context.Fill_Text
        (UXS (Y_Label), Sx (0.0) - Length / 2,
         Sy (Y.Max) -
         (if Y.Has_Ticks then Font_Size_Medium * 2 else Font_Size_Medium / 2),
         Length);

      Context.Stroke;
   end Draw_Axes;

   ----------------------
   -- Draw_Axes_Square --
   ----------------------

   overriding procedure Draw_Axes_Square (P : in out Canvas_Type) is
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (P.Back);

      Context.Begin_Path;
      Context.Stroke_Color ("#000000");
      Context.Line_Width (2);
      Context.Line_Join (Value => Round);
      Context.Rectangle
        ([Sx (X.Min), Sy (Y.Min), Sx (X.Max) - Sx (X.Min),
         Sy (Y.Max) - Sy (Y.Min)]);
      Context.Stroke;
   end Draw_Axes_Square;

   ----------------
   -- Clear_Plot --
   ----------------

   overriding procedure Clear_Plot (P : in out Canvas_Type) is
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Clear_Rectangle ([0, 0, P.Draw.Width, P.Draw.Height]);
   end Clear_Plot;

   ----------
   -- Plot --
   ----------

   overriding procedure Plot
     (P : in out Canvas_Type; Points : Point_List; Color : String)
   is
      Context : Context_2D_Type;
      Point   : Math_Point;
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Stroke_Color (UXS (Color));
      Context.Line_Width (2);
      Context.Line_Join (Value => Miter);

      Point := Points.First_Element;
      Context.Move_To (Sx (Point.X), Sy (Point.Y));
      for P of Points loop
         Context.Line_To (Sx (P.X), Sy (P.Y));
      end loop;
      Context.Stroke;
   end Plot;

   ---------------
   -- Rectangle --
   ---------------

   overriding procedure Rectangle
     (P : in out Canvas_Type; X0, Y0, X1, Y1 : Float; color : String)
   is
      Context : Context_2D_Type;
      X       : constant Natural := Natural'Min (Sx (X0), Sx (X1));
      Y       : constant Natural := Natural'Min (Sy (Y0), Sy (Y1));
      Width   : constant Natural := Natural (abs (Sx (X1) - Sx (X0)));
      Height  : constant Natural := Natural (abs (Sy (Y1) - Sy (Y0)));
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Stroke_Color (UXS (color));
      Context.Line_Width (1);
      Context.Rectangle (Rectangle => [X, Y, Width, Height]);
      Context.Stroke;
   end Rectangle;

   ---------
   -- Arc --
   ---------

   overriding procedure Arc
     (P : in out Canvas_Type; X0, Y0, Radius, Start_Angle, End_Angle : Float;
      Color :        String)
   is
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Stroke_Color (UXS (Color));
      Context.Line_Width (1);
      --  Context.Move_To (Sx (X0), Sy (Y0));
      Context.Arc_Degrees
        (Sx (X0), Sy (Y0), Sx (Radius) - Sx (0.0), 360.0 - Start_Angle,
         360.0 - End_Angle);
      Context.Stroke;
   end Arc;

end Canvas_Plotter;
