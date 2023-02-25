-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=15
--
--  Lattice paths
--  -------------
--
--  Starting in the top left corner of a 2×2 grid, and only being able to
--  move to the right and down, there are exactly 6 routes to the bottom
--  right corner.
--
--                 [ see diagram ]
--
--  How many such routes are there through a 20×20 grid?
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0015_Lattice_Paths is

   type P0015_Type is new Text_IFace with null record;

   overriding function Get_Number (P : P0015_Type) return Natural is (15);

   overriding function Get_Title (P : P0015_Type) return String is
     ("Lattice paths");

   overriding function Get_Brief (P : P0015_Type) return String is
     ("How many such routes (starting in the top left corner, and only " &
      "being able to move to the right and down) are there through a " &
      "20×20 grid?");

   overriding function Get_Answer (P : P0015_Type) return String;

   overriding function Get_Notes (P : P0015_Type) return String is ("");
end P0015_Lattice_Paths;
