-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

package Plotter_Interface is

   type Math_Point is record
      X, Y : Float;
   end record;

   type Device_Point is record
      X, Y : Natural;
   end record;

   overriding function "=" (A, B : Math_Point) return Boolean is
     (A.X = B.X and then A.Y = B.Y);

   package Point_Package is new Doubly_Linked_Lists (Math_Point);
   subtype Point_List is Point_Package.List;

   type Plotter_IFace is limited interface;
   type Plotter_IFace_Access is access all Plotter_IFace'Class;

   procedure Set_Axes (P : in out Plotter_IFace; Min, Max : Float) is abstract;

   procedure Set_Axes
     (P                          : in out Plotter_IFace;
      X_Min, X_Max, Y_Min, Y_Max :        Float) is abstract;

   procedure Draw_Grid
     (P                                  : in out Plotter_IFace;
      X_Major, X_Minor, Y_Major, Y_Minor :        Float) is abstract;

   procedure Draw_Axes
     (P : in out Plotter_IFace; X_Label, Y_Label : String) is abstract;

   procedure Draw_Axes_Square (P : in out Plotter_IFace) is abstract;

   procedure Clear_Plot (P : in out Plotter_IFace) is abstract;

   procedure Plot
     (P     : in out Plotter_IFace; Points : Point_List;
      Color :        String) is abstract;

   procedure Rectangle
     (P     : in out Plotter_IFace; X0, Y0, X1, Y1 : Float;
      color :        String) is abstract;

   procedure Arc
     (P : in out Plotter_IFace; X0, Y0, Radius, Start_Angle, End_Angle : Float;
      color :        String) is abstract;

end Plotter_Interface;
