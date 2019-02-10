#lang racket

; curry - cele normale, pe care le-ati folosit pana acum
; uncurry - functii cu putini parametrii, care returneaza o alta functie -> importanta: reutilizare de cod + functionale

(define add-curry
  (lambda (x)
    (lambda (y)
      (+ x y))))
(add-curry 1) ; returneaza o functie
((add-curry 1) 2) ; 3

; functionale - ne ajuta sa scriem mai putin cod cand vrem sa aplicam functii pe liste (aim, shoot and kill)

; map - aplic o functie pe fiecare element din lista - daca am n liste, atunci functia are n parametrii
(map (λ (x) (+ x 3)) '(1 2 3 4))
(map (λ (x y) (+ x y)) '(1 2 3 4) '(5 6 7 8)) ; obtin o lista prin adunarea celor 2 liste
(map + '(1 2 3 4) '(4 3 2 1) '(10 12 13 14))

; apply - aplic o functie pe toata lista, nu pe fiecare element
; (apply (λ (x) (+ x 3)) '(1 2 3 4)) -> nu merge
(apply * '(1 2 3)) ; acumulatorul default e primul element
(apply * 0 '(1 2 3)) ; avem acumulator
(apply + 1 2 4 '(1 2 3))
(apply list '(1 2 3 4) '(5 7) '(10 20 30 40)) ; primele doua liste se comporta ca 2 elemente ce sunt inserate in a treia lista, pe care aplicam functia
; (apply + '(1 2 3 4) '(4 3 2 1) '(10 12 13 14)) ; nu merge, asa ca sa vedem diferenta intre apply si map

; trick cu apply map
(apply map list '((1 2 3) (5 6 7) (10 12 34))) ; transpusa unei matrici

; filter - selectam elementele din lista ce indeplinesc criteriul din functie / predicat
(filter odd? '(1 2 3 4 5 6))
(filter (λ (x) (not (= 4 x))) '(1 2 3 4 5)) ; ia elementele care sunt nu egale cu 4

; foldr / foldr - functia pe care aplic pe rand intre acumulator si un element al listei (incepand cu ultimul element la foldr / incepand cu primul element la foldl)
(foldr + 0 '(1 2 3 4))
(foldl (λ (x y) (+ x y)) 0 '(1 2 3 4))