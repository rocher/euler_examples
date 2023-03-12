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
--                 https://projecteuler.net/problem=14
--
--  Longest Collatz sequence
--  ------------------------
--
--  The following iterative sequence is defined for the set of positive
--  integers:
--
--                 n → n/2 (n is even)
--                 n → 3n + 1 (n is odd)
--
--  Using the rule above and starting with 13, we generate the following
--  sequence:
--
--                 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
--
--  It can be seen that this sequence (starting at 13 and finishing at 1)
--  contains 10 terms. Although it has not been proved yet (Collatz Problem),
--  it is thought that all starting numbers finish at 1.
--
--  Which starting number, under one million, produces the longest chain?
--
--  NOTE: Once the chain starts the terms are allowed to go above one
--  million.
--
-------------------------------------------------------------------------------

with GUI_Interface;     use GUI_Interface;
with Plotter_Interface; use Plotter_Interface;

package P0014_Longest_Collatz_Sequence is

   type P0014_Type is new GUI_IFace with null record;

   overriding function Number (P : P0014_Type) return Natural is (14);

   overriding function Title (P : P0014_Type) return String is
     ("Longest Collatz sequence");

   overriding function Brief (P : P0014_Type) return String is
     ("Which starting number, under one million, produces the longest " &
      "[Collatz] chain?");

   overriding function Answer (P : P0014_Type) return String;

   overriding function Notes (P : P0014_Type) return String;

   overriding procedure Plotter_Setup
     (P : P0014_Type; Plotter : Plotter_IFace_Access);

   overriding procedure On_Start
     (P : in out P0014_Type; Plotter : Plotter_IFace_Access);

end P0014_Longest_Collatz_Sequence;
