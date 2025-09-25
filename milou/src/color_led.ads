package Color_led is
   type Bit is mod 2 ** 1; -- Définition du type Bit comme un entier modulaire sur 1 bit
   type Color_Array is array (Positive range 1 .. 24) of Bit; -- Définition d'un tableau de 24 bits
   procedure LED_Blue;
   procedure LED_Red;
   procedure LED_Green;
   procedure LED_Color (Color : Color_Array);
   function Altitude_To_Color (Altitude : Integer) return Color_Array;
end Color_led;