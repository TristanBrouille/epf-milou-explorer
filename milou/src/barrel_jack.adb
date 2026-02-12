with Interfaces.STM32.RCC;  use Interfaces.STM32.RCC;
with Interfaces.STM32.GPIO; use Interfaces.STM32.GPIO;
with Interfaces.STM32;      use Interfaces.STM32;

package body Barrel_Jack is

   procedure Config is
   begin
      -- Enable GPIOA clock
      RCC_Periph.AHB2ENR.GPIOAEN := 1;

      -- PA9 as input
      GPIOA_Periph.MODER.Arr (9) := 2#00#;

      -- Internal pull-up
      GPIOA_Periph.PUPDR.Arr (9) := 2#01#;

   end Config;

   procedure Init is
   begin
      Config;
   end Init;

   function Is_Detached return Boolean is
      Cnt : Natural := 0;
   begin
      for I in 1 .. 5 loop
          if (GPIOA_Periph.IDR.IDR.Arr(9)) = 1 then
            Cnt := Cnt + 1;
         end if;
      end loop;

      return Cnt >= 4;
   end Is_Detached;
end Barrel_Jack;
