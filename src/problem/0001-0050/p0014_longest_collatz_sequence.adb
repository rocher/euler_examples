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

with Euler_Tools_Int1; use Euler_Tools_Int1;

package body P0014_Longest_Collatz_Sequence is

   Max_Length : Integer_Type := 0;

   ------------
   -- Answer --
   ------------

   overriding function Answer (P : P0014_Type) return String is
      Start  : Integer_Type := 999_999;
      Number : Integer_Type := 0;
      Length : Integer_Type := 0;
      Answer : Integer_Type := 0;
   begin

      loop
         Number := Collatz_First (Start);
         Length := 1;

         loop
            Number := Collatz_Next;
            Length := @ + 1;
            exit when Number = 1;
         end loop;

         if Length > Max_Length then
            Max_Length := Length;
            Answer     := Start;
         end if;

         exit when Start = 99_999;  --  ! Intuition: Start >= 99_999
         Start := Start - 1;
      end loop;

      return To_String (Answer);
   end Answer;

   -----------
   -- Notes --
   -----------

   overriding function Notes (P : P0014_Type) return String is
     ("The chain contains" & Max_Length'Image & " numbers.");

   -------------------
   -- Plotter_Setup --
   -------------------

   overriding procedure Plotter_Setup
     (P : P0014_Type; Plotter : Plotter_IFace_Access)
   is
   begin
      Plotter.Set_Axes
        (X_Min => 0.0, X_Max => 1_000_000.0, Y_Min => 0.0, Y_Max => 600.0);
      Plotter.Draw_Grid
        (X_Major => 100_000.0, X_Minor => 50_000.0, Y_Major => 100.0,
         Y_Minor => 50.0);
      Plotter.Draw_Axes ("Number", "Length");
   end Plotter_Setup;

   overriding procedure On_Start
     (P : in out P0014_Type; Plotter : Plotter_IFace_Access)
   is
      Start  : Integer_Type;
      Number : Integer_Type;
      Length : Integer_Type;
      Answer : Integer_Type;
   begin
      if P.Is_Started then
         return;
      end if;

      P.Start;
      Plotter.Start_Plotter;

      Start  := 999_999;
      Number := 0;
      Length := 0;
      Answer := 0;
      Max_Length := 0;

      loop
         Number := Collatz_First (Start);
         Length := 1;

         loop
            Number := Collatz_Next;
            Length := @ + 1;
            exit when Number = 1;
         end loop;

         if Length > Max_Length then
            Max_Length := Length;
            Answer     := Start;
            Plotter.Rectangle
              (Float (Start), 0.0, Float (Start) + 1.0, Float (Length),
               "#f33");
         else
            Plotter.Rectangle
              (Float (Start), 0.0, Float (Start) + 1.0, Float (Length),
               "#ccc");
         end if;

         exit when Start = 99_999;  --  ! Intuition: Start >= 99_999
         Start := Start - 1;

         delay (0.001);
         P.Wait_To_Continue;
         if P.Is_Stopped then
            return;
         end if;
      end loop;

      P.Stop;
      Plotter.Stop_Plotter;
   end On_Start;

end P0014_Longest_Collatz_Sequence;
