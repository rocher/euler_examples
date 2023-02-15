with Euler_Tools; use Euler_Tools;

package body P00NUM_DESC is

   overriding function Get_Answer (P : P00NUM_Type) return String is
      Answer : Natural;
   begin

      return To_String (Answer);
   end Get_Answer;

end P00NUM_DESC;
