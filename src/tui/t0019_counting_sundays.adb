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

with Ada.Text_IO;    use Ada.Text_IO;
with Euler_Calendar; use Euler_Calendar;

procedure T0019_Counting_Sundays is

   Answer : Natural := 0;

begin

   for Year in 1_901 .. 2_000 loop
      for Month in Month_Type loop
         if Weekday (Year, Month, 1) = Sun then
            Answer := @ + 1;
         end if;
      end loop;
   end loop;

   Put_Line ("Answer:" & Answer'Image);

end T0019_Counting_Sundays;
