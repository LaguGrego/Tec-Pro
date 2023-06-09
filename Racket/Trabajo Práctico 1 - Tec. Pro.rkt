#lang racket
#| Trabajo Práctico 1 - Programación funcional
Ejercicio 1                                     |#

(+ 7 (* 2 (/ -1 3)) -10.7)
(/ (* 7/3 5/9) (- 5/8 2/3))
(+ 1 (/ 3 (+ 2 (/ 1 (+ 5 1/2)))))
(* 1 (* -2 (* 3 (* -4 (* 5 (* -6 7))))))


#|Ejercicio 2
(cons 'car '+) => (car . +) 
(list 'esto '(es muy fácil)) => (esto (es muy facil))
(cons 'pero '(se está complicando...)) => (pero se está complicando...) 
(cons '(y ahora no se que ) 'hizo) => ((y ahora no se que). hizo)
(quote (+ 7 2)) => (+ 7 2)
(cons '+ '(10 3)) => (+ 10 3)
(car '(+ 10 3)) => +
(cdr '(+ 10 3)) => (10 3)
cons => #<procedure:cons>
(quote (cons (car (cdr (7 4))))) => (cons (car (cdr (7 4))))
(quote cons) => cons
(car (quote (quote cons))) => quote
(+ 2 3) => 5
(+ '2 '3) => 5
(+ (car '(2 3)) (car (cdr '(2 3)))) => 5
((car (list + - * /)) 2 3) => 5
|#


#|Ejercicio 3
(car (car '((a b) (c d)))) => a
(car (cdr (car '((a b) (c d))))) => b
(car (car (cdr '((a b) (c d))))) => c
(car (cdr (car (cdr '((a b) (c d)))))) => d
|#


#|Ejercicio 4
Todas las de ejercicio anterior, ademas:
(car '((a b) (c d))) => '(a b)
(cdr '((a b) (c d))) => '((c d))
(car (cdr '((a b) (c d)))) => '(c d)
(cdr (car (cdr '((a b) (c d))))) => '(d)
|#


#|Ejercicio 5
Primero list genera una lista (+ - * /), cdr extrae de esta lista la sublista
(- * /), al aplicarle de nuevo cdr se obtiene una segunda sublista (* /),
luego car devuelve *, por lo q la expresión final es (* 5 5) => 25
|#


#|Ejercicio 6|#
(cdr (cdr (cdr '(a b c . x))))
(car (cdr (cdr (cdr '(a b c x)))))
(cdr (car '((a . x) b)))
(car '(x . a))
(cdr '(a . x))

