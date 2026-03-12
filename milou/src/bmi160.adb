with Interfaces.STM32.RCC;  use Interfaces.STM32.RCC;
with Interfaces.STM32.GPIO; use Interfaces.STM32.GPIO;
with Interfaces.STM32.TIM;  use Interfaces.STM32.TIM;
with Interfaces.STM32;      use Interfaces.STM32;

package body BMI160_Driver is

   use Interfaces;

   ----------------------------------------------------------------------------
   -- Low-level types (private)
   ----------------------------------------------------------------------------

   subtype Byte is Unsigned_8;
   type Reg is new Byte;
   type Cmd is new Byte;

   subtype Axis_Raw is Integer_16;

   ----------------------------------------------------------------------------
   -- Register map (minimal set)
   ----------------------------------------------------------------------------

   CHIP_ID_REG   : constant Reg := Reg (16#00#);
   CMD_REG       : constant Reg := Reg (16#7E#);

   ACC_CONF_REG  : constant Reg := Reg (16#40#);
   ACC_RANGE_REG : constant Reg := Reg (16#41#);
   GYR_CONF_REG  : constant Reg := Reg (16#42#);
   GYR_RANGE_REG : constant Reg := Reg (16#43#);

   GYR_DATA_START : constant Reg := Reg (16#0C#); -- GYR_X_LSB
   ACC_DATA_START : constant Reg := Reg (16#12#); -- ACC_X_LSB

   ----------------------------------------------------------------------------
   -- Commands
   ----------------------------------------------------------------------------

   SOFT_RESET : constant Cmd := Cmd (16#B6#);
   ACC_NORMAL : constant Cmd := Cmd (16#11#);
   GYR_NORMAL : constant Cmd := Cmd (16#15#);

   ----------------------------------------------------------------------------
   -- Internal state
   ----------------------------------------------------------------------------

   Initialized : Boolean := False;

   Current_Accel_Range : Accel_Range := G2;
   Current_Gyro_Range  : Gyro_Range  := DPS250;

   ----------------------------------------------------------------------------
   -- Bus helpers
   ----------------------------------------------------------------------------

   procedure Fail (R : out Status; K : Fail_Kind) is
   begin
      R.Kind := K;
   end Fail;

   function Write_Reg (R : Reg; V : Byte) return Boolean is
   begin
      return Bus_Write (Unsigned_8 (R), V);
   end Write_Reg;

   function Read_Reg (R : Reg; V : out Byte) return Boolean is
   begin
      return Bus_Read (Unsigned_8 (R), V);
   end Read_Reg;

   procedure Send (C : Cmd; Result : out Status) is
   begin
      if not Write_Reg (CMD_REG, Byte (C)) then
         Fail (Result, Bus_Error);
      else
         Result.Kind := Ok;
      end if;
   end Send;

   ----------------------------------------------------------------------------
   -- Encoding (datasheet mappings)
   ----------------------------------------------------------------------------

   function Encode (R : Gyro_Range) return Byte is
   begin
      case R is
         when DPS2000 => return 16#00#;
         when DPS1000 => return 16#01#;
         when DPS500  => return 16#02#;
         when DPS250  => return 16#03#;
         when DPS125  => return 16#04#;
      end case;
   end Encode;

   function Encode (Rate : ODR) return Byte is
   begin
      case Rate is
         when Hz_25  => return 16#06#;
         when Hz_50  => return 16#07#;
         when Hz_100 => return 16#08#;
         when Hz_200 => return 16#09#;
         when Hz_400 => return 16#0A#;
         when Hz_800 => return 16#0B#;
      end case;
   end Encode;

   function Acc_Conf_Value (Rate : ODR) return Byte is
      O : constant Byte := Encode (Rate);
      BW : constant Byte := 0; -- minimal policy
   begin
      return (O and 16#0F#) or (BW and 16#70#);
   end Acc_Conf_Value;

   function Gyr_Conf_Value (Rate : ODR) return Byte is
      O : constant Byte := Encode (Rate);
      BW : constant Byte := 0;
   begin
      return (O and 16#0F#) or (BW and 16#70#);
   end Gyr_Conf_Value;

   ----------------------------------------------------------------------------
   -- Scaling (driver is the authority)
   ----------------------------------------------------------------------------

   -- m/s^2 per LSB
   Accel_Scale : constant array (Accel_Range) of Accel_Value :=
     (G2  => 9.80665 / 16384.0,
      G4  => 9.80665 / 8192.0,
      G8  => 9.80665 / 4096.0,
      G16 => 9.80665 / 2048.0);

   -- deg/s per LSB
   Gyro_Scale : constant array (Gyro_Range) of Gyro_Value :=
     (DPS125  => 125.0  / 32768.0,
      DPS250  => 250.0  / 32768.0,
      DPS500  => 500.0  / 32768.0,
      DPS1000 => 1000.0 / 32768.0,
      DPS2000 => 2000.0 / 32768.0);

   function To_I16 (Lo, Hi : Byte) return Axis_Raw is
      U : Unsigned_16;
   begin
      U := Shift_Left (Unsigned_16 (Hi), 8) or Unsigned_16 (Lo);
      return Axis_Raw (Integer_16 (U));
   end To_I16;

   procedure Read_6 (Start : Reg;
                     B0, B1, B2, B3, B4, B5 : out Byte;
                     Result : out Status) is
      V : Byte;
   begin
      if not Read_Reg (Start + 0, V) then Fail (Result, Bus_Error); return; end if; B0 := V;
      if not Read_Reg (Start + 1, V) then Fail (Result, Bus_Error); return; end if; B1 := V;
      if not Read_Reg (Start + 2, V) then Fail (Result, Bus_Error); return; end if; B2 := V;
      if not Read_Reg (Start + 3, V) then Fail (Result, Bus_Error); return; end if; B3 := V;
      if not Read_Reg (Start + 4, V) then Fail (Result, Bus_Error); return; end if; B4 := V;
      if not Read_Reg (Start + 5, V) then Fail (Result, Bus_Error); return; end if; B5 := V;
      Result.Kind := Ok;
   end Read_6;

   ----------------------------------------------------------------------------
   -- Public API
   ----------------------------------------------------------------------------

   procedure Initialize (Result : out Status) is
      Id : Byte := 0;
      S  : Status;
   begin
      if not Read_Reg (CHIP_ID_REG, Id) then
         Fail (Result, Bus_Error);
         return;
      end if;

      if Id /= Byte (Expected_Chip_Id) then
         Fail (Result, Not_Present);
         Initialized := False;
         return;
      end if;

      Send (SOFT_RESET, S);
      if not Success (S) then Result := S; return; end if;
      Delay_Ms (100);

      Send (ACC_NORMAL, S);
      if not Success (S) then Result := S; return; end if;
      Delay_Ms (10);

      Send (GYR_NORMAL, S);
      if not Success (S) then Result := S; return; end if;
      Delay_Ms (10);

      Initialized := True;
      Result.Kind := Ok;
   end Initialize;

   procedure Configure
     (Accel_R : Accel_Range;
      Gyro_R  : Gyro_Range;
      Rate    : ODR;
      Result  : out Status)
   is
   begin
      if not Initialized then
         Fail (Result, Not_Initialized);
         return;
      end if;

      if not Write_Reg (ACC_RANGE_REG, Accel_R'Value) then Fail (Result, Bus_Error); return; end if;
      if not Write_Reg (GYR_RANGE_REG, Encode (Gyro_R))  then Fail (Result, Bus_Error); return; end if;

      if not Write_Reg (ACC_CONF_REG, Acc_Conf_Value (Rate)) then Fail (Result, Bus_Error); return; end if;
      if not Write_Reg (GYR_CONF_REG, Gyr_Conf_Value (Rate)) then Fail (Result, Bus_Error); return; end if;

      Current_Accel_Range := Accel_R;
      Current_Gyro_Range  := Gyro_R;

      Result.Kind := Ok;
   end Configure;

   procedure Read (Data : out Sample; Result : out Status) is
      Ax0, Ax1, Ay0, Ay1, Az0, Az1 : Byte;
      Gx0, Gx1, Gy0, Gy1, Gz0, Gz1 : Byte;
      S : Status;

      Raw_AX, Raw_AY, Raw_AZ : Axis_Raw;
      Raw_GX, Raw_GY, Raw_GZ : Axis_Raw;
   begin
      if not Initialized then
         Fail (Result, Not_Initialized);
         return;
      end if;

      Read_6 (ACC_DATA_START, Ax0, Ax1, Ay0, Ay1, Az0, Az1, S);
      if not Success (S) then Result := S; return; end if;

      Read_6 (GYR_DATA_START, Gx0, Gx1, Gy0, Gy1, Gz0, Gz1, S);
      if not Success (S) then Result := S; return; end if;

      Raw_AX := To_I16 (Ax0, Ax1);
      Raw_AY := To_I16 (Ay0, Ay1);
      Raw_AZ := To_I16 (Az0, Az1);

      Raw_GX := To_I16 (Gx0, Gx1);
      Raw_GY := To_I16 (Gy0, Gy1);
      Raw_GZ := To_I16 (Gz0, Gz1);

      Data.Accel.X := Accel_Value (Raw_AX) * Accel_Scale (Current_Accel_Range);
      Data.Accel.Y := Accel_Value (Raw_AY) * Accel_Scale (Current_Accel_Range);
      Data.Accel.Z := Accel_Value (Raw_AZ) * Accel_Scale (Current_Accel_Range);

      Data.Gyro.X  := Gyro_Value (Raw_GX) * Gyro_Scale (Current_Gyro_Range);
      Data.Gyro.Y  := Gyro_Value (Raw_GY) * Gyro_Scale (Current_Gyro_Range);
      Data.Gyro.Z  := Gyro_Value (Raw_GZ) * Gyro_Scale (Current_Gyro_Range);

      Result.Kind := Ok;
   end Read;

end BMI160_Driver;