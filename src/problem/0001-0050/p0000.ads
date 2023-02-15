with Problem_Interface; use Problem_Interface;

package P00NUM_DESC is

   type P00NUM_Type is new Problem_Type with null record;

   overriding function Get_Number (P : P00NUM_Type) return Natural is (NUM);

   overriding function Get_Title (P : P00NUM_Type) return String is ("");

   overriding function Get_Brief (P : P00NUM_Type) return String is ("");

   overriding function Get_Answer (P : P00NUM_Type) return String;

   overriding function Get_Notes (P : P00NUM_Type) return String is ("");
end P00NUM_DESC;
