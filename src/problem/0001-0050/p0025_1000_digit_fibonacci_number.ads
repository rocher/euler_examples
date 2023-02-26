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
--                 https://projecteuler.net/problem=25
--
--  1000-digit Fibonacci number
--  ---------------------------
--
--  The Fibonacci sequence is defined by the recurrence relation:
--
--                 Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
--
--  Hence the first 12 terms will be:
--
--                 F1 = 1
--                 F2 = 1
--                 F3 = 2
--                 F4 = 3
--                 F5 = 5
--                 F6 = 8
--                 F7 = 13
--                 F8 = 21
--                 F9 = 34
--                 F10 = 55
--                 F11 = 89
--                 F12 = 144
--
--  The 12th term, F12, is the first term to contain three digits.
--
--  What is the index of the first term in the Fibonacci sequence to contain
--  1000 digits?
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0025_1000_Digit_Fibonacci_Number is

   type P0025_Type is new Text_IFace with null record;

   overriding function Number (P : P0025_Type) return Natural is (25);

   overriding function Title (P : P0025_Type) return String is
     ("1000-digit Fibonacci number");

   overriding function Brief (P : P0025_Type) return String is
     ("What is the index of the first term in the Fibonacci sequence to " &
      "contain 1000 digits?");

   overriding function Answer (P : P0025_Type) return String;

   overriding function Notes (P : P0025_Type) return String is ("");
end P0025_1000_Digit_Fibonacci_Number;
