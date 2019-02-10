#lang racket

; recursivitate pe stiva - cea clasica
; se pastreaza apelurile functiei in stiva pana cand se ajunge la conditia de stop (n == 0)
; exemplu - suma primelor n numere naturale)
(define (stack-sum n) (
                       if (= n 0)
                          n
                          (+ n (stack-sum (- n 1))) ; urmatorul pas de recursivitate, apelul se pune pe stiva
                       ))
(stack-sum 10) ; 55
(stack-sum 4) ; 10

; recursivitate pe coada

; in general (nu este o regula), lumea face o functie helper in care avem un acumulator
; in acumulator "acumulam" rezultatele functiei recursive la fiecare pas de recursivitate
; avantajul este ca nu se foloseste stiva pentru a mentine apelurile functiei, rezultatul final va fi cel din ultimul apel recursiv (fix acumulatorul),
; fara sa ne intoarcem la primul apel prin restul de apeluri recursive, ca la recursivitatea pe stiva 
(define (sum-helper n acc) (
                            if (= n 0)
                               acc
                               (sum-helper (- n 1) (+ acc n))
                            ))
(define (queue-sum n) (sum-helper n 0))
(queue-sum 10) ; 55
(queue-sum 4) ; 10

; recursivitate arborescenta (remember AA & arbori de recurenta la complexitati?)

(define (fibo n) (
                  cond
                   ((equal? n 0) 0) ; daca n este egal cu 0
                   ((equal? n 1) 1) ; daca n este egal cu 1
                   (else (+ (fibo (- n 1)) (fibo (- n 2)))) ; avem 2 apeluri recursive ale functiei in acelasi timp - creez astfel copii unui nod
                  ))

