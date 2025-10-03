with Interfaces.STM32.RCC;  use Interfaces.STM32.RCC;
with Interfaces.STM32.GPIO; use Interfaces.STM32.GPIO;
with Interfaces.STM32.TIM;  use Interfaces.STM32.TIM;
with Ada.Real_Time;         use Ada.Real_Time;

package body Color_led is
   procedure Set_LED (C : Color_Array) is

      Bit_Count : constant := C'Length;

      -- Variables de PWM
      Period        : Time_Span := Nanoseconds (1250); -- 1.25 µs
      Latch_Period  : constant Time_Span := Microseconds (100); -- 100 µs pour latch
      Next_Release  : Time := Clock;
      Counter       : Positive := 1;

      procedure Out_Bit (B : Bit) is
      begin
         if B = 0 then
            TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (33);
         else
            TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (66);
         end if;
      end Out_Bit;

   begin
      -- Initialisation des périphériques
      RCC_Periph.AHB2ENR.GPIOAEN := 1;               -- GPIOA clock
      RCC_Periph.APB2ENR.TIM1EN  := 1;               -- TIM1 clock
      GPIOA_Periph.MODER.Arr (8) := 2#10#;           -- Alternate Function
      GPIOA_Periph.AFRH.Arr (8)  := 6;               -- AF6 = TIM1_CH1
      GPIOA_Periph.OSPEEDR.Arr (8) := 2#11#;         -- High speed
      GPIOA_Periph.OTYPER.OT.Arr (8) := 0;           -- Push-pull
      GPIOA_Periph.PUPDR.Arr (8) := 2#00#;           -- No pull
      TIM1_Periph.PSC.PSC := PSC_PSC_Field (1);      -- Prescaler
      TIM1_Periph.ARR.ARR := ARR_ARR_Field (105);    -- Auto-reload pour PWM
      TIM1_Periph.CCMR1_Output.CC1S  := 0;
      TIM1_Periph.CCMR1_Output.OC1M  := 2#110#;
      TIM1_Periph.CCMR1_Output.OC1PE := 1;
      TIM1_Periph.CCER.CC1E := 1;
      TIM1_Periph.CR1.ARPE := 1;
      TIM1_Periph.EGR.UG   := 1;
      TIM1_Periph.CR1.CEN  := 1;
      TIM1_Periph.BDTR.MOE := 1;
      Next_Release := Clock;

      -- Boucle principale de PWM
      loop
         -- Choisir la période normale ou la période de latch
         Period := (if Counter = Bit_Count then Latch_Period else Period);
         Next_Release := Next_Release + Period;

         if Counter /= Bit_Count then
            Out_Bit (C (Counter));
         end if;

         Counter := (if Counter = C'Last 
                              then C'First
                              else Counter + 1);

         delay until Next_Release;
      end loop;
   end Set_LED;
end Color_led;