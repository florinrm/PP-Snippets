{-# LANGUAGE NoMonomorphismRestriction #-}
import Data.List
import Debug.Trace
import System.Random
import Prelude

-- spre deosebire de Racket, in Haskell avem doar evaluare lenesa, functii curry, tipuri de date si nu avem deloc efecte laterale (set! in Racket)


-- asa definim o functie in Haskell
add_numbers :: Num a => a -> a -> a -- e de bun simt sa punem semnatura functiei (asta se face oricum automat cu :t in terminalul de ghci)
add_numbers x y = x + y
square :: Num a => a -> a
square x = x * x
square2 x = (*) x x
-- folosind de lambda
my_func = \ x y -> (2 * x) + (3 * y)

-- asa declaram si initializam o variabila
my_var = 69

-- liste -- contin elemente omogene / de acelasi tip
my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- asa verificam daca un element apartine unei liste sau nu
check1 = elem 4 my_list -- prefixat
-- sau asa
check2 = my_var `elem` my_list -- infixat cu `
-- adaugare in lista
my_list2 = 10 : 20 : 30 : my_list
a = head my_list2 -- capul listei (car din Racket)
b = tail my_list2 -- lista fara cap (cdr din Racket
conc = my_list ++ my_list2 -- concatenare de liste

-- perechi / tupluri - contin elemente eterogene
pair = (4, 1, "Decebal", True) -- tuplu
pair2 = (69, "Decebal") -- pereche (doar aici merg fst si snd)
kek = fst pair2
meh = snd pair2

-- functii si conditionale
-- cu if then si else - aici nu conteaza identarea
sumListIf l = if (l == []) 
    then 0
    else (head l) + (sumListIf (tail l))
-- cu garzi, care inlocuiesc in mod elegant blocurile de if else if... else... - ordinea blocurilor conteaza - identarea conteaza (altfel apare parse error on input)
sumListGuard l
    | l == [] = 0
    | otherwise = (head l) + (sumListGuard (tail l))
-- cu case of, care simuleaza switch-case din C / Java - identarea conteaza
sumListCase l = case l == [] of
    True -> 0
    _ -> (head l) + (sumListCase (tail l)) -- _ = orice valoare
-- pattern matching - sunt in stilul TDA-urilor de la AA
sumList [] = 0
sumList (x : l) = x + sumList l -- x reprezinta capul listei, iar l reprezinta restul listei (tail adica)

-- Point free programming - compunere de functii
