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

with Ada.Text_IO; use Ada.Text_IO;

with Euler_Text; use Euler_Text;

procedure P0017_Number_Letter_Counts is

   Answer : Natural := 0;

begin

   for Number in 1 .. 1_000 loop
      declare
         Text : constant String := To_Words (Number);
      begin
         for Char of Text loop
            if Char in 'a' .. 'z' then
               Answer := @ + 1;
            end if;
         end loop;
      end;
   end loop;

   Put_Line ("Answer:" & Answer'Image);

end P0017_Number_Letter_Counts;
