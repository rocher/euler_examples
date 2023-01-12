--
--  The following problem is take from Project Euler:
--
--                 https://projecteuler.net/problem=14
--
--  Longest Collatz Sequence
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
--  it is thought that all starting numbers finish at 1. Which starting
--  number, under one million, produces the longest chain?
--
--  NOTE: Once the chain starts the terms are allowed to go above one
--  million.

with Ada.Text_IO;
with Euler_Tools;

procedure P0014_Longest_Collatz_Sequence is

   package Natural_Tools is new Euler_Tools (Long_Integer);
   use Natural_Tools;

   Start      : Long_Integer := 999_999;
   Number     : Long_Integer := 0;
   Length     : Long_Integer := 0;
   Max_Length : Long_Integer := 0;
   Answer     : Long_Integer := 0;

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

      exit when Start = 99_999;
      Start := Start - 1;
   end loop;

   Ada.Text_IO.Put_Line ("Answer:" & Answer'Image);

end P0014_Longest_Collatz_Sequence;
