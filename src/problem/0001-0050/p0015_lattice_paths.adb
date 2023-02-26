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

with Euler_Tools_Int3; use Euler_Tools_Int3;

package body P0015_Lattice_Paths is

   overriding function Answer (P : P0015_Type) return String is
      Answer : Integer_Type;
   begin
      Answer := Combination (40, 20);

      return To_String (Answer);
   end Answer;

end P0015_Lattice_Paths;
