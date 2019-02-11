{-# LANGUAGE NoMonomorphismRestriction #-}
import Data.List
import Debug.Trace
import System.Random
import Prelude

-- polimorfism - ne ajuta sa economisim cod, fara sa mai scriem aceeasi functie pentru un alt tip de date, de exemplu
-- lengthInt :: [Integer] -> Integer
-- lengthString :: [String] -> Integer -- si asa mai departe... si in schimb facem asa

-- myLength :: [a] -> Integer -- remember genericitati de la POO

-- clase in Haskell - in analogie cu Java, clasele din Haskell corespund cu interfetele din Java, pentru ca ele au functii neimplementate, exemplu:
{-
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    -- Eq este o clasa predefinita in Haskell, folosita pentru comparare
-} 

-- acum vom "implementa" clasa Eq

data Person = Person {name :: String, cnp :: Integer} -- definim un tip de date, care sa implementeze Eq, ca sa putem compara 2 persoane (astfel definim ceva comparabil cu o clasa normala in Java)
instance Eq Person where
    Person name1 cnp1 == Person name2 cnp2 = name1 == name2 && cnp1 == cnp2
    p1 /= p2 = not (p1 == p2)

-- putem extinde clase in Haskell (o clasa extinde pe alta), de exemplu clasa Ord folosita pentru ordinare extinde clasa Eq:
-- membrii complementarii / functii complementare (implicite): == si /=

-- Maybe - un tip de date nullable, in sensul ca poate fi Nothing (adica null) sau Just (care  nu e null, adica de sine statator)