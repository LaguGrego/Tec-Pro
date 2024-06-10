#lang racket
                        #| Ejercicio en cuestion |#
;esto cuenta cuantas veces aparece el equipo en la lista de partidos
(define cant_partidos(lambda (pais ls)
    (if (empty? ls)
        0
        (let* ((partido (car ls)) (equipo1 (caar partido)) (equipo2 (caadr partido)))
            (if(or (equal? pais equipo1) (equal? pais equipo2))
                (+ 1 (cant_partidos pais (cdr ls)))
                (cant_partidos pais (cdr ls))    
            )
        )
    )
))

;verifica si un dato ya esta en la lista

(define repetido(lambda(x ls) 
    (if (empty? ls)
        #f
        (if (equal? x (car ls)) 
            #t
            (repetido x (cdr ls))
        )
    )
))
;elimina los duplicados
(define eliminar_dup(lambda (ls)
    (if (empty? ls)
        '()
        (if(repetido (car ls) (cdr ls) )
            (eliminar_dup (cdr ls))
            (cons (car ls) (eliminar_dup (cdr ls)))
        )
    )
))

#|recibe dos listas, ls donde la va a recorrer para ver que equipos hay y contar la cantidad
de partidos, y ls_orig que es la lista original de datos que no cambia, para poder buscar cada
pais en la lista entera de partidos.|#
(define partidos_wrapper(lambda (ls ls_orig)
    (if (empty? ls)
        ;cuando llega al final de los partidos devuelve la lista vacia donde poner los resultados
        '()    
        ;busco los dos paises de cada partido
        (let ((pais (caaar ls)) (pais2 (caadar ls)))
        #|esto agarra los dos paises y cuenta sus partidos,la primera vez cuenta bien, pero
        despues cuando encuentra de nuevo el pais vuelve a contar sus partidos en lo que 
        resta de la lista, asi q hay q eliminar los duplicados|#
                (eliminar_dup 

                    ;arma la lista (pais cantidad_partidos) para los dos partidos del equipo
                    ;llamando cada vez a la funcion que cuenta los partidos
                        (cons (list pais (cant_partidos pais ls_orig)) 
                        (cons (list pais2 (cant_partidos pais2 ls_orig)) (partidos_wrapper (cdr ls) ls_orig)))
                    ;una vez que lista los dos equipos del partido, llama a recursion con el
                    ;prox partido.
                )
        )   
    )
))

;recibe la lista de datos y las manda al wrapper
(define partidos(lambda (ls)
    (partidos_wrapper ls ls)
))
#| codigo de prueba
(partidos '( ( (Argentina . 5) (Brasil . 0 ) )
( (Argentina . 3) (Bolivia . 2) )
( (Argentina . 2) (Chile . 1) )
( (Bolivia . 1) (Paraguay . 0) )
( (Brasil . 1) (Venezuela . 0) )
( (Colombia . 0) (Ecuador . 2) )
( (Brasil . 2) (Ecuador . 1) )
))
|#