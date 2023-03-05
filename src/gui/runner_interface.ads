-------------------------------------------------------------------------------
--
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gnail.com>
--  SPDX-License-Identifier: CC-BY-NC-SA-4.0
--  https://creativecommons.org/licenses/by-nc-sa/4.0/
--
-------------------------------------------------------------------------------

with GUI_Interface; use GUI_Interface;

package Runner_Interface is

   type Runner_IFace is interface;

   procedure Main (Runner : Runner_IFace; GUI : GUI_IFace_Access) is abstract;

end Runner_Interface;
