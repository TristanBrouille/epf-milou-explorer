with STM32G431xx.RCC;  use STM32G431xx.RCC;
with STM32G431xx.GPIO; use STM32G431xx.GPIO;
with STM32G431xx; use STM32G431xx;

with Ada.Real_Time; use Ada.Real_Time;

package body Barrel_Jack is

   procedure Init is
   begin
      -- Enable GPIOA clock
      RCC_Periph.AHB2ENR.GPIOAEN := 1;
      -- PA9 as input
      GPIOA_Periph.MODER.Arr (9) := 2#00#;
      -- Internal pull-up
      GPIOA_Periph.PUPDR.Arr (9) := 2#01#;
   end;

   protected Jack is
      procedure Set (S : Status_T);
      function Get return Status_T;
   private
      Status : Status_T := Attached;
   end;

   protected body Jack is
      procedure Set (S : Status_T) is
      begin
         Status := S;
      end;
      function Get return Status_T is
         (Status);
   end;

   function Get_Status return Status_T is
      (Jack.Get);

   type Idx_T is mod 5; -- 0, 1, 2, 3, 4
   type Status_Array_T is array (Idx_T) of Status_T;

   task body Attach_Detach is
      Next_Release : Time := Clock;
      Period : Time_SPan := Milliseconds (10);

      Status_Array : Status_Array_T := (others => Attached);
      Idx : Idx_T := Idx_T'First;
   begin
      loop
         -- update raw data
         Status_Array (Idx) := (if GPIOA_Periph.IDR.IDR.Arr(9) = 1 then Attached else Detached);
         Idx := Idx + 1;

         -- decide if attached or detached
         declare
            Counter : Natural := 0;
         begin
            for S of Status_Array loop
               Counter := Counter + (if S = Detached then 1 else 0);
            end loop;
            -- Update the Status
            Jack.Set ((if Counter >= Natural (Idx_T'Last) then Detached else Attached));
         end;

         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Attach_Detach;


end Barrel_Jack;