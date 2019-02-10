#lang racket

; evaluarea lenesa - eliminam posibilitatea de a avea functii care sunt infinite / nu se termina
; cum facem evaluare lenesa?

; 1. bagam o functie lambda in alta functie care are parametri, incat sa intarziem evaluarea, astfel functia principala va returna o functie
(define sum
  (lambda (x y)
    (lambda ()
      (+ x y))))
(sum 1 2) ; va returna o functie
((sum 1 2)) ; apelam functia fara parametri returnata de (sum 1 2) (remember curry functions)

; 2. folosim promisiuni
(define sum-promise
  (lambda (x y)
    (delay (+ x y)))) ; intarziem aplicarea functiei
(sum-promise 69 420) ; va returna o promisiune
(force (sum-promise 69 420)) ; va returna rezultatul, prin fortarea functiei

; fluxuri
(define ones-stream
  (cons 1 (lambda () ones-stream)))
;(stream-take ones-stream 5)