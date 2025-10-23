with Color_Led; use Color_Led;
with board;
with Last_Chance_Handler;
pragma Unreferenced (Board);
procedure Cmd_Led is
begin
Init_led;
Set_LED (Red_Color);

end Cmd_Led;
