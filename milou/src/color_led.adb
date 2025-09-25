with Interfaces.STM32.RCC;  use Interfaces.STM32.RCC;
with Interfaces.STM32.GPIO; use Interfaces.STM32.GPIO;
with Interfaces.STM32.TIM;  use Interfaces.STM32.TIM;
with Ada.Real_Time;         use Ada.Real_Time;
with Ada.Text_IO;         use Ada.Text_IO;

package body Color_led is

   Red_Color : constant Color_Array := ( 
      0, 0, 0, 0, 0, 0, 0, 0, -- 8 bits à 1 pour le rouge
      1, 1, 0, 0, 0, 0, 0, 0, -- 16 bits à 0 pour le reste
      0, 0, 0, 0, 0, 0, 0, 0
   );
   Green_Color : constant Color_Array := ( 
      1, 1, 1, 1, 1, 1, 1, 1, -- 8 bits à 1 pour le rouge
      0, 0, 0, 0, 0, 0, 0, 0, -- 16 bits à 0 pour le reste
      0, 0, 0, 0, 0, 0, 0, 0
   );

   Blue_Color : constant Color_Array := ( 
      0, 0, 0, 0, 0, 0, 0, 0, -- 16 bits à 0 pour le reste
      0, 0, 0, 0, 0, 0, 0, 0,
      1, 1, 1, 1, 1, 1, 1, 1
   );
   procedure Out_Bit (B : Bit) is
   begin
      if B = 0 then
         TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (33);
      else
         TIM1_Periph.CCR1.CCR1 := CCR1_CCR1_Field (66);
      end if;
   end Out_Bit;

   procedure LED_Color (Color : Color_Array) is

      Bit_Count : constant := Color'Length;

      -- Variables de PWM
      Period        : Time_Span := Nanoseconds (1250); -- 1.25 µs
      Next_Release  : Time := Clock;
      Counter       : Positive := Color_Array'First;

      
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

      for C in Color'Range loop
         Next_Release := Next_Release + Period;
         Out_Bit (Color (C));
         delay until Next_Release;
      end loop;
      Out_Bit (0); -- Envoi d'un bit de latch (0) à la fin
      --delay 0.0001; -- Attente de 100 microseconde pour visualiser la couleur
      put_Line ("Je suis dans LED_Color");
   end LED_Color;

   procedure LED_Blue is
   begin
      LED_Color (Blue_Color);
   end LED_Blue;

   procedure LED_Red is
   begin
      LED_Color (Red_Color);
   end LED_Red;

   procedure LED_Green is
   begin
      LED_Color (Green_Color);
   end LED_Green;

   function Altitude_To_Color (Altitude : Integer) return Color_Array is
      Color : Color_Array := (others => 0);
      Lambda : Integer := 0 ;
      Rf : Integer := 0;
      Gf : Integer := 0;
      Bf : Integer := 0;
   begin
      Lambda := (Altitude * 4 / 3) + 380; -- L = (Altitude / Altitude_max)*(Labda_max - Lambda_min)+Lambda_min
      if Lambda >= 380 and Lambda < 440 then
         Rf := -(Lambda - 440) / (440 - 380);
         Gf := 0;
         Bf := 1;
      elsif Lambda >= 440 and Lambda < 490 then
         Rf := 0;
         Gf := (Lambda - 440) / (490 - 440);
         Bf := 1;
      elsif Lambda >= 490 and Lambda < 510 then
         Rf := 0;
         Gf := 1;
         Bf := -(Lambda - 510) / (510 - 490);
      elsif Lambda >= 510 and Lambda < 580 then
         Rf := (Lambda - 510) / (580 - 510);
         Gf := 1;
         Bf := 0;
      elsif Lambda >= 580 and Lambda < 645 then
         Rf := 1;
         Gf := -(Lambda - 645) / (645 - 580);
         Bf := 0;
      elsif Lambda >= 645 and Lambda <= 780 then
         Rf := 1;
         Gf := 0;
         Bf := 0;
      else
         Rf := 0;
         Gf := 0;
         Bf := 0;
      end if;

      --  for I in 1 .. 8 loop
      --     Color (I) := Bit'Pos (Gf * 255);
      --  end loop;
      --  for I in 9 .. 16 loop
      --     Color (I) := Bit'Pos (Rf * 255);
      --  end loop;
      --  for I in 17 .. 24 loop
      --     Color (I) := Bit'Pos (Bf * 255);
      --  end loop;
      return Color;
   end;
   
   
end Color_led;

--  loop
--           -- Choisir la période normale ou la période de latch
--           Period := (if Counter = Bit_Count then Latch_Period else Period);
--           Next_Release := Next_Release + Period;

--           if Counter /= Bit_Count then
--              Out_Bit (Color (Counter));
--           end if;

--           Counter := (if Counter = Color'Last 
--                                then Color'First
--                                else Counter + 1);

--           delay until Next_Release;
--        end loop;