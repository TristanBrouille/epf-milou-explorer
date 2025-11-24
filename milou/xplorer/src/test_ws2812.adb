with Set_Pin; use Set_Pin;
with WS2812; use WS2812;
with board;
with Last_Chance_Handler;
pragma Unreferenced (Board);

procedure Main is
   Led_Pin : constant Set_Pin.GPIO := Set_Pin.Set_Pin (A, 8);
begin
   Init (Led_Pin);
end Main;