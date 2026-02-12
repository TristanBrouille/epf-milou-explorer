pragma Style_Checks (Off);

--  This spec has been automatically generated from stm32g431xx.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32G431xx.CORDIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CSR_FUNC_Field is STM32G431xx.UInt4;
   subtype CSR_PRECISION_Field is STM32G431xx.UInt4;
   subtype CSR_SCALE_Field is STM32G431xx.UInt3;
   subtype CSR_IEN_Field is STM32G431xx.Bit;
   subtype CSR_DMAREN_Field is STM32G431xx.Bit;
   subtype CSR_DMAWEN_Field is STM32G431xx.Bit;
   subtype CSR_NRES_Field is STM32G431xx.Bit;
   subtype CSR_NARGS_Field is STM32G431xx.Bit;
   subtype CSR_RESSIZE_Field is STM32G431xx.Bit;
   subtype CSR_ARGSIZE_Field is STM32G431xx.Bit;
   subtype CSR_RRDY_Field is STM32G431xx.Bit;

   --  CORDIC Control Status register
   type CSR_Register is record
      --  FUNC
      FUNC           : CSR_FUNC_Field := 16#0#;
      --  PRECISION
      PRECISION      : CSR_PRECISION_Field := 16#0#;
      --  SCALE
      SCALE          : CSR_SCALE_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : STM32G431xx.UInt5 := 16#0#;
      --  IEN
      IEN            : CSR_IEN_Field := 16#0#;
      --  DMAREN
      DMAREN         : CSR_DMAREN_Field := 16#0#;
      --  DMAWEN
      DMAWEN         : CSR_DMAWEN_Field := 16#0#;
      --  NRES
      NRES           : CSR_NRES_Field := 16#0#;
      --  NARGS
      NARGS          : CSR_NARGS_Field := 16#0#;
      --  RESSIZE
      RESSIZE        : CSR_RESSIZE_Field := 16#0#;
      --  ARGSIZE
      ARGSIZE        : CSR_ARGSIZE_Field := 16#0#;
      --  unspecified
      Reserved_23_30 : STM32G431xx.Byte := 16#0#;
      --  RRDY
      RRDY           : CSR_RRDY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      FUNC           at 0 range 0 .. 3;
      PRECISION      at 0 range 4 .. 7;
      SCALE          at 0 range 8 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      IEN            at 0 range 16 .. 16;
      DMAREN         at 0 range 17 .. 17;
      DMAWEN         at 0 range 18 .. 18;
      NRES           at 0 range 19 .. 19;
      NARGS          at 0 range 20 .. 20;
      RESSIZE        at 0 range 21 .. 21;
      ARGSIZE        at 0 range 22 .. 22;
      Reserved_23_30 at 0 range 23 .. 30;
      RRDY           at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  CORDIC Co-processor
   type CORDIC_Peripheral is record
      --  CORDIC Control Status register
      CSR   : aliased CSR_Register;
      --  FMAC Write Data register
      WDATA : aliased STM32G431xx.UInt32;
      --  FMAC Read Data register
      RDATA : aliased STM32G431xx.UInt32;
   end record
     with Volatile;

   for CORDIC_Peripheral use record
      CSR   at 16#0# range 0 .. 31;
      WDATA at 16#4# range 0 .. 31;
      RDATA at 16#8# range 0 .. 31;
   end record;

   --  CORDIC Co-processor
   CORDIC_Periph : aliased CORDIC_Peripheral
     with Import, Address => CORDIC_Base;

end STM32G431xx.CORDIC;
