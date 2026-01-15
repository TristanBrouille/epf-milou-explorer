with Interfaces.STM32.RCC;  use Interfaces.STM32.RCC;
with Interfaces.STM32.GPIO; use Interfaces.STM32.GPIO;
with Interfaces.STM32.TIM;  use Interfaces.STM32.TIM;
with Interfaces.STM32;      use Interfaces.STM32;

package body Set_Pin_Stm32 is

   function Set_Pin (Port : Port_T; Pin : Natural) return GPIO_T is
   begin
      return (Port => Port, Pin => Pin);
   end Set_Pin;

   function Get_Periph (Port : Port_T) return String is
   begin
      case Port is
         when A =>
            return "GPIOA_Periph";

         when B =>
            return "GPIOB_Periph";

         when C =>
            return "GPIOC_Periph";

         when D =>
            return "GPIOD_Periph";

         when E =>
            return "GPIOE_Periph";

         when F =>
            return "GPIOF_Periph";

         when G =>
            return "GPIOG_Periph";
      end case;
   end Get_Periph;

   procedure Enable_Clock (Port : Port_T) is
   begin
      case Port is
         when A =>
            RCC_Periph.AHB2ENR.GPIOAEN := 1;

         when B =>
            RCC_Periph.AHB2ENR.GPIOBEN := 1;

         when C =>
            RCC_Periph.AHB2ENR.GPIOCEN := 1;

         when D =>
            RCC_Periph.AHB2ENR.GPIODEN := 1;

         when E =>
            RCC_Periph.AHB2ENR.GPIOEEN := 1;

         when F =>
            RCC_Periph.AHB2ENR.GPIOFEN := 1;

         when G =>
            RCC_Periph.AHB2ENR.GPIOGEN := 1;
      end case;

   end Enable_Clock;

end Set_Pin_Stm32;
