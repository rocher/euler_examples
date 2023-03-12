-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with P0014_Longest_Collatz_Sequence;
with Gnoga_Runner; use Gnoga_Runner;

procedure G0014_Longest_Collatz_Sequence is

   Runner : Gnoga_Runner_Type;
   P0014  : P0014_Longest_Collatz_Sequence.P0014_Type;

begin

   Runner.Main (P0014'Unrestricted_Access);

end G0014_Longest_Collatz_Sequence;
