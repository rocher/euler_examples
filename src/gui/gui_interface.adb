-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

package body GUI_Interface is

   function Is_Started (G : GUI_IFace) return Boolean is (G.Status /= Stop);

   function Is_Stopped (G : GUI_IFace) return Boolean is (G.Status = Stop);

   -----------
   -- Start --
   -----------

   procedure Start (G : in out GUI_IFace) is
   begin
      G.Status := Run;
   end Start;

   ----------
   -- Stop --
   ----------

   procedure Stop (G : in out GUI_IFace) is
   begin
      G.Status := Stop;
   end Stop;

   -----------------
   -- Wait_To_Run --
   -----------------

   procedure Wait_To_Continue (G : in out GUI_IFace) is
   begin
      while G.Status = Pause loop
         delay (0.1);
      end loop;
      if G.Status = Step then
         G.Status := Pause;
      end if;
   end Wait_To_Continue;

   -------------
   -- On_Step --
   -------------

   procedure On_Step (G : in out GUI_IFace) is
   begin
      G.Status := Step;
   end On_Step;

   -----------------
   -- On_Continue --
   -----------------

   procedure On_Continue (G : in out GUI_IFace) is
   begin
      G.Status := Run;
   end On_Continue;

   -------------
   -- On_Stop --
   -------------

   procedure On_Stop (G : in out GUI_IFace) is
   begin
      G.Status := Stop;
   end On_Stop;

end GUI_Interface;
