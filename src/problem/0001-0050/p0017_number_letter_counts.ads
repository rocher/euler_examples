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
--                 https://projecteuler.net/problem=17
--
--  Number letter counts
--  --------------------
--
--  If the numbers 1 to 5 are written out in words: one, two, three, four,
--  five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
--
--  If all the numbers from 1 to 1000 (one thousand) inclusive were written
--  out in words, how many letters would be used?
--
--  NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
--  forty-two) contains 23 letters and 115 (one hundred and fifteen) contains
--  20 letters. The use of "and" when writing out numbers is in compliance
--  with British usage.
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package P0017_Number_Letter_Counts is

   type P0017_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0017_Type) return Natural is (17);

   overriding function Get_Title (P : P0017_Type) return String is
     ("Number letter counts");

   overriding function Get_Brief (P : P0017_Type) return String is
     ("If all the numbers from 1 to 1000 (one thousand) inclusive were " &
      "written out in words, how many letters would be used?");

   overriding function Get_Answer (P : P0017_Type) return String;

   overriding function Get_Notes (P : P0017_Type) return String is ("");
end P0017_Number_Letter_Counts;
