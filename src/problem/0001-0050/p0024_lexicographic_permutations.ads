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
--                 https://projecteuler.net/problem=24
--
--  Lexicographic permutations
--  --------------------------
--
--  A permutation is an ordered arrangement of objects. For example, 3124 is
--  one possible permutation of the digits 1, 2, 3 and 4. If all of the
--  permutations are listed numerically or alphabetically, we call it
--  lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
--
--                 012   021   102   120   201   210
--
--  What is the millionth lexicographic permutation of the digits 0, 1, 2, 3,
--  4, 5, 6, 7, 8 and 9?
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0024_Lexicographic_Permutations is

   type P0024_Type is new Text_IFace with null record;

   overriding function Get_Number (P : P0024_Type) return Natural is (24);

   overriding function Get_Title (P : P0024_Type) return String is
     ("Lexicographic permutations");

   overriding function Get_Brief (P : P0024_Type) return String is
     ("What is the millionth lexicographic permutation of the digits 0, 1, " &
      "2, 3, 4, 5, 6, 7, 8 and 9?");

   overriding function Get_Answer (P : P0024_Type) return String;

   overriding function Get_Notes (P : P0024_Type) return String is ("");
end P0024_Lexicographic_Permutations;
