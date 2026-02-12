with Uart;

with Last_Chance_Handler;

procedure Uart_Test is
begin
   Uart.Init;
   Uart.Put_Char ('X');
   loop
      null;
   end loop;
end;