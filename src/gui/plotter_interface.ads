-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

package Plotter_Interface is

   type Point_Type is record
      X, Y : Float;
   end record;

   function "=" (A, B : Point_Type) return Boolean is
     (A.X = B.X and then A.Y = B.Y);

   package Point_Package is new Doubly_Linked_Lists (Point_Type);
   subtype Point_List is Point_Package.List;

   type Plotter_IFace is limited interface;
   type Plotter_IFace_Access is access all Plotter_IFace'Class;

   function Initialize
     (P : in out Plotter_IFace; X_Min, X_Max, Y_Min, Y_Max : Integer;
      X0, Y0, Width, Height :        Natural) return Boolean is abstract;

   function Draw_Grid
     (P : in out Plotter_IFace; X_Major, X_Minor, Y_Major, Y_Minor : Natural)
      return Boolean is abstract;

   function Draw_Axes
     (P : in out Plotter_IFace; X_Label, Y_Label : String)
      return Boolean is abstract;

   function Draw_Axes_Square
     (P : in out Plotter_IFace) return Boolean is abstract;

   function Clear_Plot (P : in out Plotter_IFace) return Boolean is abstract;

   --  function Plot (Points : array of Float) return Boolean;

end Plotter_Interface;
