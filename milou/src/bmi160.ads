with Interfaces; use Interfaces;

generic
   -- Minimal bus hooks (SPI or I2C behind this)
   with function Bus_Write (Register_Address : Unsigned_8;
                            Value            : Unsigned_8) return Boolean;

   with function Bus_Read  (Register_Address : Unsigned_8;
                            Value            : out Unsigned_8) return Boolean;

   with procedure Delay_Ms (Ms : Natural);

   Expected_Chip_Id : Unsigned_8 := 16#D1#;
package BMI160 is

   ----------------------------------------------------------------------------
   -- Physical quantities (semantic API)
   ----------------------------------------------------------------------------

   -- Acceleration in m/s^2
   type Accel_Value is digits 6 range -200.0 .. 200.0;

   -- Angular rate in deg/s
   type Gyro_Value  is digits 6 range -5000.0 .. 5000.0;

   type Accel_3D is record
      X, Y, Z : Accel_Value;
   end record;

   type Gyro_3D is record
      X, Y, Z : Gyro_Value;
   end record;

   type Sample is record
      Accel : Accel_3D;
      Gyro  : Gyro_3D;
   end record;

   ----------------------------------------------------------------------------
   -- Configuration knobs (semantic)
   ----------------------------------------------------------------------------

   type Accel_Range is (G2, G4, G8, G16);
   for Accel_Range use (G2 => 16#03#, G4 => 16#05#, G8 => 16#08#, G16 => 16#0C#);
   type Gyro_Range  is (DPS125, DPS250, DPS500, DPS1000, DPS2000);
   type ODR is (Hz_25, Hz_50, Hz_100, Hz_200, Hz_400, Hz_800);

   ----------------------------------------------------------------------------
   -- Status
   ----------------------------------------------------------------------------

   type Status_Kind is (Ok, Bus_Error, Not_Present, Not_Initialized);
   subtype Fail_Kind is Status_Kind range Bus_Error .. Not_Initialized;

   type Status is record
      Kind : Status_Kind := Ok;
   end record;

   function Success (S : Status) return Boolean is (S.Kind = Ok);

   ----------------------------------------------------------------------------
   -- API
   ----------------------------------------------------------------------------

   procedure Initialize (Result : out Status);

   procedure Configure
     (Accel_R : Accel_Range;
      Gyro_R  : Gyro_Range;
      Rate    : ODR;
      Result  : out Status);

   -- Returns scaled, physical values (driver owns conversion)
   procedure Read (Data : out Sample; Result : out Status);

end BMI160;