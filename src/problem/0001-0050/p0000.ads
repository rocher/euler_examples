with Text_Interface; use Text_Interface;

package P00NUM_DESC is

   type P00NUM_Type is new Text_IFace with null record;

   overriding function Number (P : P00NUM_Type) return Natural is (NUM);

   overriding function Title (P : P00NUM_Type) return String is ("");

   overriding function Brief (P : P00NUM_Type) return String is ("");

   overriding function Answer (P : P00NUM_Type) return String;

   overriding function Notes (P : P00NUM_Type) return String is ("");
end P00NUM_DESC;
