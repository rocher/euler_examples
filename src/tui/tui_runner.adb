-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Ada.Strings.Unbounded;
with AnsiAda; use AnsiAda;
with Text_IO; use Text_IO;

package body TUI_Runner is

   Indent    : constant String  := "   ";
   Par_Width : constant Natural := 80;
   Use_Ansi  : constant Boolean := False;

   function Fill_Paragraph (Text : String) return String is
      use Ada.Strings.Unbounded;
      Head, Tail : Unbounded_String;
      Cut        : Natural;
   begin
      if Text'Length > Par_Width then
         Head := Null_Unbounded_String;
         Tail := To_Unbounded_String (Text);
         loop
            Cut := Par_Width;
            loop
               exit when Tail.Element (Cut) = ' ';
               Cut := Cut - 1;
            end loop;
            Head := Head & Tail.Unbounded_Slice (1, Cut - 1) & ASCII.LF;
            Tail := Indent & Tail.Unbounded_Slice (Cut + 1, Tail.Length);
            exit when Tail.Length <= Par_Width;
         end loop;
         return To_String (Head & Tail);
      end if;
      return Text;
   end Fill_Paragraph;

   procedure Main (Problem : Text_IFace'Class) is
   begin
      if Use_Ansi then
         Put_Line
           (Color_Wrap
              (Text       =>
                 " Problem" & Problem.Number'Image & " - " &
                 Problem.Title & " ",
               Foreground => Foreground (Black),
               Background => Background (Light_Grey)));
      else
         Put_Line
           ("Problem" & Problem.Number'Image & " - " & Problem.Title);
      end if;

      Put (Indent);
      if Use_Ansi then
         Put_Line (Style_Wrap (Fill_Paragraph (Problem.Brief), Underline));
      else
         Put_Line (Fill_Paragraph (Problem.Brief));
      end if;

      Put_Line (Indent & "Answer: " & Problem.Answer);

      declare
         Notes : constant String := Problem.Notes;
      begin
         if Notes'Length > 0 then
            Put_Line (Indent & "Note: " & Notes);
         end if;
      end;

   end Main;

end TUI_Runner;
