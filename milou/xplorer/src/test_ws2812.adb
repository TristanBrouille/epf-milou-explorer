with WS2812; use WS2812;
with Last_Chance_Handler;
with board;

procedure Test_Leds is
   NbLeds : constant Positive := 144;
   Leds   : WS2812_Device_T (NbLeds);

   -- Fonction "Wheel" classique pour WS2812
   -- Position : 0 à 255 (0=Rouge, 85=Vert, 170=Bleu)
   function Wheel (Wheel_Pos : U8_T) return Color_T is
      Pos : U8_T := 255 - Wheel_Pos;
   begin
      if Pos < 85 then
         return (R => 255 - Pos * 3, G => 0, B => Pos * 3);
      elsif Pos < 170 then
         -- On décale l'index pour la section suivante
         declare P : U8_T := Pos - 85; begin
            return (R => 0, G => P * 3, B => 255 - P * 3);
         end;
      else
         declare P : U8_T := Pos - 170; begin
            return (R => P * 3, G => 255 - P * 3, B => 0);
         end;
      end if;
   end Wheel;

begin
   Init (Leds);

   loop
      -- Animation : On décale l'arc-en-ciel à chaque tour
      for J in U8_T range 0 .. 255 loop
         for I in 1 .. NbLeds loop
             -- L'astuce : On mélange l'index de la boucle (J) et l'index de la LED (I)
             -- pour créer le dégradé spatial
             Set_GRB_At (Leds, I, Wheel (U8_T ((I * 256 / NbLeds + Integer(J)) mod 255)));
         end loop;
         
         Show (Leds);
         delay 0.01; -- Vitesse de l'animation
      end loop;
   end loop;

end Test_Leds;