#lang racket

(define a 69)

; let
(let (
      (a 1) ; aici il suprascriu la nivelul (local) al let-ului pe a, va avea efect doar aici
      (b 2)
      ;(c b) ; nu merge sa ii atribui lui c valoarea lui b, in let c nu poate sa vada variabilele care sunt declarate inainte sa (evident, nici cele dupa, daca ar fi in acest caz)
      (c 3)
      )
  ; doar aici sunt vizibile variabilele declarate un pic mai sus, aici incep sa fie ele vizibile, nu imediat dupa declaratie
  (cons a b)
  (+ a (* b c))
  )

; let*
(let* (
      (a 1)
      (b 2) ; de aici incepe sa fie vizibil b
      (c b) ; aici este evidentiata diferenta dintre let* si let, c poate sa il vada pe b care e declarat inaintea sa
      )
  (cons a b)
  (+ a (* b c))
  )

; letrec - spre deosebire de let si let*, domeniul de vizibilitate este in tot letrec
; insa aici trebuie sa fim atenti la variabilele neinitializate => produc erori
; de regula, letrec e folosit la inchideri functionale (echivalentul functiilor recursiv-mutuale din C - SD memoriez)
(letrec ([is-even? (λ (n)
                       (or (= n 0)
                           (is-odd? (- n 1))))]
           [is-odd? (λ (n)
                      (and (not (= n 0))
                           (is-even? (- n 1))))])
    (is-odd? 11))

;named let - o modalitate de a itera prin functie (adica sa te folosesti de recursivitatea functiei, folosind variabilele din let
; adica intr-o functie iti creezi o functie locala, care va actiona ca o functie recursiva propriu-zisa
(define (interval a b step)
  (let iter ((b b) (result '())) ; parametrul b este inițializat cu valoarea b, result cu '(), definim astfel o functie numita iter cu 2 parametri care au valori default
    (if (> a b) ; aici este b-ul din let, nu cel din interval a b
        result
        (iter (- b step) (cons b result))))) ; continuam recursivitatea lui iter
(interval 2 10 2) ; '(2 4 6 8 10)