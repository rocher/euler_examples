-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View.Console;
with UXStrings;

package body GUI_Runner is

   function UXS
     (Item : UXStrings.ASCII_Character_Array) return UXStrings.UXString renames
     UXStrings.From_ASCII;

   procedure Main (Problem : Graphic_Type'Class) is
      use Gnoga;
      use all type Gnoga.String;

      App_Window : Gnoga.Gui.Window.Window_Type;
      App_View   : Gnoga.Gui.View.Console.Console_View_Type;
   begin
      Gnoga.Application.Title (UXS (Problem.Get_Title));
      Gnoga.Application.Singleton.Initialize (App_Window);

      App_View.Create (App_Window, "app-view");
      App_View.Put_HTML
        (UXS ("<h2>Problem " & Problem.Get_Number'Image & "</h2>"));
      App_View.Put_HTML (UXS ("<h1>" & Problem.Get_Title & "</h1>"));
      App_View.Put_HTML (UXS ("<i>" & Problem.Get_Brief & "</i>"));
      App_View.Put_HTML
        (UXS ("<pre>Answer: " & Problem.Get_Answer & "</pre>"));

      Gnoga.Application.Singleton.End_Application;
   end Main;

end GUI_Runner;
