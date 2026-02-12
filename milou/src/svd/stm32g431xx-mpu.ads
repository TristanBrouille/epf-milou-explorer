pragma Style_Checks (Off);

--  This spec has been automatically generated from stm32g431xx.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32G431xx.MPU is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype TYPER_SEPARATE_Field is STM32G431xx.Bit;
   subtype TYPER_DREGION_Field is STM32G431xx.Byte;
   subtype TYPER_IREGION_Field is STM32G431xx.Byte;

   --  MPU type register
   type TYPER_Register is record
      --  Read-only. Separate flag
      SEPARATE_k     : TYPER_SEPARATE_Field;
      --  unspecified
      Reserved_1_7   : STM32G431xx.UInt7;
      --  Read-only. Number of MPU data regions
      DREGION        : TYPER_DREGION_Field;
      --  Read-only. Number of MPU instruction regions
      IREGION        : TYPER_IREGION_Field;
      --  unspecified
      Reserved_24_31 : STM32G431xx.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TYPER_Register use record
      SEPARATE_k     at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      DREGION        at 0 range 8 .. 15;
      IREGION        at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CTRL_ENABLE_Field is STM32G431xx.Bit;
   subtype CTRL_HFNMIENA_Field is STM32G431xx.Bit;
   subtype CTRL_PRIVDEFENA_Field is STM32G431xx.Bit;

   --  MPU control register
   type CTRL_Register is record
      --  Read-only. Enables the MPU
      ENABLE        : CTRL_ENABLE_Field;
      --  Read-only. Enables the operation of MPU during hard fault
      HFNMIENA      : CTRL_HFNMIENA_Field;
      --  Read-only. Enable priviliged software access to default memory map
      PRIVDEFENA    : CTRL_PRIVDEFENA_Field;
      --  unspecified
      Reserved_3_31 : STM32G431xx.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      HFNMIENA      at 0 range 1 .. 1;
      PRIVDEFENA    at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype RNR_REGION_Field is STM32G431xx.Byte;

   --  MPU region number register
   type RNR_Register is record
      --  MPU region
      REGION        : RNR_REGION_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32G431xx.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RNR_Register use record
      REGION        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RBAR_REGION_Field is STM32G431xx.UInt4;
   subtype RBAR_VALID_Field is STM32G431xx.Bit;
   subtype RBAR_ADDR_Field is STM32G431xx.UInt27;

   --  MPU region base address register
   type RBAR_Register is record
      --  MPU region field
      REGION : RBAR_REGION_Field := 16#0#;
      --  MPU region number valid
      VALID  : RBAR_VALID_Field := 16#0#;
      --  Region base address field
      ADDR   : RBAR_ADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RBAR_Register use record
      REGION at 0 range 0 .. 3;
      VALID  at 0 range 4 .. 4;
      ADDR   at 0 range 5 .. 31;
   end record;

   subtype RASR_ENABLE_Field is STM32G431xx.Bit;
   subtype RASR_SIZE_Field is STM32G431xx.UInt5;
   subtype RASR_SRD_Field is STM32G431xx.Byte;
   subtype RASR_B_Field is STM32G431xx.Bit;
   subtype RASR_C_Field is STM32G431xx.Bit;
   subtype RASR_S_Field is STM32G431xx.Bit;
   subtype RASR_TEX_Field is STM32G431xx.UInt3;
   subtype RASR_AP_Field is STM32G431xx.UInt3;
   subtype RASR_XN_Field is STM32G431xx.Bit;

   --  MPU region attribute and size register
   type RASR_Register is record
      --  Region enable bit.
      ENABLE         : RASR_ENABLE_Field := 16#0#;
      --  Size of the MPU protection region
      SIZE           : RASR_SIZE_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : STM32G431xx.UInt2 := 16#0#;
      --  Subregion disable bits
      SRD            : RASR_SRD_Field := 16#0#;
      --  memory attribute
      B              : RASR_B_Field := 16#0#;
      --  memory attribute
      C              : RASR_C_Field := 16#0#;
      --  Shareable memory attribute
      S              : RASR_S_Field := 16#0#;
      --  memory attribute
      TEX            : RASR_TEX_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : STM32G431xx.UInt2 := 16#0#;
      --  Access permission
      AP             : RASR_AP_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : STM32G431xx.Bit := 16#0#;
      --  Instruction access disable bit
      XN             : RASR_XN_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : STM32G431xx.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RASR_Register use record
      ENABLE         at 0 range 0 .. 0;
      SIZE           at 0 range 1 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SRD            at 0 range 8 .. 15;
      B              at 0 range 16 .. 16;
      C              at 0 range 17 .. 17;
      S              at 0 range 18 .. 18;
      TEX            at 0 range 19 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      AP             at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      XN             at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Memory protection unit
   type MPU_Peripheral is record
      --  MPU type register
      TYPER : aliased TYPER_Register;
      --  MPU control register
      CTRL  : aliased CTRL_Register;
      --  MPU region number register
      RNR   : aliased RNR_Register;
      --  MPU region base address register
      RBAR  : aliased RBAR_Register;
      --  MPU region attribute and size register
      RASR  : aliased RASR_Register;
   end record
     with Volatile;

   for MPU_Peripheral use record
      TYPER at 16#0# range 0 .. 31;
      CTRL  at 16#4# range 0 .. 31;
      RNR   at 16#8# range 0 .. 31;
      RBAR  at 16#C# range 0 .. 31;
      RASR  at 16#10# range 0 .. 31;
   end record;

   --  Memory protection unit
   MPU_Periph : aliased MPU_Peripheral
     with Import, Address => MPU_Base;

end STM32G431xx.MPU;
