with Interfaces.STM32.RCC;  use Interfaces.STM32.RCC;
with Interfaces.STM32.GPIO; use Interfaces.STM32.GPIO;
with Interfaces.STM32.TIM;  use Interfaces.STM32.TIM;
with Interfaces.STM32;      use Interfaces.STM32;
with Ada.Real_Time;         use Ada.Real_Time;

package body Color_led is
   procedure Init_LED is
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

   procedure Wait_Update is
   begin
      while TIM1_Periph.SR.UIF = 0 loop
         null;
      end loop;
      TIM1_Periph.SR.UIF := 0; -- clear flag
   end Wait_Update;

   procedure Set_LED (C : Color_Array) is
   begin
      -- send 24 bits
      for I in C'Range loop
         if C (I) = 0 then
            TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (59);   -- ~0.35 us high
            Wait_Update;

         else
            TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (119);  -- ~0.70 us high
            Wait_Update;

         end if;
      end loop;

   end Set_LED;

   procedure Latch_Period is
   begin
      -- Latch period: hold low for >= 80 us
      TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (0);
      for K in 1 .. 64 loop
         -- 64 * 1.25 us ≈ 80 us
         Wait_Update;
      end loop;
      Wait_Update;
   end Latch_Period;
end Color_led;
