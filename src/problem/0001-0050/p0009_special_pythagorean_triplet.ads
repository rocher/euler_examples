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
--                 https://projecteuler.net/problem=9
--
--  Special Pythagorean triplet
--  ---------------------------
--
--  A Pythagorean triplet is a set of three natural numbers, a < b < c, for
--  which,
--
--                 a² + b² = c²
--
--  For example, 3² + 4² = 9 + 16 = 25 = 5².
--
--  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
--  Find the product abc.
--
-------------------------------------------------------------------------------

with Text_Interface; use Text_Interface;

package P0009_Special_Pythagorean_Triplet is

   type P0009_Type is new Text_IFace with null record;

   overriding function Number (P : P0009_Type) return Natural is (9);

   overriding function Title (P : P0009_Type) return String is
     ("Special Pythagorean triplet");

   overriding function Brief (P : P0009_Type) return String is
     ("There exists exactly one Pythagorean triplet for which " &
      "a + b + c = 1000. Find the product abc.");

   overriding function Answer (P : P0009_Type) return String;

   overriding function Notes (P : P0009_Type) return String;
end P0009_Special_Pythagorean_Triplet;
