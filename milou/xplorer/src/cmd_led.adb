with Color_led; use Color_led;
with Ada.Text_IO; use Ada.Text_IO;
with board;
procedure Cmd_Led is
   --Altitude : Integer := 0;
begin
   Color_led.LED_Blue;
   --put_Line ("Cmd_Led started");
   -- Color_led.LED_Color (Color_led.Altitude_To_Color (Altitude));
   -- loop
   --    Color_led.LED_Blue;
   --    delay 1.0;
   --    Color_led.LED_Red;
   --    delay 1.0;
   --    Color_led.LED_Green;
   --    delay 1.0;
   -- end loop;
end Cmd_Led;
