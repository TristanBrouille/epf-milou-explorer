with WS2812; use WS2812;
with Last_Chance_Handler;
with board;

procedure Test_Leds is
   Leds : WS2812_Device_T (144);
   Counter : U8_T := 0;
begin
   Init (Leds);
   --  for I in 0 .. 255 loop
   --     Counter := U8_T (I);
   --     Set_GRB_At (Leds, 1, (Counter, Counter, Counter));
   --     Set_GRB_At (Leds, 2, (15, 0, 0));
   --     Show (Leds);
   --     delay 0.25;
   --     Set_GRB_At (Leds, 2, (0, 0, 0));
   --     Set_GRB_At (Leds, 1, (Counter, Counter, Counter));
   --     Show (Leds);
   --     delay 0.25;
   --  end loop;
   Set_GRB_All (Leds, (0, 0, 255));
   Show (Leds);
   --  delay 2.0;
   --  Clear (Leds);
   --  loop
   --     null;
   --  end loop;
end Test_Leds;