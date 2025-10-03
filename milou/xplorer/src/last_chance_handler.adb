with Interfaces.STM32.RCC;  use Interfaces.STM32.RCC;
with Interfaces.STM32.GPIO; use Interfaces.STM32.GPIO;

with Board;
pragma Unreferenced (Board);

package body Last_Chance_Handler is

   procedure Last_Chance_Handler (Msg : System.Address; Line : Integer) is
   begin
      RCC_Periph.AHB2ENR.GPIOBEN := 1;       -- Enable GPIOB clock
      GPIOB_Periph.MODER.Arr (8) := 2#01#;   -- OUTPUT mode
      GPIOB_Periph.OTYPER.OT.Arr (8) := 0;   -- Push-pull
      GPIOB_Periph.PUPDR.Arr (8) := 2#00#;   -- No pull
      GPIOB_Periph.OSPEEDR.Arr (8) := 2#00#; -- Low speed
      GPIOB_Periph.BSRR.BR.Arr (8) := 1;     -- Ensure LED is OFF initially
      loop
         GPIOB_Periph.BSRR.BS.Arr (8) := 1;  -- LED ON
         delay 1.0;
         GPIOB_Periph.BSRR.BR.Arr (8) := 1;  -- LED OFF
         delay 1.0;
      end loop;
   end;

end Last_Chance_Handler;