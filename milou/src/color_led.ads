package Color_led is
   type Bit is mod 2 ** 1; -- Définition du type Bit comme un entier modulaire sur 1 bit
      type Color_Array is array (Positive range 1 .. 24) of Bit; -- Définition d'un tableau de 24 bits

      -- Définition de la couleur rouge : 8 bits à 1, puis 16 à 0
      Red_Color : constant Color_Array := ( 
         0, 0, 0, 0, 0, 0, 0, 0, -- 8 bits à 1 pour le rouge
         1, 1, 0, 0, 0, 0, 0, 0, -- 16 bits à 0 pour le reste
         0, 0, 0, 0, 0, 0, 0, 0

      );
      Green_Color : constant Color_Array := ( 
         1, 1, 1, 1, 1, 1, 1, 1, -- 8 bits à 1 pour le rouge
         0, 0, 0, 0, 0, 0, 0, 0, -- 16 bits à 0 pour le reste
         0, 0, 0, 0, 0, 0, 0, 0

      );

      Blue_Color : constant Color_Array := ( 
         0, 0, 0, 0, 0, 0, 0, 0, -- 16 bits à 0 pour le reste
         0, 0, 0, 0, 0, 0, 0, 0,
         1, 1, 1, 1, 1, 1, 1, 1
      );
   procedure Set_LED (C : Color_Array);
end Color_led;