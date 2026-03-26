with Uart;

procedure Uart_Test is
begin
   Uart.Init;
   Uart.Put_Char ('X');
   loop
      null;
   end loop;
end;