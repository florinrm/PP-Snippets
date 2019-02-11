{-# LANGUAGE NoMonomorphismRestriction #-}
import Data.List
import Debug.Trace
import System.Random
import Prelude

-- Haskell este un limbaj puternic tipat (este sensibil la castari)
x :: Int
x = 420
y :: Double
-- y = x aici vom avea eroare de castare (Couldn't match expected type ‘Double’ with actual type ‘Int’)
y = fromIntegral x -- asa da

-- nu uitam ca listele in Haskell sunt omogene (dar tuplurile sunt eterogene)

-- tipuri de date

-- type - se aseamana cu typedef / struct din C
type Point = (Double, Double)
p1 :: Point
p1 = (2.3, 4.1)
p2 :: Point
p2 = (4.20, 6.9) -- in constructor, parametrii trebuie sa respecte tipurile din semnatura

-- data - crearea de tipuri noi de date - aici putem sa avem mai multi constructori
data Point2D = CreatePoint2D Double Double | CreatePoint2DX Double deriving Show -- primul nume este constructorul, apoi avem tipurile de date din noul tip creat, practic noi cream o structura noua de date
px = CreatePoint2D 2.4 5.2
py = CreatePoint2D 6.9 4.20

data Point3D = CreatePoint3D Double Double Double deriving Show
p_x = CreatePoint3D 2.4 5.2 42.21
p_y = CreatePoint3D 6.9 4.20 0.4
p_z = CreatePoint3D 53.1 12.1 24.1

-- tipuri enumerate - corespondentul lui enum din C / Java

data Colour = Black | White | Red | Green | Blue deriving Show -- prin deriving Show am voie de folosesc functii de afisare
isColour :: Colour -> Bool
isColour Black = False
isColour White = False
isColour _ = True

-- tipuri inregistrare - se aseamana mai bine cu struct-ul din C

data SomePoint = CreatePoint {point_x :: Double ,point_y :: Double} deriving Show
point1 :: SomePoint
point1 = CreatePoint {point_x = 4, point_y = 10}

-- tipuri parametrizate

-- tipuri recursive - recurenta la nivel de tip, adica apelarea tipului in constructor

data MyList a = Void | Cons a (MyList a) deriving Show -- asa cream un stream de fapt :)

-- newtype - e ca la data, doar ca avem un singur constructor
newtype Grade = CreateGrade Double deriving Show
newtype AltGrade = CreateAltGrade {grade :: Double} deriving Show -- trebuie doar un singur camp, nu mai multe (da eroare altfel)
myGrade = CreateGrade 69.69