#lang racket
#| Ejercicio 1 |#
(define factorial
  (lambda(x)
    (if(< x 1)
       1
       (* (factorial (- x 1)) x)
    )
  )
 )

#| Ejercicio 2 |#

(define largo
  (lambda(x)
    (if(empty? (cdr x))
       1
       (+ (largo (cdr x)) 1)
    )
  )
 )

#| Ejercicio 3 |#

(define count-elem
  (lambda(x ls)
    (if(empty? ls)
       0
       (if (equal? (car ls) x)
           (+ (count-elem x (cdr ls)) 1)
           (+ (count-elem x (cdr ls)) 0)
           )
       )
    )
  )

#| Ejercicio 4 |#

(define subst
  (lambda(x y ls)
    (if(empty? ls)
       '()
       (if (equal? (car ls) x)
           (cons y (subst x y (cdr ls)))
           (cons (car ls) (subst x y (cdr ls)))
           )
       )
    )
  )

#| Ejercicio 5 |#

(define erase-elem
  (lambda(x ls)
    (if(empty? ls)
       '()
       (let ((first (car ls)) (rest (cdr ls)))
         (if (equal? first x)
             (erase-elem x rest)
             (cons first (erase-elem x rest))
             )
         )
       )
    )
  )

(define make-list
  (lambda (rep val)
    (if (< rep 1)
        '()
        (cons val (make-list (- rep 1) val) )
     )
    )
  )

(define agrupar
  (lambda (ls)
    (if (empty? ls)
        '()
        (let* ((first (car ls)) (second (cdr ls)) (rep (count-elem first ls)))
          (cons (make-list rep first)
                (agrupar (erase-elem first second)))
          )
        )
    )
  )

#| Ejercicio 6 |#

(define concatenar
  (lambda (ls1 ls2)
    (if (empty? ls1)
        ls2
        (let ((first (car ls1)) (rest (cdr ls1)))
          (if (empty? rest)    
              (cons first ls2)   
              (cons first (concatenar rest ls2)))
          )   
        )
    )
  )

#| Ejercicio 7 |#

(define primer-num
  (lambda (ls)
    (if (empty? ls)
        null
        (let ((first (car ls)) (rest (cdr ls)))
          (if (number? first)
              first
              (primer-num rest)
              )
          )
        )
    )
  )

#| Ejercicio 8 |#

(define attach-at-end
  (lambda (end ls)
    (concatenar ls (cons end '()))
    )
  )

#| Ejercicio 9 |#

(define conv-datos-d
  (lambda (ls)
    (map (lambda (x) (sqrt (* x x))) ls)
  )
 )

(define conv-datos-t
  (lambda (ls)
    (map (lambda (x) (string->number x)) ls)
    )
  )

(define conv-datos-b
  (lambda (ls)
    (map (lambda (x) (if (equal? "V" x)
                         '1
                         '0)
           ) ls)
    )
  )

(define conv-datos
  (lambda (ls)
    (if (null? ls)
        '()
        (let ((data-type (car (car ls))) (data-ls (car(cdr (car ls)))) (rest (cdr ls)))
          ;;basicamente acá dependiendo el data-type llama a la funcion correspondiente
          (if (equal? "D" data-type)
              (cons (conv-datos-d data-ls) (conv-datos rest))
              (if (equal? "T" data-type)
                  (cons (conv-datos-t data-ls) (conv-datos rest))
                  (cons (conv-datos-b data-ls) (conv-datos rest))
                  )
              )
          )
        )
    )
  )

#| Ejercicio 10 |#
;;codigo sacado del tp2
(define distance2d
  (lambda(pto1 pto2)
    (let ((x (- (car pto2) (car pto1)))(y (- (cdr pto2) (cdr pto1))))
      (sqrt (+ (* x x)(* y y)))
    )
   )
  )

(define distancias
  (lambda (ls)
    (if (null? (cdr ls))
        '()
        (let ((first-point (car ls)) (second-point (car (cdr ls))))
          (cons (distance2d first-point second-point) (distancias (cdr ls)))
          )
        )
    )
  )