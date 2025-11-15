with Color_Led; use Color_Led;
with board;
with Last_Chance_Handler;
pragma Unreferenced (Board);
procedure Cmd_Led is
begin
   Init_LED;
   Set_LED (Green_Color);
   Set_LED (Green_Color);
   Latch_Period;
   delay 0.5;
   Set_LED (Red_Color);
   Set_LED (Red_Color);  
   Latch_Period;
   delay 0.5;
   Set_LED (Blue_Color);
   Set_LED (Blue_Color);
   Set_LED (Padding);

   Latch_Period;
   delay 0.5;
end Cmd_Led;