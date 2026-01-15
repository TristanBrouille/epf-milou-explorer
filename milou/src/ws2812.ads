with Set_Pin_Stm32; use Set_Pin_Stm32;
with Interfaces.STM32;

package WS2812 is
   type U8_T is range 0 .. 255 with Size => 8;
   type WS2812_Device_T (Num_Leds : Positive) is private;
   type Color_T is record
      R : U8_T := 0;
      G : U8_T := 0;
      B : U8_T := 0;
   end record;
   procedure Init (Self : in out WS2812_Device_T);
   procedure Set_GRB_At
     (Self : in out WS2812_Device_T; Index : Positive; Color : Color_T);
   procedure Set_GRB_All (Self : in out WS2812_Device_T; Color : Color_T);
   procedure Show (Self : WS2812_Device_T);
   procedure Clear (Self : WS2812_Device_T);

private
   type U1_T is mod 2**1 with Size => 1;

   type Colors_T is array (Positive range <>) of Color_T;
   type WS2812_Device_T (Num_Leds : Positive) is record
      Leds : Colors_T (1 .. Num_Leds) := (others => (0, 0, 0));
   end record;
end WS2812;
