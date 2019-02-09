#lang racket

; operatii aritmetice in Racket
(+ 2 1) ; 2 + 1
(- 3 4) ; 3 + 4
(* 3 4) ; 3 * 4

; atribuirea unei valori unei variabile
(define var 69) ; var = 69

(+ 5 var) ; var + 5
(* var var)
; (define var (+ var 1)) -> eroare, nu putem sa atribuim o alta valoare unei variabile care este deja declarata
; in Racket, se atribuie o singura data valoare unei variabile
