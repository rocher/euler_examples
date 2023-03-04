-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.Base;
with Gnoga.Gui.Element;
with Gnoga.Gui.Element.Canvas;
with Gnoga.Gui.Element.Canvas.Context_2D;
with Gnoga.Gui.Element.Common;
--  with Gnoga.Gui.View.Console;
with Gnoga.Gui.View.Grid;
with Gnoga.Gui.Window;
with Gnoga.Types;
with UXStrings;

with Plotter_Canvas; use Plotter_Canvas;

use all type Gnoga.String;

package body Gnoga_Runner is
   COL : Gnoga.Gui.View.Grid.Grid_Element_Type renames Gnoga.Gui.View.Grid.COL;
   SPN : Gnoga.Gui.View.Grid.Grid_Element_Type renames Gnoga.Gui.View.Grid.SPN;

   Window_Layout : constant Gnoga.Gui.View.Grid.Grid_Rows_Type :=
     [[COL, COL, COL], [COL, COL, SPN], [COL, COL, SPN]];

   --  type App_Canvas_Type is record
   --     Back  : Gnoga.Gui.Element.Canvas.Canvas_Type;
   --     Graph : Gnoga.Gui.Element.Canvas.Canvas_Type;
   --     Info  : Gnoga.Gui.Element.Canvas.Canvas_Type;
   --  end record;

   type Button_Bar_Type is record
      Panel : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Start : Gnoga.Gui.Element.Common.Button_Type;
   end record;

   type App_Data_Type is new Gnoga.Types.Connection_Data_Type with record
      Grid         : Gnoga.Gui.View.Grid.Grid_View_Type;
      Panel_Margin : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Panel_Title  : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Button_Bar   : Button_Bar_Type;
      Plotter      : aliased Canvas_Type;
      --  Canvas       : App_Canvas_Type;
   end record;
   type App_Access is access all App_Data_Type;

   Problem : GUI_IFace_Access := null;

   procedure Button_Start_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);

   procedure On_Click (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   procedure On_Exit (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   procedure Mouse_Down
     (Object      : in out Gnoga.Gui.Base.Base_Type'Class;
      Mouse_Event :        Gnoga.Gui.Base.Mouse_Event_Record);
   procedure Mouse_Move
     (Object      : in out Gnoga.Gui.Base.Base_Type'Class;
      Mouse_Event :        Gnoga.Gui.Base.Mouse_Event_Record);
   procedure Mouse_Up
     (Object      : in out Gnoga.Gui.Base.Base_Type'Class;
      Mouse_Event :        Gnoga.Gui.Base.Mouse_Event_Record);

   ---------
   -- UXS --
   ---------

   function UXS
     (Item : UXStrings.ASCII_Character_Array) return UXStrings.UXString renames
     UXStrings.From_ASCII;

   --  procedure Clear_Canvas
   --    (Context       : in out Gnoga.Gui.Element.Canvas.Context_2D;
   --     Width, Height :        Natural)
   --  is
   --  begin
   --     Context.Clear_Rectangle ((0, 0, Width, Height));
   --  end Clear_Canvas;

   ---------------------------
   -- Button_Start_On_Click --
   ---------------------------

   procedure Button_Start_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
      use Gnoga.Gui.Element.Canvas.Context_2D;

      App     : constant App_Access := App_Access (Object.Connection_Data);
      Context : Context_2D_Type;
      --  pragma Unreferenced (Object);
   begin
      Gnoga.Log ("On_Click");
      App.Panel_Margin.New_Line;
      App.Panel_Margin.Put_Line ("I've been clicked!");

      Context.Get_Drawing_Context_2D (App.Plotter.Canvas (Draw).all);
      --  Context.Save;
      --  Context.Begin_Path;
      --  Context.Stroke_Color ("white");
      --  Context.Move_To (0, 0);
      --  Context.Line_To (900, 900);
      --  Context.Stroke;
      --  Context.Restore;
      Context.Clear_Rectangle
        ((0, 0, App.Plotter.Canvas (Draw).Width,
          App.Plotter.Canvas (Draw).Height));
   end Button_Start_On_Click;

   ----------------
   -- Mouse_Down --
   ----------------

   procedure Mouse_Down
     (Object      : in out Gnoga.Gui.Base.Base_Type'Class;
      Mouse_Event :        Gnoga.Gui.Base.Mouse_Event_Record)
   is
      use Gnoga.Gui.Element.Canvas.Context_2D;

      App     : constant App_Access := App_Access (Object.Connection_Data);
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (App.Plotter.Canvas (Draw).all);
      --  Before we can draw we need to get the 2D Drawing context from the
      --  canvas.

      Context.Begin_Path;
      --  This clears any previous setting of points on a path and readies the
      --  context to receive new path points.

      Context.Line_Width (3);
      Context.Line_Join (Round);
      Context.Stroke_Color ("red");
      Context.Shadow_Color ("#999");
      Context.Shadow_Blur (1);
      Context.Shadow_Offset_X (1);
      Context.Shadow_Offset_Y (2);
      --  Settings in the context remain between one call to
      --  Get_Drawing_Context_2D and the next.

      Context.Move_To (Mouse_Event.X, Mouse_Event.Y);
      --  We set the first point on the path with out drawing.

      App.Plotter.Canvas (Top).On_Mouse_Move_Handler
        (Mouse_Move'Unrestricted_Access);
      App.Plotter.Canvas (Top).On_Mouse_Up_Handler
        (Mouse_Up'Unrestricted_Access);
      --  As you can see it is possible to add or remove event handlers at any
      --  time.
   end Mouse_Down;

   ----------------
   -- Mouse_Move --
   ----------------

   procedure Mouse_Move
     (Object      : in out Gnoga.Gui.Base.Base_Type'Class;
      Mouse_Event :        Gnoga.Gui.Base.Mouse_Event_Record)
   is
      use Gnoga.Gui.Element.Canvas.Context_2D;

      App     : constant App_Access := App_Access (Object.Connection_Data);
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (App.Plotter.Canvas (Draw).all);

      Context.Line_To (Mouse_Event.X, Mouse_Event.Y);
      --  This adds a line on the path from the last point to this one.

      Context.Stroke;
      --  Stroke the point using the stroke style set. In this case the Color
      --  Black form Mouse_Down
   end Mouse_Move;

   --------------
   -- Mouse_Up --
   --------------

   procedure Mouse_Up
     (Object      : in out Gnoga.Gui.Base.Base_Type'Class;
      Mouse_Event :        Gnoga.Gui.Base.Mouse_Event_Record)
   is
      use Gnoga.Gui.Element.Canvas.Context_2D;

      App     : constant App_Access := App_Access (Object.Connection_Data);
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (App.Plotter.Canvas (Draw).all);

      Context.Line_To (Mouse_Event.X, Mouse_Event.Y);
      Context.Stroke;
      Context.Close_Path;
      --  We draw up to the last point and then remove the handlers that
      --  perform drawing.

      App.Plotter.Canvas (Top).On_Mouse_Move_Handler (null);
      App.Plotter.Canvas (Top).On_Mouse_Up_Handler (null);
   end Mouse_Up;

   --------------
   -- On_Click --
   --------------

   procedure On_Click (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      use Gnoga.Gui.Element.Canvas.Context_2D;

      App     : constant App_Access := App_Access (Object.Connection_Data);
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (App.Plotter.Canvas (Draw).all);
      Context.Save;
      --  This will push the state of the context on to the "stack",
      --  this way changes we make now can be discarded later by restoring
      --  from the stack what the state of the context was before we made
      --  changes.

      Context.Fill_Color ("white");
      Context.Stroke_Color ("white");
      Context.Fill_Rectangle
        ((0, 0, App.Plotter.Canvas (Draw).Width,
          App.Plotter.Canvas (Draw).Height));

      Context.Restore;
      --  Restore the state of the context.
   end On_Click;

   -------------
   -- On_Exit --
   -------------

   procedure On_Exit (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Panel_Margin.New_Line;
      App.Panel_Margin.Put_Line ("Closing application and every connection!");

      App.Button_Bar.Start.Disabled;

      Gnoga.Application.Multi_Connect.End_Application;
   end On_Exit;

   --------------------
   -- On_App_Connect --
   --------------------

   procedure On_App_Connect
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  :        access Gnoga.Application.Multi_Connect
        .Connection_Holder_Type)
   is
      use Gnoga.Gui.Element.Canvas.Context_2D;

      App     : constant App_Access := new App_Data_Type;
      Context : Context_2D_Type;
   begin
      pragma Unreferenced (Connection);
      --  Gnoga.Application.Title (UXS (Title));
      --  Gnoga.Application.Singleton.Initialize
      --    (Main_Window => App.Window, Boot => "boot_bootstrap3.html");

      --  App_Init (Problem.Title);

      Main_Window.Connection_Data (App);
      App.Grid.Create
        (Parent => Main_Window, Layout => Window_Layout, Fill_Parent => True,
         Set_Sizes => False, ID => "app_grid");

      App.Panel_Margin := App.Grid.Panel (1, 1);
      App.Panel_Margin.Padding ("10px", "10px", "10px", "10px");
      App.Panel_Margin.Class_Name ("third-cell");
      App.Panel_Margin.Attribute ("rowspan", "3");

      App.Panel_Title := App.Grid.Panel (1, 2);
      App.Panel_Title.Class_Name ("half-cell");
      App.Panel_Title.Padding ("10px", "10px", "10px", "10px");
      App.Panel_Title.Height (50);
      App.Panel_Title.Put_HTML
        (UXS ("<h2>Problem " & Problem.Number'Image & "</h2>"));
      App.Panel_Title.Put_HTML (UXS ("<h1>" & Problem.Title & "</h1>"));
      App.Panel_Title.Put_HTML
        (UXS ("<p class='fs-4'>" & Problem.Brief & "</p>"));
      App.Panel_Title.Horizontal_Rule;

      App.Button_Bar.Panel := App.Grid.Panel (3, 1);
      App.Button_Bar.Panel.Padding ("10px", "10px", "10px", "10px");
      App.Button_Bar.Panel.Height (100);
      --  App.Panel_Button_Bar.Horizontal_Rule;

      App.Button_Bar.Start.Create
        (App.Button_Bar.Panel.all, "&nbsp;Start&nbsp;", "button2");
      App.Button_Bar.Start.Class_Name ("btn btn-success");
      App.Button_Bar.Start.On_Click_Handler
        (Button_Start_On_Click'Unrestricted_Access);

      App.Grid.Panel (2, 1).Padding ("10px", "10px", "10px", "10px");
      App.Grid.Panel (2, 1).Margin ("10px", "10px", "10px", "10px");
      App.Grid.Style ("position", "relative");

      if not App.Plotter.Setup (App.Grid.Panel (2, 1)) then
         raise Program_Error;
      end if;

      Context.Translate
        (Integer (0.05 * App.Plotter.Canvas (Back).Width),
         Integer (0.90 * App.Plotter.Canvas (Back).Height));
      Context.Scale
        (0.9 * Float (App.Plotter.Canvas (Back).Width) / 5_000.0,
         -0.8 * Float (App.Plotter.Canvas (Back).Height) / 5_000.0);

      Context.Begin_Path;
      Context.Stroke_Color ("#999");
      Context.Line_Width (1);
      Context.Set_Line_Dash (Dotted_Dash_List);
      for X in 1 .. 25 loop
         Context.Move_To (45 * X, 0);
         Context.Line_To (45 * X, 400 + 10 * X);
      end loop;
      Context.Stroke;

      if not Problem.Setup (App.Plotter'Access) then
         raise Program_Error;
      end if;

      --  App.View.Put_HTML
      --    (UXS
      --       ("<p>This is a test of mathjax trying to write " &
      --        "that $$\sum_{i=1}^{n}i = \frac{n^2 (n+1)}{2}$$ and see " &
      --        "how it works.</p>"));

      --  App_View.Put_HTML (UXS ("<script>MathJax.typeset();</script>"));
      --  Gnoga.Application.Singleton.End_Application;
   end On_App_Connect;

   ----------
   -- Main --
   ----------

   procedure Main (A_Problem : GUI_IFace_Access) is
   begin
      Problem := A_Problem;

      Gnoga.Application.Title (UXS (Problem.Title));

      Gnoga.Application.HTML_On_Close
        ("<h3 style='margin:50px;'>Application closed.<h3>");

      Gnoga.Application.Multi_Connect.Initialize
        (Event => On_App_Connect'Unrestricted_Access,
         Boot  => "boot_bootstrap3.html");

      Gnoga.Application.Multi_Connect.Message_Loop;

   end Main;

end Gnoga_Runner;
