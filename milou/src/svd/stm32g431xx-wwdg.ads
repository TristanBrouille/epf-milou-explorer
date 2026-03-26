pragma Style_Checks (Off);

--  This spec has been automatically generated from stm32g431xx.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32G431xx.WWDG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_T_Field is STM32G431xx.UInt7;
   subtype CR_WDGA_Field is STM32G431xx.Bit;

   --  Control register
   type CR_Register is record
      --  7-bit counter (MSB to LSB)
      T             : CR_T_Field := 16#7F#;
      --  Activation bit
      WDGA          : CR_WDGA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32G431xx.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      T             at 0 range 0 .. 6;
      WDGA          at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CFR_W_Field is STM32G431xx.UInt7;
   subtype CFR_EWI_Field is STM32G431xx.Bit;
   subtype CFR_WDGTB_Field is STM32G431xx.UInt3;

   --  Configuration register
   type CFR_Register is record
      --  7-bit window value
      W              : CFR_W_Field := 16#7F#;
      --  unspecified
      Reserved_7_8   : STM32G431xx.UInt2 := 16#0#;
      --  Early wakeup interrupt
      EWI            : CFR_EWI_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : STM32G431xx.Bit := 16#0#;
      --  Timer base
      WDGTB          : CFR_WDGTB_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : STM32G431xx.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFR_Register use record
      W              at 0 range 0 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      EWI            at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      WDGTB          at 0 range 11 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype SR_EWIF_Field is STM32G431xx.Bit;

   --  Status register
   type SR_Register is record
      --  Early wakeup interrupt flag
      EWIF          : SR_EWIF_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : STM32G431xx.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      EWIF          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System window watchdog
   type IWDG_Peripheral is record
      --  Control register
      CR  : aliased CR_Register;
      --  Configuration register
      CFR : aliased CFR_Register;
      --  Status register
      SR  : aliased SR_Register;
   end record
     with Volatile;

   for IWDG_Peripheral use record
      CR  at 16#0# range 0 .. 31;
      CFR at 16#4# range 0 .. 31;
      SR  at 16#8# range 0 .. 31;
   end record;

   --  System window watchdog
   IWDG_Periph : aliased IWDG_Peripheral
     with Import, Address => IWDG_Base;

end STM32G431xx.WWDG;
