with STM32G431xx.RCC;  use STM32G431xx.RCC;
with STM32G431xx.GPIO; use STM32G431xx.GPIO;
with STM32G431xx.TIM; use STM32G431xx.TIM;
with STM32G431xx; use STM32G431xx;
with Ada.Real_Time;         use Ada.Real_Time;
with Set_Pin_Stm32;         use Set_Pin_Stm32;

package body WS2812 is

   T0H : constant := 60;
   T1H : constant := 120;

   procedure Config is
      begin
      RCC_Periph.AHB2ENR.GPIOAEN := 1;
      RCC_Periph.APB2ENR.TIM1EN := 1;

      GPIOA_Periph.MODER.Arr (8) := 2#10#;   -- AF
      GPIOA_Periph.AFRH.Arr (8) := 6;       -- AF6 TIM1_CH1
      GPIOA_Periph.OSPEEDR.Arr (8) := 2#11#;   -- High speed
      GPIOA_Periph.OTYPER.OT.Arr (8) := 0;       -- Push-pull
      GPIOA_Periph.PUPDR.Arr (8) := 2#00#;   -- No pull

      TIM1_Periph.PSC.PSC := PSC_PSC_Field (0);      -- 170 MHz
      TIM1_Periph.ARR.ARR := ARR_ARR_Field (212);    -- 1.25 us
      TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (0);  -- start LOW

      TIM1_Periph.CCMR1_Output.CC1S := 0;           -- output
      TIM1_Periph.CCMR1_Output.OC1M := 2#110#;      -- PWM mode 1
      TIM1_Periph.CCMR1_Output.OC1PE := 1;           -- preload

      TIM1_Periph.CCER.CC1P := 0;                    -- non-inverted
      TIM1_Periph.CCER.CC1E := 1;                    -- enable CH1

      TIM1_Periph.CR1.ARPE := 1;
      TIM1_Periph.EGR.UG := 1;                     -- load regs, reset CNT
      TIM1_Periph.BDTR.MOE := 1;                   -- main output enable
      TIM1_Periph.SR.UIF := 0;                     -- clear update flag
      TIM1_Periph.CR1.CEN := 1;                     -- start timer
   end;

   procedure Init (Self : in out WS2812_Device_T) is
   begin
      Config;
   end Init;

   procedure Set_GRB_At (Self : in out WS2812_Device_T; 
                         Index : Positive; 
                         Color : Color_T) is
   begin
      Self.Leds (Index) := Color;
   end;
   procedure Set_GRB_All (Self : in out WS2812_Device_T; 
                          Color : Color_T) is
   begin
      for I in Self.Leds'Range loop
         Self.Leds (I) := Color;
      end loop;
   end;

   procedure Wait_Update is
   begin
      while TIM1_Periph.SR.UIF = 0 loop
         null;
      end loop;
      TIM1_Periph.SR.UIF := 0; -- clear flag
   end Wait_Update;

   type Channel_Array_T is array (Positive range 1 .. U8_T'Size) of U1_T;
   pragma Pack (Channel_Array_T);

   type Bit_Array_T is array (Positive range <>) of U1_T;
   pragma Pack (Bit_Array_T);

   procedure Show (Self : WS2812_Device_T) is
      Bits : Bit_Array_T (1 .. Self.Leds'Length * Color_T'Size) := (others => 0);
   begin
      for L in Self.Leds'Range loop
         declare
            Red   : Channel_Array_T with Address => Self.Leds (L).R'Address;
            Green : Channel_Array_T with Address => Self.Leds (L).G'Address;
            Blue  : Channel_Array_T with Address => Self.Leds (L).B'Address;
            Base_Idx : Natural := ((L - 1) * Color_T'Size);
         begin
            for I in 1 .. 8 loop
               Bits (Base_Idx + I) := Green (I);
               Bits (Base_Idx + I + 8) := Red (I);
               Bits (Base_Idx + I + 16) := Blue (I);
            end loop;
         end;
      end loop;

      Wait_Update;
      for I in Bits'Range loop
         if Bits (I) = 0 then
            TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (T0H); 
         else
            TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (T1H); 
         end if;
         Wait_Update; 
      end loop;
      Wait_Update;
   
      TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (0);
      for K in 1 .. 64 loop
         Wait_Update;
      end loop;
   end;

   procedure Clear (Self : WS2812_Device_T) is   
   begin
      Wait_Update;
      for L in Self.Leds'Range loop
         for I in 1 .. Color_T'Size loop
            TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (T0H); 
            Wait_Update; 
         end loop;
      end loop;
      Wait_Update;
      
      TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (0);
      for K in 1 .. 64 loop
         Wait_Update;
      end loop;
   end;
end WS2812;
