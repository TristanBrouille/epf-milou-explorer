with Color_Led; use Color_Led;
with board;
with Last_Chance_Handler;
pragma Unreferenced (Board);
procedure Cmd_Led is
begin
   Init_LED;
   Set_LED (Green_Color);
   delay 0.5;
   Set_LED (Red_Color);
   delay 0.5;
   Set_LED (Blue_Color);
   delay 0.5;

   loop  
      null;
   end loop;
   
end Cmd_Led;
