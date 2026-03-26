package Uart is
   procedure Init;
   procedure Put_Char (C : Character);
      procedure Put_Str (S: String);
   procedure Put_New_Line;
end Uart;