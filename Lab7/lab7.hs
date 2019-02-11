{-# LANGUAGE NoMonomorphismRestriction #-}
import Data.List
import Debug.Trace
import System.Random
import Prelude

-- let - acelasi lucru ca in Racket

myPair = let
            x = 69
            y = 420
            func b = x - b + 69
        in (x + y, x * y, func y)

-- where - e fix ca la let, doar ca ordinea difera
myPair2 = (x + y, x * y, func2 y)
    where
        x = 69
        y = 420
        func2 b = x - b + 69

-- streamuri
-- syntax sugar
naturals_stream = [0..]
-- with wheres
naturals_stream_where = iter 0
        where iter x = x : iter (x + 1)
-- with iterate functional
naturals = iterate (\x -> x + 2) 0

ones = repeat 1 -- [1, 1, 1, ..]
onesTwos = intersperse 2 ones -- [1, 2, 1, 2, ..]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs) -- sirul lui Fibonacci
powsOfTwo = iterate (* 2) 1 -- puterile lui 2
palindromes = filter isPalindrome [0..] -- palindroame
    where
    -- truc: reprezint numarul ca String
    isPalindrome x = show x == reverse (show x)

-- $ elimina parantezele, f . g = (f(g(x)))