package Set_Pin_Stm32 is

   type Port_T is (A, B, C, D, E, F, G);

   type GPIO_T is record
      Port : Port_T;
      Pin  : Natural range 0 .. 15;
   end record;

   function Set_Pin (Port : Port_T; Pin : Natural) return GPIO_T;

   function Get_Periph (Port : Port_T) return String;

   procedure Enable_Clock (Port : Port_T);

end Set_Pin_Stm32;
