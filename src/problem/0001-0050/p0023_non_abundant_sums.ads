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
--                 https://projecteuler.net/problem=23
--
--  Non-abundant sums
--  -----------------
--
--  A perfect number is a number for which the sum of its proper divisors is
--  exactly equal to the number. For example, the sum of the proper divisors
--  of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect
--  number.
--
--  A number n is called deficient if the sum of its proper divisors is less
--  than n and it is called abundant if this sum exceeds n.
--
--  As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
--  smallest number that can be written as the sum of two abundant numbers is
--  24. By mathematical analysis, it can be shown that all integers greater
--  than 28123 can be written as the sum of two abundant numbers. However,
--  this upper limit cannot be reduced any further by analysis even though it
--  is known that the greatest number that cannot be expressed as the sum of
--  two abundant numbers is less than this limit.
--
--  Find the sum of all the positive integers which cannot be written as the
--  sum of two abundant numbers.
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package P0023_Non_Abundant_Sums is

   type P0023_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0023_Type) return Natural is (23);

   overriding function Get_Title (P : P0023_Type) return String is
     ("Non-abundant sums");

   overriding function Get_Brief (P : P0023_Type) return String is
     ("Find the sum of all the positive integers which cannot be written " &
      "as the sum of two abundant numbers.");

   overriding function Get_Answer (P : P0023_Type) return String;

   overriding function Get_Notes (P : P0023_Type) return String;
end P0023_Non_Abundant_Sums;
