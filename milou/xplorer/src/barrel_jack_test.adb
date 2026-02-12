with Barrel_Jack;
with Uart;

with Last_Chance_Handler;

procedure Barrel_Jack_Test is
begin
   Barrel_Jack.Init;
   Uart.Init;
   loop
      Uart.Put_Str (Barrel_Jack.Get_Status'Image);
      Uart.Put_New_Line;
      delay 2.0;
   end loop;
end;