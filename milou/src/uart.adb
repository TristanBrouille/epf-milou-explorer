with STM32G431xx.USART; use STM32G431xx.USART;
with STM32G431xx.GPIO; use STM32G431xx.GPIO;
with STM32G431xx.RCC; use STM32G431xx.RCC;
with STM32G431xx; use STM32G431xx;

--with Interfaces.STM32;

package body Uart is
   procedure Init is
   begin
      --------------------------------------------------------------------
      -- 1. Enable clocks
      --------------------------------------------------------------------

      RCC_Periph.AHB2ENR.GPIOAEN := 1;
      RCC_Periph.APB1ENR1.USART2EN := 1;

      --------------------------------------------------------------------
      -- 2. Configure PA2 / PA3 as USART2 (AF7)
      --------------------------------------------------------------------

      -- MODER: Alternate Function (10)
      GPIOA_Periph.MODER := (As_Array => True,
         Arr => GPIOA_Periph.MODER.Arr);

      GPIOA_Periph.MODER.Arr (2) := 2#10#;
      GPIOA_Periph.MODER.Arr (3) := 2#10#;

      -- OSPEEDR: Very high speed (11)
      GPIOA_Periph.OSPEEDR := (As_Array => True,
         Arr => GPIOA_Periph.OSPEEDR.Arr);

      GPIOA_Periph.OSPEEDR.Arr (2) := 2#11#;
      GPIOA_Periph.OSPEEDR.Arr (3) := 2#11#;

      -- PUPDR: Pull-up (01)
      GPIOA_Periph.PUPDR := (As_Array => True,
         Arr => GPIOA_Periph.PUPDR.Arr);

      GPIOA_Periph.PUPDR.Arr (2) := 2#01#;
      GPIOA_Periph.PUPDR.Arr (3) := 2#01#;

      -- AFRL: AF7
      GPIOA_Periph.AFRL := (As_Array => True,
         Arr => GPIOA_Periph.AFRL.Arr);

      GPIOA_Periph.AFRL.Arr (2) := 7;
      GPIOA_Periph.AFRL.Arr (3) := 7;

      --------------------------------------------------------------------
      -- 3. Configure USART2
      --------------------------------------------------------------------

      USART2_Periph.CR1.UE := 0;

      USART2_Periph.CR1.M0 := 0;
      USART2_Periph.CR1.M1 := 0;
      USART2_Periph.CR1.PCE := 0;
      USART2_Periph.CR1.OVER8 := 0;

      USART2_Periph.CR2.STOP := 0;

      USART2_Periph.CR3.RTSE := 0;
      USART2_Periph.CR3.CTSE := 0;

      -- 115200 baud @ 170 MHz
      USART2_Periph.PRESC.PRESCALER := 0;
      USART2_Periph.BRR.DIV_Mantissa := 92;
      USART2_Periph.BRR.DIV_Fraction := 4;  

      USART2_Periph.CR1.TE := 1;
      USART2_Periph.CR1.RE := 1;
      USART2_Periph.CR1.UE := 1;

      while USART2_Periph.ISR.TEACK = 0 loop
         null;
      end loop;

      while USART2_Periph.ISR.REACK = 0 loop
         null;
      end loop;
   end Init;


   procedure Put_Char (C : Character) is
   begin
      while USART2_Periph.ISR.TXE = 0 loop
         null;
      end loop;
      USART2_Periph.TDR.TDR := UInt9 (Character'Pos (C));
   end Put_Char;

   procedure Put_Str (S : String) is
   begin
      for C of S loop
         Put_Char (C);
      end loop;
   end;

   procedure Put_New_Line is
   begin
      Put_Char (ASCII.CR);
      Put_Char (ASCII.LF);
   end;

end Uart;