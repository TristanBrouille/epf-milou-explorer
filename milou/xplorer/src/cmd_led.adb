with Color_led;
with board;
with Last_Chance_Handler;
pragma Unreferenced (Board);
procedure Cmd_Led is
begin
   Color_led.PWM_LED;
end Cmd_Led;
