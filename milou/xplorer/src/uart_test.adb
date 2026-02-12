with Uart;

with Last_Chance_Handler;

procedure Uart_Test is
begin
   Uart.Put_Char ('y');
   loop
      null;
   end loop;
end;