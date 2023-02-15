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
--                 https://projecteuler.net/problem=27
--
--  Quadratic primes
--  ----------------
--
--  Euler discovered the remarkable quadratic formula:
--
--                 n² + n + 41
--
--  It turns out that the formula will produce 40 primes for the consecutive
--  integer values 0 <= n <= 39. However, when n=40, 40²+40+41=40(40+1)+41 is
--  divisible by 41, and certainly when n=41, 41²+41+41 is clearly divisible
--  by 41.
--
--  The incredible formula n² - 79n + 1601 was discovered, which produces 80
--  primes for the consecutive values 0 <= n <= 79. The product of the
--  coefficients, −79 and 1601, is −126479.
--
--  Considering quadratics of the form:
--
--                 n² + an + b, where |a| < 1000 and |b| <= 1000
--
--  where |n| is the modulus/absolute value of n
--
--  Find the product of the coefficients, a and b, for the quadratic
--  expression that produces the maximum number of primes for consecutive
--  values of n, starting with n=0.
--
-------------------------------------------------------------------------------

with Problem_Interface; use Problem_Interface;

package P0027_Quadratic_Primes is

   type P0027_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P0027_Type) return Natural is (27);

   overriding function Get_Title (P : P0027_Type) return String is
     ("Quadratic primes");

   overriding function Get_Brief (P : P0027_Type) return String is
     ("Find the product of the coefficients, a and b, for the quadratic " &
      "expression that produces the maximum number of primes for " &
      "consecutive values of n, starting with n=0.");

   overriding function Get_Answer (P : P0027_Type) return String;

   overriding function Get_Notes (P : P0027_Type) return String;
end P0027_Quadratic_Primes;
