

with Uart;       use Uart;
with Interfaces; use Interfaces;
with BMI160;

procedure Test_BMI160 is

   procedure My_Wait (Ms : Natural) is
   begin
      null; 
   end My_Wait;

   function Hardware_Read (Addr : Unsigned_8; Val : out Unsigned_8) return Boolean is
   begin
      if Addr = 16#00# then
         Val := 16#D1#;
      else
         Val := 0;
      end if;
      return True;
   end Hardware_Read;

   function Hardware_Write (Addr : Unsigned_8; Val : Unsigned_8) return Boolean is
   begin
      return True;
   end Hardware_Write;

   -- INSTANCIATION
   package My_IMU is new BMI160
     (Bus_Write        => Hardware_Write,
      Bus_Read         => Hardware_Read,
      Delay_Ms         => My_Wait, 
      Expected_Chip_Id => 16#D1#);

   Status : My_IMU.Status;

begin
   Uart.Init;
   My_IMU.Initialize (Status);
   
   if My_IMU.Success (Status) then
      Uart.Put_Str("It works!");
   else
      Uart.Put_Str("Initialization failed...");
   end if;
   
end Test_BMI160;