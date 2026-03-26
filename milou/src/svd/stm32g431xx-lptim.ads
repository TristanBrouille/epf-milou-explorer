pragma Style_Checks (Off);

--  This spec has been automatically generated from stm32g431xx.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32G431xx.LPTIM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ISR_CMPM_Field is STM32G431xx.Bit;
   subtype ISR_ARRM_Field is STM32G431xx.Bit;
   subtype ISR_EXTTRIG_Field is STM32G431xx.Bit;
   subtype ISR_CMPOK_Field is STM32G431xx.Bit;
   subtype ISR_ARROK_Field is STM32G431xx.Bit;
   subtype ISR_UP_Field is STM32G431xx.Bit;
   subtype ISR_DOWN_Field is STM32G431xx.Bit;

   --  Interrupt and Status Register
   type ISR_Register is record
      --  Read-only. Compare match
      CMPM          : ISR_CMPM_Field;
      --  Read-only. Autoreload match
      ARRM          : ISR_ARRM_Field;
      --  Read-only. External trigger edge event
      EXTTRIG       : ISR_EXTTRIG_Field;
      --  Read-only. Compare register update OK
      CMPOK         : ISR_CMPOK_Field;
      --  Read-only. Autoreload register update OK
      ARROK         : ISR_ARROK_Field;
      --  Read-only. Counter direction change down to up
      UP            : ISR_UP_Field;
      --  Read-only. Counter direction change up to down
      DOWN          : ISR_DOWN_Field;
      --  unspecified
      Reserved_7_31 : STM32G431xx.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      CMPM          at 0 range 0 .. 0;
      ARRM          at 0 range 1 .. 1;
      EXTTRIG       at 0 range 2 .. 2;
      CMPOK         at 0 range 3 .. 3;
      ARROK         at 0 range 4 .. 4;
      UP            at 0 range 5 .. 5;
      DOWN          at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype ICR_CMPMCF_Field is STM32G431xx.Bit;
   subtype ICR_ARRMCF_Field is STM32G431xx.Bit;
   subtype ICR_EXTTRIGCF_Field is STM32G431xx.Bit;
   subtype ICR_CMPOKCF_Field is STM32G431xx.Bit;
   subtype ICR_ARROKCF_Field is STM32G431xx.Bit;
   subtype ICR_UPCF_Field is STM32G431xx.Bit;
   subtype ICR_DOWNCF_Field is STM32G431xx.Bit;

   --  Interrupt Clear Register
   type ICR_Register is record
      --  Write-only. compare match Clear Flag
      CMPMCF        : ICR_CMPMCF_Field := 16#0#;
      --  Write-only. Autoreload match Clear Flag
      ARRMCF        : ICR_ARRMCF_Field := 16#0#;
      --  Write-only. External trigger valid edge Clear Flag
      EXTTRIGCF     : ICR_EXTTRIGCF_Field := 16#0#;
      --  Write-only. Compare register update OK Clear Flag
      CMPOKCF       : ICR_CMPOKCF_Field := 16#0#;
      --  Write-only. Autoreload register update OK Clear Flag
      ARROKCF       : ICR_ARROKCF_Field := 16#0#;
      --  Write-only. Direction change to UP Clear Flag
      UPCF          : ICR_UPCF_Field := 16#0#;
      --  Write-only. Direction change to down Clear Flag
      DOWNCF        : ICR_DOWNCF_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : STM32G431xx.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      CMPMCF        at 0 range 0 .. 0;
      ARRMCF        at 0 range 1 .. 1;
      EXTTRIGCF     at 0 range 2 .. 2;
      CMPOKCF       at 0 range 3 .. 3;
      ARROKCF       at 0 range 4 .. 4;
      UPCF          at 0 range 5 .. 5;
      DOWNCF        at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype IER_CMPMIE_Field is STM32G431xx.Bit;
   subtype IER_ARRMIE_Field is STM32G431xx.Bit;
   subtype IER_EXTTRIGIE_Field is STM32G431xx.Bit;
   subtype IER_CMPOKIE_Field is STM32G431xx.Bit;
   subtype IER_ARROKIE_Field is STM32G431xx.Bit;
   subtype IER_UPIE_Field is STM32G431xx.Bit;
   subtype IER_DOWNIE_Field is STM32G431xx.Bit;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Compare match Interrupt Enable
      CMPMIE        : IER_CMPMIE_Field := 16#0#;
      --  Autoreload match Interrupt Enable
      ARRMIE        : IER_ARRMIE_Field := 16#0#;
      --  External trigger valid edge Interrupt Enable
      EXTTRIGIE     : IER_EXTTRIGIE_Field := 16#0#;
      --  Compare register update OK Interrupt Enable
      CMPOKIE       : IER_CMPOKIE_Field := 16#0#;
      --  Autoreload register update OK Interrupt Enable
      ARROKIE       : IER_ARROKIE_Field := 16#0#;
      --  Direction change to UP Interrupt Enable
      UPIE          : IER_UPIE_Field := 16#0#;
      --  Direction change to down Interrupt Enable
      DOWNIE        : IER_DOWNIE_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : STM32G431xx.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IER_Register use record
      CMPMIE        at 0 range 0 .. 0;
      ARRMIE        at 0 range 1 .. 1;
      EXTTRIGIE     at 0 range 2 .. 2;
      CMPOKIE       at 0 range 3 .. 3;
      ARROKIE       at 0 range 4 .. 4;
      UPIE          at 0 range 5 .. 5;
      DOWNIE        at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype CFGR_CKSEL_Field is STM32G431xx.Bit;
   subtype CFGR_CKPOL_Field is STM32G431xx.UInt2;
   subtype CFGR_CKFLT_Field is STM32G431xx.UInt2;
   subtype CFGR_TRGFLT_Field is STM32G431xx.UInt2;
   subtype CFGR_PRESC_Field is STM32G431xx.UInt3;
   subtype CFGR_TRIGSEL_Field is STM32G431xx.UInt4;
   subtype CFGR_TRIGEN_Field is STM32G431xx.UInt2;
   subtype CFGR_TIMOUT_Field is STM32G431xx.Bit;
   subtype CFGR_WAVE_Field is STM32G431xx.Bit;
   subtype CFGR_WAVPOL_Field is STM32G431xx.Bit;
   subtype CFGR_PRELOAD_Field is STM32G431xx.Bit;
   subtype CFGR_COUNTMODE_Field is STM32G431xx.Bit;
   subtype CFGR_ENC_Field is STM32G431xx.Bit;

   --  Configuration Register
   type CFGR_Register is record
      --  Clock selector
      CKSEL          : CFGR_CKSEL_Field := 16#0#;
      --  Clock Polarity
      CKPOL          : CFGR_CKPOL_Field := 16#0#;
      --  Configurable digital filter for external clock
      CKFLT          : CFGR_CKFLT_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : STM32G431xx.Bit := 16#0#;
      --  Configurable digital filter for trigger
      TRGFLT         : CFGR_TRGFLT_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : STM32G431xx.Bit := 16#0#;
      --  Clock prescaler
      PRESC          : CFGR_PRESC_Field := 16#0#;
      --  unspecified
      Reserved_12_12 : STM32G431xx.Bit := 16#0#;
      --  Trigger selector
      TRIGSEL        : CFGR_TRIGSEL_Field := 16#0#;
      --  Trigger enable and polarity
      TRIGEN         : CFGR_TRIGEN_Field := 16#0#;
      --  Timeout enable
      TIMOUT         : CFGR_TIMOUT_Field := 16#0#;
      --  Waveform shape
      WAVE           : CFGR_WAVE_Field := 16#0#;
      --  Waveform shape polarity
      WAVPOL         : CFGR_WAVPOL_Field := 16#0#;
      --  Registers update mode
      PRELOAD        : CFGR_PRELOAD_Field := 16#0#;
      --  counter mode enabled
      COUNTMODE      : CFGR_COUNTMODE_Field := 16#0#;
      --  Encoder mode enable
      ENC            : CFGR_ENC_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32G431xx.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      CKSEL          at 0 range 0 .. 0;
      CKPOL          at 0 range 1 .. 2;
      CKFLT          at 0 range 3 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TRGFLT         at 0 range 6 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      PRESC          at 0 range 9 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      TRIGSEL        at 0 range 13 .. 16;
      TRIGEN         at 0 range 17 .. 18;
      TIMOUT         at 0 range 19 .. 19;
      WAVE           at 0 range 20 .. 20;
      WAVPOL         at 0 range 21 .. 21;
      PRELOAD        at 0 range 22 .. 22;
      COUNTMODE      at 0 range 23 .. 23;
      ENC            at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CR_ENABLE_Field is STM32G431xx.Bit;
   subtype CR_SNGSTRT_Field is STM32G431xx.Bit;
   subtype CR_CNTSTRT_Field is STM32G431xx.Bit;
   subtype CR_COUNTRST_Field is STM32G431xx.Bit;
   subtype CR_RSTARE_Field is STM32G431xx.Bit;

   --  Control Register
   type CR_Register is record
      --  LPTIM Enable
      ENABLE        : CR_ENABLE_Field := 16#0#;
      --  LPTIM start in single mode
      SNGSTRT       : CR_SNGSTRT_Field := 16#0#;
      --  Timer start in continuous mode
      CNTSTRT       : CR_CNTSTRT_Field := 16#0#;
      --  COUNTRST
      COUNTRST      : CR_COUNTRST_Field := 16#0#;
      --  RSTARE
      RSTARE        : CR_RSTARE_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : STM32G431xx.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      ENABLE        at 0 range 0 .. 0;
      SNGSTRT       at 0 range 1 .. 1;
      CNTSTRT       at 0 range 2 .. 2;
      COUNTRST      at 0 range 3 .. 3;
      RSTARE        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype CMP_CMP_Field is STM32G431xx.UInt16;

   --  Compare Register
   type CMP_Register is record
      --  Compare value
      CMP            : CMP_CMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32G431xx.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMP_Register use record
      CMP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ARR_ARR_Field is STM32G431xx.UInt16;

   --  Autoreload Register
   type ARR_Register is record
      --  Auto reload value
      ARR            : ARR_ARR_Field := 16#1#;
      --  unspecified
      Reserved_16_31 : STM32G431xx.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register use record
      ARR            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CNT_CNT_Field is STM32G431xx.UInt16;

   --  Counter Register
   type CNT_Register is record
      --  Read-only. Counter value
      CNT            : CNT_CNT_Field;
      --  unspecified
      Reserved_16_31 : STM32G431xx.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  OR_IN array element
   subtype OR_IN_Element is STM32G431xx.Bit;

   --  OR_IN array
   type OR_IN_Field_Array is array (1 .. 2) of OR_IN_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for OR_IN
   type OR_IN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IN as a value
            Val : STM32G431xx.UInt2;
         when True =>
            --  IN as an array
            Arr : OR_IN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OR_IN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype OR_IN1_2_1_Field is STM32G431xx.UInt2;
   subtype OR_IN2_2_1_Field is STM32G431xx.UInt2;

   --  option register
   type OR_Register is record
      --  IN1
      IN_k          : OR_IN_Field := (As_Array => False, Val => 16#0#);
      --  IN1_2_1
      IN1_2_1       : OR_IN1_2_1_Field := 16#0#;
      --  IN2_2_1
      IN2_2_1       : OR_IN2_2_1_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : STM32G431xx.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register use record
      IN_k          at 0 range 0 .. 1;
      IN1_2_1       at 0 range 2 .. 3;
      IN2_2_1       at 0 range 4 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Low power timer
   type LPTIMER1_Peripheral is record
      --  Interrupt and Status Register
      ISR  : aliased ISR_Register;
      --  Interrupt Clear Register
      ICR  : aliased ICR_Register;
      --  Interrupt Enable Register
      IER  : aliased IER_Register;
      --  Configuration Register
      CFGR : aliased CFGR_Register;
      --  Control Register
      CR   : aliased CR_Register;
      --  Compare Register
      CMP  : aliased CMP_Register;
      --  Autoreload Register
      ARR  : aliased ARR_Register;
      --  Counter Register
      CNT  : aliased CNT_Register;
      --  option register
      OR_k : aliased OR_Register;
   end record
     with Volatile;

   for LPTIMER1_Peripheral use record
      ISR  at 16#0# range 0 .. 31;
      ICR  at 16#4# range 0 .. 31;
      IER  at 16#8# range 0 .. 31;
      CFGR at 16#C# range 0 .. 31;
      CR   at 16#10# range 0 .. 31;
      CMP  at 16#14# range 0 .. 31;
      ARR  at 16#18# range 0 .. 31;
      CNT  at 16#1C# range 0 .. 31;
      OR_k at 16#20# range 0 .. 31;
   end record;

   --  Low power timer
   LPTIMER1_Periph : aliased LPTIMER1_Peripheral
     with Import, Address => LPTIMER1_Base;

end STM32G431xx.LPTIM;
