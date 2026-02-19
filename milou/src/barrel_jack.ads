with System; 

package Barrel_Jack is

   type Status_T is (Attached, Detached);
   procedure Init;
   
   function Get_Status return Status_T;

   task Attach_Detach with
     Storage_Size => 1 * 1024,
     Priority     => System.Priority'First;

end Barrel_Jack;