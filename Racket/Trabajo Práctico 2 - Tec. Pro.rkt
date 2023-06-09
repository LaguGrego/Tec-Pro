#lang racket
#| Trabajo práctico 2 - Tecnologías de la programación 
 
;Ejercicio 1

(define a 1)
(define b 2)

(let ((x (/ (* 7 a) b)) (y (/ (* 3 a) b)))
  (+ x y x)
  )
;------------------------------------------------

(let ((ls (list 'd 'e 'f)))
 (cons (car (ls)) (cdr (ls)))
  )

;Ejercicio 2

(let ((x 9))
  (* x
     (let ((x (/ x 3)))
       (+ x x)
       )
  )
 )

;Ejercicio 3

a)

(let ((x 'a) (y 'b))
  (list (let ((z 'c)) (cons z y))
        (let ((w 'd)) (cons x w))))

=> '((c . b) (a . d))

b)
(let ((x '((a b) c)))
  (cons (let ((z (cdr x)))
          (car z))
        (let ((w (car x)))
          (cons (let ((q (cdr w)))
                  (car q))
                (cons (let ((p (car w)))
                        p)
                      (cdr w))))))

 => '(c b a b)

Ejercicio 4

(let ((f (lambda (x) x)))
(f 'a)) => 'a

(let ((f (lambda x x)))
(f 'a)) => '(a)

(let ((f (lambda (x . y) x)))
(f 'a)) => 'a

(let ((f (lambda (x . y) y)))
(f 'a)) => '()

Ejercicio 5|#

(define scheme-syntax (lambda (ls)
       (let ((first-num (car ls))(operator (car (cdr ls)))
                                 (second-num (car (cdr (cdr ls)))))
        (list operator first-num second-num)
         )
  )
)
#|Ejercicio 6|#
(define shorter
  (lambda (l1 l2)
    (if (> (length l1) (length l2))
        l2
        l1
      )
  )
 )
#|Ejercicio 7|#
(define pi 3.1416)
(define area
  (lambda (r)
    (* r r pi)
    )
  )
#|Ejercicio 8|#
(define perimetro
  (lambda (r)
    (* r 2 pi)
    )
  )
#|Ejercicio 9|#
(define circlestuff
  (lambda (r)
    (list (area r)(perimetro r))
    )
  )
#|Ejercicio 10|#
(define distance2d
  (lambda(pto1 pto2)
    (let ((x (- (car pto2) (car pto1)))(y (- (cdr pto2) (cdr pto1))))
      (sqrt (+ (* x x)(* y y)))
    )
   )
  )
#|Ejercicio 10|#
(define proximo_r
  (lambda (dist-min pto ls)
    (if (null? ls)
       dist-min
       (let ((pto1 (car ls)))
             (if(< (distance2d pto pto1) dist-min)
                (proximo_r (distance2d pto pto1) pto (cdr ls))
                (proximo_r dist-min pto (cdr ls))
         )
      )
    )
  )
  )

(define proximo
  (lambda (pto ls)
    (if(null? ls)
       0
       (let ((pto1 (car ls)))
             (proximo_r (distance2d pto pto1) pto (cdr ls))
         )
       )
    )
  )
(proximo  '(5 . 5) (list '(1 . 1) '(2 . 2) '(3 . 3) '(1 . 0)))
(distance2d  '(5 . 5) '(3 . 3))