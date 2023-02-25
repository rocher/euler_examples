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
--                 https://projecteuler.net/problem=19
--
--  Counting Sundays
--  ----------------
--
--  You are given the following information, but you may prefer to do some
--  research for yourself.
--
--                 • 1 Jan 1900 was a Monday.
--                 • Thirty days has September,
--                   April, June and November.
--                   All the rest have thirty-one,
--                   Saving February alone,
--                   Which has twenty-eight, rain or shine.
--                   And on leap years, twenty-nine.
--                 • A leap year occurs on any year evenly divisible by 4,
--                   but not on a century unless it is divisible by 400.
--
--  How many Sundays fell on the first of the month during the twentieth
--  century (1 Jan 1901 to 31 Dec 2000)?
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0019_Counting_Sundays is

   type P0019_Type is new Text_IFace with null record;

   overriding function Get_Number (P : P0019_Type) return Natural is (19);

   overriding function Get_Title (P : P0019_Type) return String is
     ("Counting Sundays");

   overriding function Get_Brief (P : P0019_Type) return String is
     ("How many Sundays fell on the first of the month during the " &
      "twentieth century (1 Jan 1901 to 31 Dec 2000)?");

   overriding function Get_Answer (P : P0019_Type) return String;

   overriding function Get_Notes (P : P0019_Type) return String is ("");
end P0019_Counting_Sundays;
