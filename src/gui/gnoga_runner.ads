-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with GUI_Interface;    use GUI_Interface;
with Runner_Interface; use Runner_Interface;

package Gnoga_Runner is

   type Gnoga_Runner_Type is new Runner_IFace with null record;

   overriding procedure Main
     (Runner : Gnoga_Runner_Type; Problem : GUI_IFace_Access);

end Gnoga_Runner;
