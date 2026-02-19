pragma Style_Checks (Off);

--  This spec has been automatically generated from stm32g431xx.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32G431xx.FDCAN is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CREL_DAY_Field is STM32G431xx.Byte;
   subtype CREL_MON_Field is STM32G431xx.Byte;
   subtype CREL_YEAR_Field is STM32G431xx.UInt4;
   subtype CREL_SUBSTEP_Field is STM32G431xx.UInt4;
   subtype CREL_STEP_Field is STM32G431xx.UInt4;
   subtype CREL_REL_Field is STM32G431xx.UInt4;

   --  FDCAN Core Release Register
   type CREL_Register is record
      --  Read-only. DAY
      DAY     : CREL_DAY_Field;
      --  Read-only. MON
      MON     : CREL_MON_Field;
      --  Read-only. YEAR
      YEAR    : CREL_YEAR_Field;
      --  Read-only. SUBSTEP
      SUBSTEP : CREL_SUBSTEP_Field;
      --  Read-only. STEP
      STEP    : CREL_STEP_Field;
      --  Read-only. REL
      REL     : CREL_REL_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CREL_Register use record
      DAY     at 0 range 0 .. 7;
      MON     at 0 range 8 .. 15;
      YEAR    at 0 range 16 .. 19;
      SUBSTEP at 0 range 20 .. 23;
      STEP    at 0 range 24 .. 27;
      REL     at 0 range 28 .. 31;
   end record;

   subtype DBTP_DSJW_Field is STM32G431xx.UInt4;
   subtype DBTP_DTSEG2_Field is STM32G431xx.UInt4;
   subtype DBTP_DTSEG1_Field is STM32G431xx.UInt5;
   subtype DBTP_DBRP_Field is STM32G431xx.UInt5;
   subtype DBTP_TDC_Field is STM32G431xx.Bit;

   --  This register is only writable if bits CCCR.CCE and CCCR.INIT are set.
   --  The CAN bit time may be programed in the range of 4 to 25 time quanta.
   --  The CAN time quantum may be programmed in the range of 1 to 1024 FDCAN
   --  clock periods. tq = (DBRP + 1) FDCAN clock period. DTSEG1 is the sum of
   --  Prop_Seg and Phase_Seg1. DTSEG2 is Phase_Seg2. Therefore the length of
   --  the bit time is (programmed values) [DTSEG1 + DTSEG2 + 3] tq or
   --  (functional values) [Sync_Seg + Prop_Seg + Phase_Seg1 + Phase_Seg2] tq.
   --  The Information Processing Time (IPT) is zero, meaning the data for the
   --  next bit is available at the first clock edge after the sample point.
   type DBTP_Register is record
      --  DSJW
      DSJW           : DBTP_DSJW_Field := 16#3#;
      --  DTSEG2
      DTSEG2         : DBTP_DTSEG2_Field := 16#3#;
      --  Write-only. DTSEG1
      DTSEG1         : DBTP_DTSEG1_Field := 16#A#;
      --  unspecified
      Reserved_13_15 : STM32G431xx.UInt3 := 16#0#;
      --  DBRP
      DBRP           : DBTP_DBRP_Field := 16#0#;
      --  unspecified
      Reserved_21_22 : STM32G431xx.UInt2 := 16#0#;
      --  Read-only. TDC
      TDC            : DBTP_TDC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32G431xx.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBTP_Register use record
      DSJW           at 0 range 0 .. 3;
      DTSEG2         at 0 range 4 .. 7;
      DTSEG1         at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DBRP           at 0 range 16 .. 20;
      Reserved_21_22 at 0 range 21 .. 22;
      TDC            at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TEST_LBCK_Field is STM32G431xx.Bit;
   subtype TEST_TX_Field is STM32G431xx.UInt2;
   subtype TEST_RX_Field is STM32G431xx.Bit;

   --  Write access to the Test Register has to be enabled by setting bit
   --  CCCR[TEST] to 1 . All Test Register functions are set to their reset
   --  values when bit CCCR[TEST] is reset. Loop Back mode and software control
   --  of Tx pin FDCANx_TX are hardware test modes. Programming TX differently
   --  from 00 may disturb the message transfer on the CAN bus.
   type TEST_Register is record
      --  unspecified
      Reserved_0_3  : STM32G431xx.UInt4 := 16#0#;
      --  LBCK
      LBCK          : TEST_LBCK_Field := 16#0#;
      --  TX
      TX            : TEST_TX_Field := 16#0#;
      --  RX
      RX            : TEST_RX_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32G431xx.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TEST_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      LBCK          at 0 range 4 .. 4;
      TX            at 0 range 5 .. 6;
      RX            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RWD_WDC_Field is STM32G431xx.Byte;
   subtype RWD_WDV_Field is STM32G431xx.Byte;

   --  The RAM Watchdog monitors the READY output of the Message RAM. A Message
   --  RAM access starts the Message RAM Watchdog Counter with the value
   --  configured by the RWD[WDC] bits. The counter is reloaded with RWD[WDC]
   --  bits when the Message RAM signals successful completion by activating
   --  its READY output. In case there is no response from the Message RAM
   --  until the counter has counted down to 0, the counter stops and interrupt
   --  flag IR[WDI] bit is set. The RAM Watchdog Counter is clocked by the
   --  fdcan_pclk clock.
   type RWD_Register is record
      --  WDC
      WDC            : RWD_WDC_Field := 16#0#;
      --  Read-only. WDV
      WDV            : RWD_WDV_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32G431xx.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RWD_Register use record
      WDC            at 0 range 0 .. 7;
      WDV            at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCCR_INIT_Field is STM32G431xx.Bit;
   subtype CCCR_CCE_Field is STM32G431xx.Bit;
   subtype CCCR_ASM_Field is STM32G431xx.Bit;
   subtype CCCR_CSA_Field is STM32G431xx.Bit;
   subtype CCCR_CSR_Field is STM32G431xx.Bit;
   subtype CCCR_MON_Field is STM32G431xx.Bit;
   subtype CCCR_DAR_Field is STM32G431xx.Bit;
   subtype CCCR_TEST_Field is STM32G431xx.Bit;
   subtype CCCR_FDOE_Field is STM32G431xx.Bit;
   subtype CCCR_BRSE_Field is STM32G431xx.Bit;
   subtype CCCR_PXHD_Field is STM32G431xx.Bit;
   subtype CCCR_EFBI_Field is STM32G431xx.Bit;
   subtype CCCR_TXP_Field is STM32G431xx.Bit;
   subtype CCCR_NISO_Field is STM32G431xx.Bit;

   --  For details about setting and resetting of single bits see Software
   --  initialization.
   type CCCR_Register is record
      --  INIT
      INIT           : CCCR_INIT_Field := 16#1#;
      --  CCE
      CCE            : CCCR_CCE_Field := 16#0#;
      --  ASM
      ASM            : CCCR_ASM_Field := 16#0#;
      --  CSA
      CSA            : CCCR_CSA_Field := 16#0#;
      --  CSR
      CSR            : CCCR_CSR_Field := 16#0#;
      --  MON
      MON            : CCCR_MON_Field := 16#0#;
      --  DAR
      DAR            : CCCR_DAR_Field := 16#0#;
      --  TEST
      TEST           : CCCR_TEST_Field := 16#0#;
      --  FDOE
      FDOE           : CCCR_FDOE_Field := 16#0#;
      --  BRSE
      BRSE           : CCCR_BRSE_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : STM32G431xx.UInt2 := 16#0#;
      --  PXHD
      PXHD           : CCCR_PXHD_Field := 16#0#;
      --  EFBI
      EFBI           : CCCR_EFBI_Field := 16#0#;
      --  TXP
      TXP            : CCCR_TXP_Field := 16#0#;
      --  NISO
      NISO           : CCCR_NISO_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32G431xx.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCCR_Register use record
      INIT           at 0 range 0 .. 0;
      CCE            at 0 range 1 .. 1;
      ASM            at 0 range 2 .. 2;
      CSA            at 0 range 3 .. 3;
      CSR            at 0 range 4 .. 4;
      MON            at 0 range 5 .. 5;
      DAR            at 0 range 6 .. 6;
      TEST           at 0 range 7 .. 7;
      FDOE           at 0 range 8 .. 8;
      BRSE           at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      PXHD           at 0 range 12 .. 12;
      EFBI           at 0 range 13 .. 13;
      TXP            at 0 range 14 .. 14;
      NISO           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype NBTP_TSEG2_Field is STM32G431xx.UInt7;
   subtype NBTP_NTSEG1_Field is STM32G431xx.Byte;
   subtype NBTP_NBRP_Field is STM32G431xx.UInt9;
   subtype NBTP_NSJW_Field is STM32G431xx.UInt7;

   --  FDCAN_NBTP
   type NBTP_Register is record
      --  TSEG2
      TSEG2        : NBTP_TSEG2_Field := 16#33#;
      --  unspecified
      Reserved_7_7 : STM32G431xx.Bit := 16#0#;
      --  NTSEG1
      NTSEG1       : NBTP_NTSEG1_Field := 16#A#;
      --  NBRP
      NBRP         : NBTP_NBRP_Field := 16#0#;
      --  NSJW
      NSJW         : NBTP_NSJW_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NBTP_Register use record
      TSEG2        at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
      NTSEG1       at 0 range 8 .. 15;
      NBRP         at 0 range 16 .. 24;
      NSJW         at 0 range 25 .. 31;
   end record;

   subtype TSCC_TSS_Field is STM32G431xx.UInt2;
   subtype TSCC_TCP_Field is STM32G431xx.UInt4;

   --  FDCAN Timestamp Counter Configuration Register
   type TSCC_Register is record
      --  TSS
      TSS            : TSCC_TSS_Field := 16#0#;
      --  unspecified
      Reserved_2_15  : STM32G431xx.UInt14 := 16#0#;
      --  TCP
      TCP            : TSCC_TCP_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : STM32G431xx.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSCC_Register use record
      TSS            at 0 range 0 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      TCP            at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype TSCV_TSC_Field is STM32G431xx.UInt16;

   --  FDCAN Timestamp Counter Value Register
   type TSCV_Register is record
      --  Read-only. TSC
      TSC            : TSCV_TSC_Field;
      --  unspecified
      Reserved_16_31 : STM32G431xx.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSCV_Register use record
      TSC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TOCC_ETOC_Field is STM32G431xx.Bit;
   subtype TOCC_TOS_Field is STM32G431xx.UInt2;
   subtype TOCC_TOP_Field is STM32G431xx.UInt16;

   --  FDCAN Timeout Counter Configuration Register
   type TOCC_Register is record
      --  ETOC
      ETOC          : TOCC_ETOC_Field := 16#0#;
      --  Write-only. TOS
      TOS           : TOCC_TOS_Field := 16#0#;
      --  unspecified
      Reserved_3_15 : STM32G431xx.UInt13 := 16#0#;
      --  TOP
      TOP           : TOCC_TOP_Field := 16#FFFF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TOCC_Register use record
      ETOC          at 0 range 0 .. 0;
      TOS           at 0 range 1 .. 2;
      Reserved_3_15 at 0 range 3 .. 15;
      TOP           at 0 range 16 .. 31;
   end record;

   subtype TOCV_TOC_Field is STM32G431xx.UInt16;

   --  FDCAN Timeout Counter Value Register
   type TOCV_Register is record
      --  Read-only. TOC
      TOC            : TOCV_TOC_Field;
      --  unspecified
      Reserved_16_31 : STM32G431xx.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TOCV_Register use record
      TOC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ECR_TEC_Field is STM32G431xx.Byte;
   subtype ECR_TREC_Field is STM32G431xx.UInt7;
   subtype ECR_RP_Field is STM32G431xx.Bit;
   subtype ECR_CEL_Field is STM32G431xx.Byte;

   --  FDCAN Error Counter Register
   type ECR_Register is record
      --  Read-only. TEC
      TEC            : ECR_TEC_Field;
      --  Read-only. TREC
      TREC           : ECR_TREC_Field;
      --  Read-only. RP
      RP             : ECR_RP_Field;
      --  Read-only. CEL
      CEL            : ECR_CEL_Field;
      --  unspecified
      Reserved_24_31 : STM32G431xx.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ECR_Register use record
      TEC            at 0 range 0 .. 7;
      TREC           at 0 range 8 .. 14;
      RP             at 0 range 15 .. 15;
      CEL            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PSR_LEC_Field is STM32G431xx.UInt3;
   subtype PSR_ACT_Field is STM32G431xx.UInt2;
   subtype PSR_EP_Field is STM32G431xx.Bit;
   subtype PSR_EW_Field is STM32G431xx.Bit;
   subtype PSR_BO_Field is STM32G431xx.Bit;
   subtype PSR_DLEC_Field is STM32G431xx.UInt3;
   subtype PSR_RESI_Field is STM32G431xx.Bit;
   subtype PSR_RBRS_Field is STM32G431xx.Bit;
   subtype PSR_REDL_Field is STM32G431xx.Bit;
   subtype PSR_PXE_Field is STM32G431xx.Bit;
   subtype PSR_TDCV_Field is STM32G431xx.UInt7;

   --  FDCAN Protocol Status Register
   type PSR_Register is record
      --  LEC
      LEC            : PSR_LEC_Field := 16#7#;
      --  Write-only. ACT
      ACT            : PSR_ACT_Field := 16#0#;
      --  EP
      EP             : PSR_EP_Field := 16#0#;
      --  EW
      EW             : PSR_EW_Field := 16#0#;
      --  BO
      BO             : PSR_BO_Field := 16#0#;
      --  Write-only. DLEC
      DLEC           : PSR_DLEC_Field := 16#7#;
      --  RESI
      RESI           : PSR_RESI_Field := 16#0#;
      --  RBRS
      RBRS           : PSR_RBRS_Field := 16#0#;
      --  REDL
      REDL           : PSR_REDL_Field := 16#0#;
      --  PXE
      PXE            : PSR_PXE_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : STM32G431xx.Bit := 16#0#;
      --  TDCV
      TDCV           : PSR_TDCV_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : STM32G431xx.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PSR_Register use record
      LEC            at 0 range 0 .. 2;
      ACT            at 0 range 3 .. 4;
      EP             at 0 range 5 .. 5;
      EW             at 0 range 6 .. 6;
      BO             at 0 range 7 .. 7;
      DLEC           at 0 range 8 .. 10;
      RESI           at 0 range 11 .. 11;
      RBRS           at 0 range 12 .. 12;
      REDL           at 0 range 13 .. 13;
      PXE            at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      TDCV           at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TDCR_TDCF_Field is STM32G431xx.UInt7;
   subtype TDCR_TDCO_Field is STM32G431xx.UInt7;

   --  FDCAN Transmitter Delay Compensation Register
   type TDCR_Register is record
      --  TDCF
      TDCF           : TDCR_TDCF_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32G431xx.Bit := 16#0#;
      --  TDCO
      TDCO           : TDCR_TDCO_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32G431xx.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TDCR_Register use record
      TDCF           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TDCO           at 0 range 8 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype IR_RF0N_Field is STM32G431xx.Bit;
   subtype IR_RF0W_Field is STM32G431xx.Bit;
   subtype IR_RF0F_Field is STM32G431xx.Bit;
   subtype IR_RF0L_Field is STM32G431xx.Bit;
   subtype IR_RF1N_Field is STM32G431xx.Bit;
   subtype IR_RF1W_Field is STM32G431xx.Bit;
   subtype IR_RF1F_Field is STM32G431xx.Bit;
   subtype IR_RF1L_Field is STM32G431xx.Bit;
   subtype IR_HPM_Field is STM32G431xx.Bit;
   subtype IR_TC_Field is STM32G431xx.Bit;
   subtype IR_TCF_Field is STM32G431xx.Bit;
   subtype IR_TFE_Field is STM32G431xx.Bit;
   subtype IR_TEFN_Field is STM32G431xx.Bit;
   subtype IR_TEFW_Field is STM32G431xx.Bit;
   subtype IR_TEFF_Field is STM32G431xx.Bit;
   subtype IR_TEFL_Field is STM32G431xx.Bit;
   subtype IR_TSW_Field is STM32G431xx.Bit;
   subtype IR_MRAF_Field is STM32G431xx.Bit;
   subtype IR_TOO_Field is STM32G431xx.Bit;
   subtype IR_DRX_Field is STM32G431xx.Bit;
   subtype IR_ELO_Field is STM32G431xx.Bit;
   subtype IR_EP_Field is STM32G431xx.Bit;
   subtype IR_EW_Field is STM32G431xx.Bit;
   subtype IR_BO_Field is STM32G431xx.Bit;
   subtype IR_WDI_Field is STM32G431xx.Bit;
   subtype IR_PEA_Field is STM32G431xx.Bit;
   subtype IR_PED_Field is STM32G431xx.Bit;
   subtype IR_ARA_Field is STM32G431xx.Bit;

   --  The flags are set when one of the listed conditions is detected
   --  (edge-sensitive). The flags remain set until the Host clears them. A
   --  flag is cleared by writing a 1 to the corresponding bit position.
   --  Writing a 0 has no effect. A hard reset will clear the register. The
   --  configuration of IE controls whether an interrupt is generated. The
   --  configuration of ILS controls on which interrupt line an interrupt is
   --  signaled.
   type IR_Register is record
      --  RF0N
      RF0N           : IR_RF0N_Field := 16#0#;
      --  RF0W
      RF0W           : IR_RF0W_Field := 16#0#;
      --  RF0F
      RF0F           : IR_RF0F_Field := 16#0#;
      --  RF0L
      RF0L           : IR_RF0L_Field := 16#0#;
      --  RF1N
      RF1N           : IR_RF1N_Field := 16#0#;
      --  RF1W
      RF1W           : IR_RF1W_Field := 16#0#;
      --  RF1F
      RF1F           : IR_RF1F_Field := 16#0#;
      --  RF1L
      RF1L           : IR_RF1L_Field := 16#0#;
      --  HPM
      HPM            : IR_HPM_Field := 16#0#;
      --  TC
      TC             : IR_TC_Field := 16#0#;
      --  TCF
      TCF            : IR_TCF_Field := 16#0#;
      --  TFE
      TFE            : IR_TFE_Field := 16#0#;
      --  TEFN
      TEFN           : IR_TEFN_Field := 16#0#;
      --  TEFW
      TEFW           : IR_TEFW_Field := 16#0#;
      --  TEFF
      TEFF           : IR_TEFF_Field := 16#0#;
      --  TEFL
      TEFL           : IR_TEFL_Field := 16#0#;
      --  TSW
      TSW            : IR_TSW_Field := 16#0#;
      --  MRAF
      MRAF           : IR_MRAF_Field := 16#0#;
      --  TOO
      TOO            : IR_TOO_Field := 16#0#;
      --  DRX
      DRX            : IR_DRX_Field := 16#0#;
      --  unspecified
      Reserved_20_21 : STM32G431xx.UInt2 := 16#0#;
      --  ELO
      ELO            : IR_ELO_Field := 16#0#;
      --  EP
      EP             : IR_EP_Field := 16#0#;
      --  EW
      EW             : IR_EW_Field := 16#0#;
      --  BO
      BO             : IR_BO_Field := 16#0#;
      --  WDI
      WDI            : IR_WDI_Field := 16#0#;
      --  PEA
      PEA            : IR_PEA_Field := 16#0#;
      --  PED
      PED            : IR_PED_Field := 16#0#;
      --  ARA
      ARA            : IR_ARA_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : STM32G431xx.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IR_Register use record
      RF0N           at 0 range 0 .. 0;
      RF0W           at 0 range 1 .. 1;
      RF0F           at 0 range 2 .. 2;
      RF0L           at 0 range 3 .. 3;
      RF1N           at 0 range 4 .. 4;
      RF1W           at 0 range 5 .. 5;
      RF1F           at 0 range 6 .. 6;
      RF1L           at 0 range 7 .. 7;
      HPM            at 0 range 8 .. 8;
      TC             at 0 range 9 .. 9;
      TCF            at 0 range 10 .. 10;
      TFE            at 0 range 11 .. 11;
      TEFN           at 0 range 12 .. 12;
      TEFW           at 0 range 13 .. 13;
      TEFF           at 0 range 14 .. 14;
      TEFL           at 0 range 15 .. 15;
      TSW            at 0 range 16 .. 16;
      MRAF           at 0 range 17 .. 17;
      TOO            at 0 range 18 .. 18;
      DRX            at 0 range 19 .. 19;
      Reserved_20_21 at 0 range 20 .. 21;
      ELO            at 0 range 22 .. 22;
      EP             at 0 range 23 .. 23;
      EW             at 0 range 24 .. 24;
      BO             at 0 range 25 .. 25;
      WDI            at 0 range 26 .. 26;
      PEA            at 0 range 27 .. 27;
      PED            at 0 range 28 .. 28;
      ARA            at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype IE_RF0NE_Field is STM32G431xx.Bit;
   subtype IE_RF0WE_Field is STM32G431xx.Bit;
   subtype IE_RF0FE_Field is STM32G431xx.Bit;
   subtype IE_RF0LE_Field is STM32G431xx.Bit;
   subtype IE_RF1NE_Field is STM32G431xx.Bit;
   subtype IE_RF1WE_Field is STM32G431xx.Bit;
   subtype IE_RF1FE_Field is STM32G431xx.Bit;
   subtype IE_RF1LE_Field is STM32G431xx.Bit;
   subtype IE_HPME_Field is STM32G431xx.Bit;
   subtype IE_TCE_Field is STM32G431xx.Bit;
   subtype IE_TCFE_Field is STM32G431xx.Bit;
   subtype IE_TFEE_Field is STM32G431xx.Bit;
   subtype IE_TEFNE_Field is STM32G431xx.Bit;
   subtype IE_TEFWE_Field is STM32G431xx.Bit;
   subtype IE_TEFFE_Field is STM32G431xx.Bit;
   subtype IE_TEFLE_Field is STM32G431xx.Bit;
   subtype IE_TSWE_Field is STM32G431xx.Bit;
   subtype IE_MRAFE_Field is STM32G431xx.Bit;
   subtype IE_TOOE_Field is STM32G431xx.Bit;
   subtype IE_DRX_Field is STM32G431xx.Bit;
   subtype IE_BECE_Field is STM32G431xx.Bit;
   subtype IE_BEUE_Field is STM32G431xx.Bit;
   subtype IE_ELOE_Field is STM32G431xx.Bit;
   subtype IE_EPE_Field is STM32G431xx.Bit;
   subtype IE_EWE_Field is STM32G431xx.Bit;
   subtype IE_BOE_Field is STM32G431xx.Bit;
   subtype IE_WDIE_Field is STM32G431xx.Bit;
   subtype IE_PEAE_Field is STM32G431xx.Bit;
   subtype IE_PEDE_Field is STM32G431xx.Bit;
   subtype IE_ARAE_Field is STM32G431xx.Bit;

   --  The settings in the Interrupt Enable register determine which status
   --  changes in the Interrupt Register will be signaled on an interrupt line.
   type IE_Register is record
      --  RF0NE
      RF0NE          : IE_RF0NE_Field := 16#0#;
      --  RF0WE
      RF0WE          : IE_RF0WE_Field := 16#0#;
      --  RF0FE
      RF0FE          : IE_RF0FE_Field := 16#0#;
      --  RF0LE
      RF0LE          : IE_RF0LE_Field := 16#0#;
      --  RF1NE
      RF1NE          : IE_RF1NE_Field := 16#0#;
      --  RF1WE
      RF1WE          : IE_RF1WE_Field := 16#0#;
      --  RF1FE
      RF1FE          : IE_RF1FE_Field := 16#0#;
      --  RF1LE
      RF1LE          : IE_RF1LE_Field := 16#0#;
      --  HPME
      HPME           : IE_HPME_Field := 16#0#;
      --  TCE
      TCE            : IE_TCE_Field := 16#0#;
      --  TCFE
      TCFE           : IE_TCFE_Field := 16#0#;
      --  TFEE
      TFEE           : IE_TFEE_Field := 16#0#;
      --  TEFNE
      TEFNE          : IE_TEFNE_Field := 16#0#;
      --  TEFWE
      TEFWE          : IE_TEFWE_Field := 16#0#;
      --  TEFFE
      TEFFE          : IE_TEFFE_Field := 16#0#;
      --  TEFLE
      TEFLE          : IE_TEFLE_Field := 16#0#;
      --  TSWE
      TSWE           : IE_TSWE_Field := 16#0#;
      --  MRAFE
      MRAFE          : IE_MRAFE_Field := 16#0#;
      --  TOOE
      TOOE           : IE_TOOE_Field := 16#0#;
      --  DRX
      DRX            : IE_DRX_Field := 16#0#;
      --  BECE
      BECE           : IE_BECE_Field := 16#0#;
      --  BEUE
      BEUE           : IE_BEUE_Field := 16#0#;
      --  ELOE
      ELOE           : IE_ELOE_Field := 16#0#;
      --  EPE
      EPE            : IE_EPE_Field := 16#0#;
      --  EWE
      EWE            : IE_EWE_Field := 16#0#;
      --  BOE
      BOE            : IE_BOE_Field := 16#0#;
      --  WDIE
      WDIE           : IE_WDIE_Field := 16#0#;
      --  PEAE
      PEAE           : IE_PEAE_Field := 16#0#;
      --  PEDE
      PEDE           : IE_PEDE_Field := 16#0#;
      --  ARAE
      ARAE           : IE_ARAE_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : STM32G431xx.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IE_Register use record
      RF0NE          at 0 range 0 .. 0;
      RF0WE          at 0 range 1 .. 1;
      RF0FE          at 0 range 2 .. 2;
      RF0LE          at 0 range 3 .. 3;
      RF1NE          at 0 range 4 .. 4;
      RF1WE          at 0 range 5 .. 5;
      RF1FE          at 0 range 6 .. 6;
      RF1LE          at 0 range 7 .. 7;
      HPME           at 0 range 8 .. 8;
      TCE            at 0 range 9 .. 9;
      TCFE           at 0 range 10 .. 10;
      TFEE           at 0 range 11 .. 11;
      TEFNE          at 0 range 12 .. 12;
      TEFWE          at 0 range 13 .. 13;
      TEFFE          at 0 range 14 .. 14;
      TEFLE          at 0 range 15 .. 15;
      TSWE           at 0 range 16 .. 16;
      MRAFE          at 0 range 17 .. 17;
      TOOE           at 0 range 18 .. 18;
      DRX            at 0 range 19 .. 19;
      BECE           at 0 range 20 .. 20;
      BEUE           at 0 range 21 .. 21;
      ELOE           at 0 range 22 .. 22;
      EPE            at 0 range 23 .. 23;
      EWE            at 0 range 24 .. 24;
      BOE            at 0 range 25 .. 25;
      WDIE           at 0 range 26 .. 26;
      PEAE           at 0 range 27 .. 27;
      PEDE           at 0 range 28 .. 28;
      ARAE           at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype ILS_RF0NL_Field is STM32G431xx.Bit;
   subtype ILS_RF0WL_Field is STM32G431xx.Bit;
   subtype ILS_RF0FL_Field is STM32G431xx.Bit;
   subtype ILS_RF0LL_Field is STM32G431xx.Bit;
   subtype ILS_RF1NL_Field is STM32G431xx.Bit;
   subtype ILS_RF1WL_Field is STM32G431xx.Bit;
   subtype ILS_RF1FL_Field is STM32G431xx.Bit;
   subtype ILS_RF1LL_Field is STM32G431xx.Bit;
   subtype ILS_HPML_Field is STM32G431xx.Bit;
   subtype ILS_TCL_Field is STM32G431xx.Bit;
   subtype ILS_TCFL_Field is STM32G431xx.Bit;
   subtype ILS_TFEL_Field is STM32G431xx.Bit;
   subtype ILS_TEFNL_Field is STM32G431xx.Bit;
   subtype ILS_TEFWL_Field is STM32G431xx.Bit;
   subtype ILS_TEFFL_Field is STM32G431xx.Bit;
   subtype ILS_TEFLL_Field is STM32G431xx.Bit;
   subtype ILS_TSWL_Field is STM32G431xx.Bit;
   subtype ILS_MRAFL_Field is STM32G431xx.Bit;
   subtype ILS_TOOL_Field is STM32G431xx.Bit;
   subtype ILS_DRXL_Field is STM32G431xx.Bit;
   subtype ILS_BECL_Field is STM32G431xx.Bit;
   subtype ILS_BEUL_Field is STM32G431xx.Bit;
   subtype ILS_ELOL_Field is STM32G431xx.Bit;
   subtype ILS_EPL_Field is STM32G431xx.Bit;
   subtype ILS_EWL_Field is STM32G431xx.Bit;
   subtype ILS_BOL_Field is STM32G431xx.Bit;
   subtype ILS_WDIL_Field is STM32G431xx.Bit;
   subtype ILS_PEAL_Field is STM32G431xx.Bit;
   subtype ILS_PEDL_Field is STM32G431xx.Bit;
   subtype ILS_ARAL_Field is STM32G431xx.Bit;

   --  The Interrupt Line Select register assigns an interrupt generated by a
   --  specific interrupt flag from the Interrupt Register to one of the two
   --  module interrupt lines. For interrupt generation the respective
   --  interrupt line has to be enabled via ILE[EINT0] and ILE[EINT1].
   type ILS_Register is record
      --  RF0NL
      RF0NL          : ILS_RF0NL_Field := 16#0#;
      --  RF0WL
      RF0WL          : ILS_RF0WL_Field := 16#0#;
      --  RF0FL
      RF0FL          : ILS_RF0FL_Field := 16#0#;
      --  RF0LL
      RF0LL          : ILS_RF0LL_Field := 16#0#;
      --  RF1NL
      RF1NL          : ILS_RF1NL_Field := 16#0#;
      --  RF1WL
      RF1WL          : ILS_RF1WL_Field := 16#0#;
      --  RF1FL
      RF1FL          : ILS_RF1FL_Field := 16#0#;
      --  RF1LL
      RF1LL          : ILS_RF1LL_Field := 16#0#;
      --  HPML
      HPML           : ILS_HPML_Field := 16#0#;
      --  TCL
      TCL            : ILS_TCL_Field := 16#0#;
      --  TCFL
      TCFL           : ILS_TCFL_Field := 16#0#;
      --  TFEL
      TFEL           : ILS_TFEL_Field := 16#0#;
      --  TEFNL
      TEFNL          : ILS_TEFNL_Field := 16#0#;
      --  TEFWL
      TEFWL          : ILS_TEFWL_Field := 16#0#;
      --  TEFFL
      TEFFL          : ILS_TEFFL_Field := 16#0#;
      --  TEFLL
      TEFLL          : ILS_TEFLL_Field := 16#0#;
      --  TSWL
      TSWL           : ILS_TSWL_Field := 16#0#;
      --  MRAFL
      MRAFL          : ILS_MRAFL_Field := 16#0#;
      --  TOOL
      TOOL           : ILS_TOOL_Field := 16#0#;
      --  DRXL
      DRXL           : ILS_DRXL_Field := 16#0#;
      --  BECL
      BECL           : ILS_BECL_Field := 16#0#;
      --  BEUL
      BEUL           : ILS_BEUL_Field := 16#0#;
      --  ELOL
      ELOL           : ILS_ELOL_Field := 16#0#;
      --  EPL
      EPL            : ILS_EPL_Field := 16#0#;
      --  EWL
      EWL            : ILS_EWL_Field := 16#0#;
      --  BOL
      BOL            : ILS_BOL_Field := 16#0#;
      --  WDIL
      WDIL           : ILS_WDIL_Field := 16#0#;
      --  PEAL
      PEAL           : ILS_PEAL_Field := 16#0#;
      --  PEDL
      PEDL           : ILS_PEDL_Field := 16#0#;
      --  ARAL
      ARAL           : ILS_ARAL_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : STM32G431xx.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ILS_Register use record
      RF0NL          at 0 range 0 .. 0;
      RF0WL          at 0 range 1 .. 1;
      RF0FL          at 0 range 2 .. 2;
      RF0LL          at 0 range 3 .. 3;
      RF1NL          at 0 range 4 .. 4;
      RF1WL          at 0 range 5 .. 5;
      RF1FL          at 0 range 6 .. 6;
      RF1LL          at 0 range 7 .. 7;
      HPML           at 0 range 8 .. 8;
      TCL            at 0 range 9 .. 9;
      TCFL           at 0 range 10 .. 10;
      TFEL           at 0 range 11 .. 11;
      TEFNL          at 0 range 12 .. 12;
      TEFWL          at 0 range 13 .. 13;
      TEFFL          at 0 range 14 .. 14;
      TEFLL          at 0 range 15 .. 15;
      TSWL           at 0 range 16 .. 16;
      MRAFL          at 0 range 17 .. 17;
      TOOL           at 0 range 18 .. 18;
      DRXL           at 0 range 19 .. 19;
      BECL           at 0 range 20 .. 20;
      BEUL           at 0 range 21 .. 21;
      ELOL           at 0 range 22 .. 22;
      EPL            at 0 range 23 .. 23;
      EWL            at 0 range 24 .. 24;
      BOL            at 0 range 25 .. 25;
      WDIL           at 0 range 26 .. 26;
      PEAL           at 0 range 27 .. 27;
      PEDL           at 0 range 28 .. 28;
      ARAL           at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  ILE_EINT array element
   subtype ILE_EINT_Element is STM32G431xx.Bit;

   --  ILE_EINT array
   type ILE_EINT_Field_Array is array (0 .. 1) of ILE_EINT_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for ILE_EINT
   type ILE_EINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EINT as a value
            Val : STM32G431xx.UInt2;
         when True =>
            --  EINT as an array
            Arr : ILE_EINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for ILE_EINT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Each of the two interrupt lines to the CPU can be enabled/disabled
   --  separately by programming bits EINT0 and EINT1.
   type ILE_Register is record
      --  EINT0
      EINT          : ILE_EINT_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : STM32G431xx.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ILE_Register use record
      EINT          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype RXGFC_RRFE_Field is STM32G431xx.Bit;
   subtype RXGFC_RRFS_Field is STM32G431xx.Bit;
   subtype RXGFC_ANFE_Field is STM32G431xx.UInt2;
   subtype RXGFC_ANFS_Field is STM32G431xx.UInt2;

   --  Global settings for Message ID filtering. The Global Filter
   --  Configuration controls the filter path for standard and extended
   --  messages as described in Figure706: Standard Message ID filter path and
   --  Figure707: Extended Message ID filter path.
   type RXGFC_Register is record
      --  RRFE
      RRFE          : RXGFC_RRFE_Field := 16#0#;
      --  RRFS
      RRFS          : RXGFC_RRFS_Field := 16#0#;
      --  Write-only. ANFE
      ANFE          : RXGFC_ANFE_Field := 16#0#;
      --  Write-only. ANFS
      ANFS          : RXGFC_ANFS_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : STM32G431xx.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXGFC_Register use record
      RRFE          at 0 range 0 .. 0;
      RRFS          at 0 range 1 .. 1;
      ANFE          at 0 range 2 .. 3;
      ANFS          at 0 range 4 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype XIDAM_EIDM_Field is STM32G431xx.UInt29;

   --  FDCAN Extended ID and Mask Register
   type XIDAM_Register is record
      --  EIDM
      EIDM           : XIDAM_EIDM_Field := 16#1FFFFFFF#;
      --  unspecified
      Reserved_29_31 : STM32G431xx.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XIDAM_Register use record
      EIDM           at 0 range 0 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype HPMS_BIDX_Field is STM32G431xx.UInt6;
   subtype HPMS_MSI_Field is STM32G431xx.UInt2;
   subtype HPMS_FIDX_Field is STM32G431xx.UInt7;
   subtype HPMS_FLST_Field is STM32G431xx.Bit;

   --  This register is updated every time a Message ID filter element
   --  configured to generate a priority event match. This can be used to
   --  monitor the status of incoming high priority messages and to enable fast
   --  access to these messages.
   type HPMS_Register is record
      --  Read-only. BIDX
      BIDX           : HPMS_BIDX_Field;
      --  Read-only. MSI
      MSI            : HPMS_MSI_Field;
      --  Read-only. FIDX
      FIDX           : HPMS_FIDX_Field;
      --  Read-only. FLST
      FLST           : HPMS_FLST_Field;
      --  unspecified
      Reserved_16_31 : STM32G431xx.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for HPMS_Register use record
      BIDX           at 0 range 0 .. 5;
      MSI            at 0 range 6 .. 7;
      FIDX           at 0 range 8 .. 14;
      FLST           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RXF0S_F0FL_Field is STM32G431xx.UInt7;
   subtype RXF0S_F0GI_Field is STM32G431xx.UInt6;
   subtype RXF0S_F0PI_Field is STM32G431xx.UInt6;
   subtype RXF0S_F0F_Field is STM32G431xx.Bit;
   subtype RXF0S_RF0L_Field is STM32G431xx.Bit;

   --  FDCAN Rx FIFO 0 Status Register
   type RXF0S_Register is record
      --  F0FL
      F0FL           : RXF0S_F0FL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32G431xx.Bit := 16#0#;
      --  F0GI
      F0GI           : RXF0S_F0GI_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : STM32G431xx.UInt2 := 16#0#;
      --  F0PI
      F0PI           : RXF0S_F0PI_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : STM32G431xx.UInt2 := 16#0#;
      --  F0F
      F0F            : RXF0S_F0F_Field := 16#0#;
      --  RF0L
      RF0L           : RXF0S_RF0L_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : STM32G431xx.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF0S_Register use record
      F0FL           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      F0GI           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      F0PI           at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      F0F            at 0 range 24 .. 24;
      RF0L           at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype RXF0A_F0AI_Field is STM32G431xx.UInt6;

   --  CAN Rx FIFO 0 Acknowledge Register
   type RXF0A_Register is record
      --  F0AI
      F0AI          : RXF0A_F0AI_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : STM32G431xx.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF0A_Register use record
      F0AI          at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype RXF1S_F1FL_Field is STM32G431xx.UInt7;
   subtype RXF1S_F1GI_Field is STM32G431xx.UInt6;
   subtype RXF1S_F1PI_Field is STM32G431xx.UInt6;
   subtype RXF1S_F1F_Field is STM32G431xx.Bit;
   subtype RXF1S_RF1L_Field is STM32G431xx.Bit;
   subtype RXF1S_DMS_Field is STM32G431xx.UInt2;

   --  FDCAN Rx FIFO 1 Status Register
   type RXF1S_Register is record
      --  Read-only. F1FL
      F1FL           : RXF1S_F1FL_Field;
      --  unspecified
      Reserved_7_7   : STM32G431xx.Bit;
      --  Read-only. F1GI
      F1GI           : RXF1S_F1GI_Field;
      --  unspecified
      Reserved_14_15 : STM32G431xx.UInt2;
      --  Read-only. F1PI
      F1PI           : RXF1S_F1PI_Field;
      --  unspecified
      Reserved_22_23 : STM32G431xx.UInt2;
      --  Read-only. F1F
      F1F            : RXF1S_F1F_Field;
      --  Read-only. RF1L
      RF1L           : RXF1S_RF1L_Field;
      --  unspecified
      Reserved_26_29 : STM32G431xx.UInt4;
      --  Read-only. DMS
      DMS            : RXF1S_DMS_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF1S_Register use record
      F1FL           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      F1GI           at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      F1PI           at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      F1F            at 0 range 24 .. 24;
      RF1L           at 0 range 25 .. 25;
      Reserved_26_29 at 0 range 26 .. 29;
      DMS            at 0 range 30 .. 31;
   end record;

   subtype RXF1A_F1AI_Field is STM32G431xx.UInt6;

   --  FDCAN Rx FIFO 1 Acknowledge Register
   type RXF1A_Register is record
      --  F1AI
      F1AI          : RXF1A_F1AI_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : STM32G431xx.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF1A_Register use record
      F1AI          at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype TXBC_TBSA_Field is STM32G431xx.UInt14;
   subtype TXBC_NDTB_Field is STM32G431xx.UInt6;
   subtype TXBC_TFQS_Field is STM32G431xx.UInt6;
   subtype TXBC_TFQM_Field is STM32G431xx.Bit;

   --  FDCAN Tx Buffer Configuration Register
   type TXBC_Register is record
      --  unspecified
      Reserved_0_1   : STM32G431xx.UInt2 := 16#0#;
      --  TBSA
      TBSA           : TXBC_TBSA_Field := 16#0#;
      --  NDTB
      NDTB           : TXBC_NDTB_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : STM32G431xx.UInt2 := 16#0#;
      --  TFQS
      TFQS           : TXBC_TFQS_Field := 16#0#;
      --  TFQM
      TFQM           : TXBC_TFQM_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : STM32G431xx.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXBC_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      TBSA           at 0 range 2 .. 15;
      NDTB           at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      TFQS           at 0 range 24 .. 29;
      TFQM           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype TXFQS_TFFL_Field is STM32G431xx.UInt6;
   subtype TXFQS_TFGI_Field is STM32G431xx.UInt5;
   subtype TXFQS_TFQPI_Field is STM32G431xx.UInt5;
   subtype TXFQS_TFQF_Field is STM32G431xx.Bit;

   --  The Tx FIFO/Queue status is related to the pending Tx requests listed in
   --  register TXBRP. Therefore the effect of Add/Cancellation requests may be
   --  delayed due to a running Tx scan (TXBRP not yet updated).
   type TXFQS_Register is record
      --  Read-only. TFFL
      TFFL           : TXFQS_TFFL_Field;
      --  unspecified
      Reserved_6_7   : STM32G431xx.UInt2;
      --  Read-only. TFGI
      TFGI           : TXFQS_TFGI_Field;
      --  unspecified
      Reserved_13_15 : STM32G431xx.UInt3;
      --  Read-only. TFQPI
      TFQPI          : TXFQS_TFQPI_Field;
      --  Read-only. TFQF
      TFQF           : TXFQS_TFQF_Field;
      --  unspecified
      Reserved_22_31 : STM32G431xx.UInt10;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXFQS_Register use record
      TFFL           at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      TFGI           at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TFQPI          at 0 range 16 .. 20;
      TFQF           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype TXEFS_EFFL_Field is STM32G431xx.UInt6;
   subtype TXEFS_EFGI_Field is STM32G431xx.UInt5;
   subtype TXEFS_EFPI_Field is STM32G431xx.UInt5;
   subtype TXEFS_EFF_Field is STM32G431xx.Bit;
   subtype TXEFS_TEFL_Field is STM32G431xx.Bit;

   --  FDCAN Tx Event FIFO Status Register
   type TXEFS_Register is record
      --  Read-only. EFFL
      EFFL           : TXEFS_EFFL_Field;
      --  unspecified
      Reserved_6_7   : STM32G431xx.UInt2;
      --  Read-only. EFGI
      EFGI           : TXEFS_EFGI_Field;
      --  unspecified
      Reserved_13_15 : STM32G431xx.UInt3;
      --  Read-only. EFPI
      EFPI           : TXEFS_EFPI_Field;
      --  unspecified
      Reserved_21_23 : STM32G431xx.UInt3;
      --  Read-only. EFF
      EFF            : TXEFS_EFF_Field;
      --  Read-only. TEFL
      TEFL           : TXEFS_TEFL_Field;
      --  unspecified
      Reserved_26_31 : STM32G431xx.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXEFS_Register use record
      EFFL           at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      EFGI           at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      EFPI           at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      EFF            at 0 range 24 .. 24;
      TEFL           at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype TXEFA_EFAI_Field is STM32G431xx.UInt5;

   --  FDCAN Tx Event FIFO Acknowledge Register
   type TXEFA_Register is record
      --  EFAI
      EFAI          : TXEFA_EFAI_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : STM32G431xx.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXEFA_Register use record
      EFAI          at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype CKDIV_PDIV_Field is STM32G431xx.UInt4;

   --  FDCAN CFG clock divider register
   type CKDIV_Register is record
      --  input clock divider. the APB clock could be divided prior to be used
      --  by the CAN sub
      PDIV          : CKDIV_PDIV_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : STM32G431xx.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CKDIV_Register use record
      PDIV          at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  FDCAN
   type FDCAN_Peripheral is record
      --  FDCAN Core Release Register
      CREL   : aliased CREL_Register;
      --  FDCAN Core Release Register
      ENDN   : aliased STM32G431xx.UInt32;
      --  This register is only writable if bits CCCR.CCE and CCCR.INIT are
      --  set. The CAN bit time may be programed in the range of 4 to 25 time
      --  quanta. The CAN time quantum may be programmed in the range of 1 to
      --  1024 FDCAN clock periods. tq = (DBRP + 1) FDCAN clock period. DTSEG1
      --  is the sum of Prop_Seg and Phase_Seg1. DTSEG2 is Phase_Seg2.
      --  Therefore the length of the bit time is (programmed values) [DTSEG1 +
      --  DTSEG2 + 3] tq or (functional values) [Sync_Seg + Prop_Seg +
      --  Phase_Seg1 + Phase_Seg2] tq. The Information Processing Time (IPT) is
      --  zero, meaning the data for the next bit is available at the first
      --  clock edge after the sample point.
      DBTP   : aliased DBTP_Register;
      --  Write access to the Test Register has to be enabled by setting bit
      --  CCCR[TEST] to 1 . All Test Register functions are set to their reset
      --  values when bit CCCR[TEST] is reset. Loop Back mode and software
      --  control of Tx pin FDCANx_TX are hardware test modes. Programming TX
      --  differently from 00 may disturb the message transfer on the CAN bus.
      TEST   : aliased TEST_Register;
      --  The RAM Watchdog monitors the READY output of the Message RAM. A
      --  Message RAM access starts the Message RAM Watchdog Counter with the
      --  value configured by the RWD[WDC] bits. The counter is reloaded with
      --  RWD[WDC] bits when the Message RAM signals successful completion by
      --  activating its READY output. In case there is no response from the
      --  Message RAM until the counter has counted down to 0, the counter
      --  stops and interrupt flag IR[WDI] bit is set. The RAM Watchdog Counter
      --  is clocked by the fdcan_pclk clock.
      RWD    : aliased RWD_Register;
      --  For details about setting and resetting of single bits see Software
      --  initialization.
      CCCR   : aliased CCCR_Register;
      --  FDCAN_NBTP
      NBTP   : aliased NBTP_Register;
      --  FDCAN Timestamp Counter Configuration Register
      TSCC   : aliased TSCC_Register;
      --  FDCAN Timestamp Counter Value Register
      TSCV   : aliased TSCV_Register;
      --  FDCAN Timeout Counter Configuration Register
      TOCC   : aliased TOCC_Register;
      --  FDCAN Timeout Counter Value Register
      TOCV   : aliased TOCV_Register;
      --  FDCAN Error Counter Register
      ECR    : aliased ECR_Register;
      --  FDCAN Protocol Status Register
      PSR    : aliased PSR_Register;
      --  FDCAN Transmitter Delay Compensation Register
      TDCR   : aliased TDCR_Register;
      --  The flags are set when one of the listed conditions is detected
      --  (edge-sensitive). The flags remain set until the Host clears them. A
      --  flag is cleared by writing a 1 to the corresponding bit position.
      --  Writing a 0 has no effect. A hard reset will clear the register. The
      --  configuration of IE controls whether an interrupt is generated. The
      --  configuration of ILS controls on which interrupt line an interrupt is
      --  signaled.
      IR     : aliased IR_Register;
      --  The settings in the Interrupt Enable register determine which status
      --  changes in the Interrupt Register will be signaled on an interrupt
      --  line.
      IE     : aliased IE_Register;
      --  The Interrupt Line Select register assigns an interrupt generated by
      --  a specific interrupt flag from the Interrupt Register to one of the
      --  two module interrupt lines. For interrupt generation the respective
      --  interrupt line has to be enabled via ILE[EINT0] and ILE[EINT1].
      ILS    : aliased ILS_Register;
      --  Each of the two interrupt lines to the CPU can be enabled/disabled
      --  separately by programming bits EINT0 and EINT1.
      ILE    : aliased ILE_Register;
      --  Global settings for Message ID filtering. The Global Filter
      --  Configuration controls the filter path for standard and extended
      --  messages as described in Figure706: Standard Message ID filter path
      --  and Figure707: Extended Message ID filter path.
      RXGFC  : aliased RXGFC_Register;
      --  FDCAN Extended ID and Mask Register
      XIDAM  : aliased XIDAM_Register;
      --  This register is updated every time a Message ID filter element
      --  configured to generate a priority event match. This can be used to
      --  monitor the status of incoming high priority messages and to enable
      --  fast access to these messages.
      HPMS   : aliased HPMS_Register;
      --  FDCAN Rx FIFO 0 Status Register
      RXF0S  : aliased RXF0S_Register;
      --  CAN Rx FIFO 0 Acknowledge Register
      RXF0A  : aliased RXF0A_Register;
      --  FDCAN Rx FIFO 1 Status Register
      RXF1S  : aliased RXF1S_Register;
      --  FDCAN Rx FIFO 1 Acknowledge Register
      RXF1A  : aliased RXF1A_Register;
      --  FDCAN Tx Buffer Configuration Register
      TXBC   : aliased TXBC_Register;
      --  The Tx FIFO/Queue status is related to the pending Tx requests listed
      --  in register TXBRP. Therefore the effect of Add/Cancellation requests
      --  may be delayed due to a running Tx scan (TXBRP not yet updated).
      TXFQS  : aliased TXFQS_Register;
      --  FDCAN Tx Buffer Request Pending Register
      TXBRP  : aliased STM32G431xx.UInt32;
      --  FDCAN Tx Buffer Add Request Register
      TXBAR  : aliased STM32G431xx.UInt32;
      --  FDCAN Tx Buffer Cancellation Request Register
      TXBCR  : aliased STM32G431xx.UInt32;
      --  FDCAN Tx Buffer Transmission Occurred Register
      TXBTO  : aliased STM32G431xx.UInt32;
      --  FDCAN Tx Buffer Cancellation Finished Register
      TXBCF  : aliased STM32G431xx.UInt32;
      --  FDCAN Tx Buffer Transmission Interrupt Enable Register
      TXBTIE : aliased STM32G431xx.UInt32;
      --  FDCAN Tx Buffer Cancellation Finished Interrupt Enable Register
      TXBCIE : aliased STM32G431xx.UInt32;
      --  FDCAN Tx Event FIFO Status Register
      TXEFS  : aliased TXEFS_Register;
      --  FDCAN Tx Event FIFO Acknowledge Register
      TXEFA  : aliased TXEFA_Register;
      --  FDCAN CFG clock divider register
      CKDIV  : aliased CKDIV_Register;
   end record
     with Volatile;

   for FDCAN_Peripheral use record
      CREL   at 16#0# range 0 .. 31;
      ENDN   at 16#4# range 0 .. 31;
      DBTP   at 16#C# range 0 .. 31;
      TEST   at 16#10# range 0 .. 31;
      RWD    at 16#14# range 0 .. 31;
      CCCR   at 16#18# range 0 .. 31;
      NBTP   at 16#1C# range 0 .. 31;
      TSCC   at 16#20# range 0 .. 31;
      TSCV   at 16#24# range 0 .. 31;
      TOCC   at 16#28# range 0 .. 31;
      TOCV   at 16#2C# range 0 .. 31;
      ECR    at 16#40# range 0 .. 31;
      PSR    at 16#44# range 0 .. 31;
      TDCR   at 16#48# range 0 .. 31;
      IR     at 16#50# range 0 .. 31;
      IE     at 16#54# range 0 .. 31;
      ILS    at 16#58# range 0 .. 31;
      ILE    at 16#5C# range 0 .. 31;
      RXGFC  at 16#80# range 0 .. 31;
      XIDAM  at 16#84# range 0 .. 31;
      HPMS   at 16#88# range 0 .. 31;
      RXF0S  at 16#90# range 0 .. 31;
      RXF0A  at 16#94# range 0 .. 31;
      RXF1S  at 16#98# range 0 .. 31;
      RXF1A  at 16#9C# range 0 .. 31;
      TXBC   at 16#C0# range 0 .. 31;
      TXFQS  at 16#C4# range 0 .. 31;
      TXBRP  at 16#C8# range 0 .. 31;
      TXBAR  at 16#CC# range 0 .. 31;
      TXBCR  at 16#D0# range 0 .. 31;
      TXBTO  at 16#D4# range 0 .. 31;
      TXBCF  at 16#D8# range 0 .. 31;
      TXBTIE at 16#DC# range 0 .. 31;
      TXBCIE at 16#E0# range 0 .. 31;
      TXEFS  at 16#E4# range 0 .. 31;
      TXEFA  at 16#E8# range 0 .. 31;
      CKDIV  at 16#100# range 0 .. 31;
   end record;

   --  FDCAN
   FDCAN_Periph : aliased FDCAN_Peripheral
     with Import, Address => FDCAN_Base;

   --  FDCAN
   FDCAN1_Periph : aliased FDCAN_Peripheral
     with Import, Address => FDCAN1_Base;

end STM32G431xx.FDCAN;
