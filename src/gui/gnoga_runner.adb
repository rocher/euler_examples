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

with Canvas_Plotter; use Canvas_Plotter;

use all type Gnoga.String;

package body Gnoga_Runner is
   COL : Gnoga.Gui.View.Grid.Grid_Element_Type renames Gnoga.Gui.View.Grid.COL;
   SPN : Gnoga.Gui.View.Grid.Grid_Element_Type renames Gnoga.Gui.View.Grid.SPN;

   Window_Layout : constant Gnoga.Gui.View.Grid.Grid_Rows_Type :=
     [[COL, COL, COL], [COL, COL, SPN], [COL, COL, SPN]];

   type Button_Bar_Type is record
      Panel    : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Start    : Gnoga.Gui.Element.Common.Button_Type;
      Step     : Gnoga.Gui.Element.Common.Button_Type;
      Continue : Gnoga.Gui.Element.Common.Button_Type;
      Stop     : Gnoga.Gui.Element.Common.Button_Type;
   end record;

   type App_Data_Type is new Gnoga.Types.Connection_Data_Type with record
      Grid         : Gnoga.Gui.View.Grid.Grid_View_Type;
      Panel_Margin : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Panel_Title  : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Button_Bar   : Button_Bar_Type;
      Plotter      : aliased Canvas_Type;
   end record;
   type App_Access is access all App_Data_Type;

   Problem : GUI_IFace_Access := null;

   procedure Button_Start_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   procedure Button_Step_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   procedure Button_Continue_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   procedure Button_Stop_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);

   ---------
   -- UXS --
   ---------

   function UXS
     (Item : UXStrings.ASCII_Character_Array) return UXStrings.UXString renames
     UXStrings.From_ASCII;

   ---------------------------
   -- Button_Start_On_Click --
   ---------------------------

   procedure Button_Start_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Button_Bar.Start.Class_Name ("btn btn-outline-primary");
      App.Button_Bar.Start.Disabled (True);
      App.Button_Bar.Step.Class_Name ("btn btn-info");
      App.Button_Bar.Step.Disabled (False);
      App.Button_Bar.Stop.Class_Name ("btn btn-danger");
      App.Button_Bar.Stop.Disabled (False);
      Gnoga_Runner.Problem.On_Start (App.Plotter'Access);
   end Button_Start_On_Click;

   --------------------------
   -- Button_Step_On_Click --
   --------------------------

   procedure Button_Step_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Button_Bar.Continue.Class_Name ("btn btn-light");
      App.Button_Bar.Continue.Disabled (False);
      Gnoga_Runner.Problem.On_Step;
   end Button_Step_On_Click;

   ------------------------------
   -- Button_Continue_On_Click --
   ------------------------------

   procedure Button_Continue_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
      use Gnoga.Gui.Element.Canvas.Context_2D;
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Button_Bar.Continue.Class_Name ("btn btn-outline-light");
      App.Button_Bar.Continue.Disabled;
      Gnoga_Runner.Problem.On_Continue;
   end Button_Continue_On_Click;

   --------------------------
   -- Button_Stop_On_Click --
   --------------------------

   procedure Button_Stop_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Button_Bar.Start.Class_Name ("btn btn-primary");
      App.Button_Bar.Start.Disabled (False);
      App.Button_Bar.Step.Class_Name ("btn btn-outline-info");
      App.Button_Bar.Step.Disabled;
      App.Button_Bar.Continue.Class_Name ("btn btn-outline-light");
      App.Button_Bar.Continue.Disabled;
      App.Button_Bar.Stop.Class_Name ("btn btn-outline-danger");
      App.Button_Bar.Stop.Disabled;
      Gnoga_Runner.Problem.On_Stop;
   end Button_Stop_On_Click;

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
      App.Button_Bar.Panel.Class_Name ("button_bar");
      App.Button_Bar.Panel.Height (100);

      App.Button_Bar.Start.Create
        (App.Button_Bar.Panel.all, "&nbsp;Start&nbsp;", "button_start");
      App.Button_Bar.Start.Class_Name ("btn btn-primary");
      App.Button_Bar.Start.On_Click_Handler
        (Button_Start_On_Click'Unrestricted_Access);

      App.Button_Bar.Step.Create
        (App.Button_Bar.Panel.all, "&nbsp;Step&nbsp;", "button_step");
      App.Button_Bar.Step.Class_Name ("btn btn-outline-info");
      App.Button_Bar.Step.Disabled;
      App.Button_Bar.Step.On_Click_Handler
        (Button_Step_On_Click'Unrestricted_Access);

      App.Button_Bar.Continue.Create
        (App.Button_Bar.Panel.all, "&nbsp;Continue&nbsp;", "button_continue");
      App.Button_Bar.Continue.Class_Name ("btn btn-outline-light");
      App.Button_Bar.Continue.Disabled;
      App.Button_Bar.Continue.On_Click_Handler
        (Button_Continue_On_Click'Unrestricted_Access);

      App.Button_Bar.Stop.Create
        (App.Button_Bar.Panel.all, "&nbsp;Stop&nbsp;", "button_stop");
      App.Button_Bar.Stop.Class_Name ("btn btn-outline-danger");
      App.Button_Bar.Stop.Disabled;
      App.Button_Bar.Stop.On_Click_Handler
        (Button_Stop_On_Click'Unrestricted_Access);

      App.Grid.Panel (2, 1).Padding ("10px", "10px", "10px", "10px");
      App.Grid.Panel (2, 1).Margin ("10px", "10px", "10px", "10px");
      App.Grid.Style ("position", "relative");

      App.Plotter.Create (App.Grid.Panel (2, 1));

      --  Context.Translate
      --    (Integer (0.05 * App.Plotter.Canvas (Back).Width),
      --     Integer (0.90 * App.Plotter.Canvas (Back).Height));
      --  Context.Scale
      --    (0.9 * Float (App.Plotter.Canvas (Back).Width) / 5_000.0,
      --     -0.8 * Float (App.Plotter.Canvas (Back).Height) / 5_000.0);

      --  Context.Get_Drawing_Context_2D (App.Plotter.Canvas (Draw).all);
      --  Context.Begin_Path;
      --  Context.Stroke_Color ("#999");
      --  Context.Line_Width (1);
      --  Context.Set_Line_Dash (Dotted_Dash_List);
      --  for X in 1 .. 25 loop
      --     Context.Move_To (45 * X, 0);
      --     Context.Line_To (45 * X, 400 + 10 * X);
      --  end loop;
      --  Context.Stroke;

      Problem.Plotter_Setup (App.Plotter'Access);

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

   overriding procedure Main
     (Runner : Gnoga_Runner_Type; Problem : GUI_IFace_Access)
   is
   begin
      Gnoga_Runner.Problem := Problem;

      Gnoga.Application.Title (UXS (Problem.Title));

      Gnoga.Application.HTML_On_Close
        ("<h3 style='margin:50px;'>Application closed.<h3>");

      Gnoga.Application.Multi_Connect.Initialize
        (Event => On_App_Connect'Unrestricted_Access,
         Boot  => "boot_bootstrap3.html");

      Gnoga.Application.Multi_Connect.Message_Loop;

   end Main;

end Gnoga_Runner;
