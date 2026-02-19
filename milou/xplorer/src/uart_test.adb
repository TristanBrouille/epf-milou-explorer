
with Uart;

with Last_Chance_Handler;

procedure Uart_Test is
begin
   Uart.Init;
   Barrel_Jack.Init;
   while not Barrel_Jack.Is_Detached loop
         null;
   end loop;
   Uart.Put_Char ('y');
   loop
      null;
   end loop;
end;