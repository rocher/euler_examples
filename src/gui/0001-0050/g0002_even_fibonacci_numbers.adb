-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with P0002_Even_Fibonacci_Numbers;
with Gnoga_Runner; use Gnoga_Runner;

procedure G0002_Even_Fibonacci_Numbers is

   Runner : Gnoga_Runner_Type;
   P0002  : P0002_Even_Fibonacci_Numbers.P0002_Type;

begin

   Runner.Main (P0002'Unrestricted_Access);

end G0002_Even_Fibonacci_Numbers;
