-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with AnsiAda; use AnsiAda;
with Text_IO; use Text_IO;

package body Problem_Runner is

   procedure Main (Problem : Problem_Type'Class) is
      Indent   : constant String  := "   ";
      Use_Ansi : constant Boolean := False;
   begin
      if Use_Ansi then
         Put_Line
           (Color_Wrap
              (Text       =>
                 " Problem" & Problem.Get_Number'Image & " - " &
                 Problem.Get_Title & " ",
               Foreground => Foreground (Black),
               Background => Background (Light_Grey)));
      else
         Put_Line
           ("Problem" & Problem.Get_Number'Image & " - " & Problem.Get_Title);
      end if;

      Put (Indent);
      if Use_Ansi then
         Put_Line (Style_Wrap (Problem.Get_Brief, Underline));
      else
         Put_Line (Problem.Get_Brief);
      end if;

      Put_Line (Indent & "Answer: " & Problem.Get_Answer);

      declare
         Notes : constant String := Problem.Get_Notes;
      begin
         if Notes'Length > 0 then
            Put_Line (Indent & "Note: " & Notes);
         end if;
      end;

   end Main;

end Problem_Runner;
