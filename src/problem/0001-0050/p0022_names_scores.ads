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
--                 https://projecteuler.net/problem=22
--
--  Names scores
--  ------------
--
--  Using names.txt (right click and 'Save Link/Target As...'), a 46K text
--  file containing over five-thousand first names, begin by sorting it into
--  alphabetical order. Then working out the alphabetical value for each
--  name, multiply this value by its alphabetical position in the list to
--  obtain a name score.
--
--  For example, when the list is sorted into alphabetical order, COLIN,
--  which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
--  So, COLIN would obtain a score of 938 × 53 = 49714.
--
--  What is the total of all the name scores in the file?
--
-------------------------------------------------------------------------------

with TUI_Interface; use TUI_Interface;

package P0022_Names_Scores is

   type P0022_Type is new TUI_IFace with null record;

   overriding function Number (P : P0022_Type) return Natural is (22);

   overriding function Title (P : P0022_Type) return String is
     ("Names scores");

   overriding function Brief (P : P0022_Type) return String is
     ("What is the total of all the name scores in the file?");

   overriding function Answer (P : P0022_Type) return String;

   overriding function Notes (P : P0022_Type) return String is ("");
end P0022_Names_Scores;
