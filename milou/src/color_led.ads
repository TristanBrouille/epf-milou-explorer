package Color_led is
   type Bit is mod 2 ** 1; -- Définition du type Bit comme un entier modulaire sur 1 bit
      type Color_Array is array (Positive range 1 .. 24) of Bit; -- Définition d'un tableau de 24 bits

      -- WS2812 nominal format is GRB, but observed bit mapping is GRB:
      -- bits 1-8 = Blue, bits 9-16 = Red, bits 17-24 = Green

      Green_Color : constant Color_Array := ( 
         1, 1, 1, 1, 1, 1, 1, 1, -- Green: 8 bits
         0, 0, 0, 0, 0, 0, 0, 0, -- Red: 8 bits
         0, 0, 0, 0, 0, 0, 0, 0  -- Blue: 8 bits
      );
      
      Red_Color : constant Color_Array := ( 
         0, 0, 0, 0, 0, 0, 0, 0, -- Green: 8 bits
         1, 1, 1, 1, 1, 1, 1, 1, -- Red: 8 bits
         0, 0, 0, 0, 0, 0, 0, 0  -- Blue: 8 bits
      );
      
      Blue_Color : constant Color_Array := ( 
         0, 0, 0, 0, 0, 0, 0, 0, -- Green: 8 bits
         0, 0, 0, 0, 0, 0, 0, 0, -- Red: 8 bits
         1, 1, 1, 1, 1, 1, 1, 1  -- Blue: 8 bits
      );
      

   procedure Init_LED;
   procedure Set_LED (C : Color_Array);
   procedure Latch_Period;

   
end Color_led;