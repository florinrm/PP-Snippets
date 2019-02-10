#lang racket

; paradigma functionala in a nutshell
; - o aplicare de functii si compuneri de functii
; - putem spune ca se aseamana cu limbajul matematic, in sensul ca avem variabile (fie x = 4, y = 5), pe care nu putem sa le modificam ulterior
; - nu avem loop-uri, acestea sunt simulate de functii recursive (si functionale, vedem mai tarziu)
; - avem instructiuni conditionale (if, cond)
; - format: (aplicare functie) aka (statement / body), ca sa faceti analogie cu Java / C
; - parametrii transmisi doar prin valoare

; operatii aritmetice in Racket
(+ 2 1) ; 2 + 1
(- 3 4) ; 3 + 4
(* 3 4) ; 3 * 4
(/ 5 4) ; 5 / 4 
(quotient 5 4) ; 5 / 4 cu rezultat int
(remainder 5 4) ; returneaza modulo sau restul impartirii

; tipuri de date
; simple

;boolean
(define bool #t) ;true (false cu #f)

;numar
(define number 69)

;simbol - se aseamana cu stringurile
(define symbol '69)
(define symbol2 '5352352ff3q)
(define symbol3 '4fwfw#f)

;compuneri
(cons 1 2) ; avem (1 . 2)
; (1 . 2) -> nu merge sa construim o pereche in acest fel
(car (cons 1 2)) ; car returneaza primul element din pereche
(cdr (cons 1 2)) ; cdr returneaza ultimul element din pereche
(cons 1 (cons 3 4)) ; iese (1 . (3 . 4))

;liste
(define my-list '()) ; lista goala, in loc de '() putem sa avem null
(define my-list2 '(1 2 3 4))
(define my-list3 (list 1 2 3 4)) ; nu list (1 2 3 4), ce e in paranteza se interpreteaza ca o aplicare de functie!
(define my-list4 (list 1 null '() 'feck)) ; o lista in Racket poate contine mai multe tipuri de date
(car my-list2) ; returneaza primul element din lista
(cdr my-list2) ; returneaza lista, FARA PRIMUL ELEMENT
(car (cdr my-list2)); obtinem al doilea element din lista, insa putem combina
(cadr my-list2) ; asa putem obtine al doilea element
; (cdr (car my-list2)) -> nu merge, prin car obtinem un numar (in acest caz), iar cdr merge doar pe liste sau perechi
(append my-list2 my-list3) ; concatenare de liste
(cons 69 my-list2) ; adaugare element in capul listei
(null? my-list2) ; daca lista este goala sau nu
(list? my-list2) ; daca este lista
(reverse my-list2) ; inversarea listei
(length my-list2) ; lungimea listei


; atribuirea unei valori unei variabile
(define var 69) ; var = 69

(+ 5 var) ; var + 5
(* var var)
; (define var (+ var 1)) -> eroare, nu putem sa atribuim o alta valoare unei variabile care este deja declarata
; -> se evita efectele colaterale (modificarea unei variabile in acest caz)
; in Racket, se atribuie o singura data valoare unei variabile

; conditionale
; if
(if (= var 69)
    "e 69" ; echivalentul lui then - daca e adevarata conditia ajunge aici
    "nu e 69" ; echivalentul lui else - daca e falsa conditia ajunge aici
    )
; cond - tine loc de if ... else if ... else sau switch-case
(cond
  ((= var 69) "69 4 life")
  ((= var 420) "pass de joint")
  (else "meh"))

; functii anonime - acestea sunt functiile care se folosesc in Racket
(lambda (x) x) ; formatul: lambda (arg1 arg2 ...) (function-body, unde avem de returnat ceva)
(lambda (x) (* x 2))
((lambda (x y)
   (+ x (* y 2)))
    2 4) ; apelam functia anonima cu parametrii 2 si 4
(define my-func (lambda (x y)
   (+ x (* y 2)))) ; in acest fel legam o functie la un nume, ca sa o putem apela de mai multe ori, fara sa o scriem iar
(my-func 2 4) ; asa apelam
(my-func 5 6)
(define (my-func2 x y) (+ x (* y 2))) ; o alta modalitate de a crea functii, fara sa utilizam lambda: (nume-functie arg1 arg2 ...) (body)
(my-func2 2 4)

(define (sum-list l) (
                      if (null? l)
                         0
                         (+ (car l) (sum-list (cdr l)))
                      )) ; prin acest principiu putem crea functii recursive in Racket, folosim car si cdr (daca avem liste)
 

