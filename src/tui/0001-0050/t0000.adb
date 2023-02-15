-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with P00NUM_DESC;
with TUI_Runner;

procedure T00NUM_DESC is
   P00NUM : P00NUM_DESC.P00NUM_Type;
begin
   TUI_Runner.Main (P00NUM);
end T00NUM_DESC;
