#lang racket
                                               #| Ejercicio 1 |#
(define-struct punto2d (x y))

(define dist
  (lambda (p1 p2)
     (let* ((x1 (punto2d-x p1)) (x2 (punto2d-x p2))
            (y1 (punto2d-y p1)) (y2 (punto2d-y p2))
            (xdif (- x2 x1)) (ydif (- y2 y1)))
       (sqrt (+ (* xdif xdif) (* ydif ydif)))
      ) 
    )
  )

                                                 #| Ejercicio 2 |#

(define-struct punto3d (x y z))

;;suma todos los puntos
(define coords-sum
  (lambda (ls)
    (if (null? ls)
        '(0 0 0)
        (let ((first (car ls)) (rest (cdr ls)))
          (map + (list (punto3d-x first) (punto3d-y first)
                       (punto3d-z first)) (coords-sum rest))
          )
        )
    )
  )

;;divide cada cordenada por la cantidad de puntos.
(define length-divide
  (lambda (ls lgt)
    (map (lambda (x) (/ x lgt)) ls)
   )
 )

;;funcion principal, llama a corrds-sum y length-divide
(define gravity-center
  (lambda (ls)
    (length-divide (coords-sum ls) (length ls))
    )
  )

                                                   #| Ejercicio 3 |#

;;funcion de concatenar de ejercicios anteriores
(define concatenate
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenate (cdr l1) l2))
        )
    )
  )

;;para cada punto calculo la lista de distancias usando la funcion dist del ej1
(define dist-list
  (lambda (ls pto)
    (map (lambda (x) (dist pto x)) ls)
    )
  )

;;obtener el mayor de la lista

(define max-of-ls
  (lambda (ls max)
    (if (null? ls)
        max
        (if (< (car ls) max)
            (max-of-ls (cdr ls) max)
            (max-of-ls (cdr ls) (car ls))
            )
        )
    )
  )

(define max-dist-r
  (lambda (first ls)
    (if (null? (cdr ls))
        '()
        (concatenate (dist-list ls first) (max-dist-r (car ls) (cdr ls)))
        )
    )    
  )
;;wrapper
(define max-dist
  (lambda (ls)
    (if (null? ls)
        '0
        (max-of-ls (max-dist-r (car ls) ls) '0)
        )
    )
  )

                                              #| Ejercicio 4 |#

(define char-count-r
  (lambda (txt n)
    (define char (read-char txt))
      (if (eof-object? char)
          n
          (char-count-r txt (+ n 1))
          )
    )
  )

(define word-count-r
  (lambda (txt n)
    (let ((word (read txt)))
      (if (eof-object? word)
          n
          (word-count-r txt (+ n 1))
          )
      )
    )
  )
;;contador de chars que llama a char-count-r
(define char-count
  (lambda (txt)
    (char-count-r txt 0)
    )
  )

;;contador de words que llama a word-count-r
(define word-count
  (lambda (txt)
    (word-count-r txt 0)
    )
  )

                                           #| Ejercicio 5 |#

(define txt-file
  (lambda (txt)
    (define line (read-line txt))
    (if (eof-object? line)
        (display "\n")
        (and (display txt) (txt-file txt))
        )
    )
  )
                                            #| Ejercicio 6 |#
(define ascii-weight-r
  (lambda (ls)
    (if (null? ls)
        '0
        (+ (ascii-weight-r (cdr ls)) (char->integer (car ls)))
        )
    )
  )
;;wrapper de la funcion para calcular el peso ascii
(define ascii-weight 
  (lambda (ls)
     (ascii-weight-r (string->list ls))
    )
  )
;;funcion q busca el menor elemento basado en ascii
(define minor
  (lambda (ls)
    (if (null? ls)
        '()
        (let ((first (car ls)) (rest (cdr ls)))
          (if (null? rest)
              first
              (if (< (ascii-weight first) (ascii-weight (car rest)))
                  (minor (cons first (cdr rest)))
                  (minor rest)
                  )
              )
          )
        )
    )
  )
;;funcion para eliminar un elemento

(define erase
  (lambda (elem ls)
    (if (null? ls)
        '()
        (let ((first (car ls)) (rest (cdr ls)))
          (if (eqv? elem first)
              rest
              (cons first (erase elem rest))
              )
          )
        )
    )
  )

(define ordenar
  (lambda (ls)
        (if (null? ls)
        '()
        (cons (minor ls) (ordenar (erase (minor ls) ls)))
        )
    )
  )

                                         #| Ejercicio 7 |#
;;como un cons pero que inserta al final
(define insert-last
  (lambda (elem ls)
    (if (null? ls)
        (cons elem ls)
        (cons (car ls) (insert-last elem (cdr ls))
              )
        )
    )
  )
;;recorre la lista y llama a insert-last en cada elemento
(define reverse
  (lambda (ls)
    (if (null? (cdr ls))
        ls
        (insert-last (car ls) (reverse (cdr ls)))
        )
    )
  )
;;cada vez que encuentre una lista llama a reverse y sigue buscando
(define fullreverse-list
  (lambda (ls)
    (reverse (map (lambda (elem)
                    (if (list? elem)
                        (fullreverse-list elem)
                        elem
                        )
                    ) ls
                      )
             )
    )
  )

                                         #| Ejercicio 8 |#

(define app2list
  (lambda (elem1 elem2)
    (if (and (list? elem1) (list? elem2))
        (concatenate elem1 elem2);concatenar de ej 3
        (if (or (list? elem1) (list? elem2))
            (if (list? elem1)
                (insert-last elem2 elem1); como cons pero lo pongo al final para conservar el orden, insert-last es del ej 7
                (cons elem1 elem2))
            (list elem1 elem2)
            )
        )
    )
  )
  