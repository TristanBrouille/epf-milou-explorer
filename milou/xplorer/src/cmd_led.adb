with Color_Led; use Color_Led;
with board;
with Last_Chance_Handler;
pragma Unreferenced (Board);
procedure Cmd_Led is
begin
   Set_LED (Green_Color);
end Cmd_Led;
