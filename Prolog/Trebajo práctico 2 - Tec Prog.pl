									/*            Ejercicio 1            */
factorial(0,1).
factorial(1,1).
factorial(N,S):-
    N>0,
    N2 is N-1,
    factorial(N2,S2),
    S is N*S2,!.

									/*            Ejercicio 2            */
contar(_,[],0).
contar(X,[X|R],Sol):-
    contar(X,R,Sol2),
    Sol is Sol2 + 1,!.

contar(X,[Y|R],Sol):-
   	X \= Y,
    contar(X,R,Sol),!.
									/*            Ejercicio 3            */
cantidad([],0).
cantidad([_|R],Sol):-
    cantidad(R,Sol2),
    Sol is Sol2 + 1,!.

									/*            Ejercicio 4            */
suma([],0).
suma([X|R],Sol):-
    suma(R,Sol2),
    Sol is X + Sol2,!.
									/*            Ejercicio 5           */     

positivos([],[]).
positivos([X|R],[X|S]):-
    X>0,
    positivos(R,S),!.
positivos([X|R],S):-
    X=<0,
    positivos(R,S),!.

									/*            Ejercicio 6           */
suma_lista([],[],[]).
suma_lista([X1|R1],[X2|R2],[S|L]):-
    S is X1+X2,
    suma_lista(R1,R2,L),!.
									/*            Ejercicio 7           */
%funcion extraida de teoria
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).

eliminar_dup([],[]).
eliminar_dup([CAR|CDR],L):-
    miembro(CAR,CDR),
    eliminar_dup(CDR,L),!.
eliminar_dup([CAR|CDR],[CAR|L]):-
    eliminar_dup(CDR,L).

									/*            Ejercicio 8           */
bigger(X,Y,X):- X>Y.
bigger(X,Y,Y):- not(X>Y).

profundidad([],0).
profundidad([_],1).
profundidad([I,_,D],P):-
    profundidad(I,P1),
    profundidad(D,P2),
    bigger(P1,P2,Pmax),
	P is Pmax + 1,!.

									/*            Ejercicio 9           */
insertar(X,[],[X]).
insertar(X,[CAR|CDR],[CAR|L]):-
    X>CAR,
    insertar(X,CDR,L),!.
insertar(X,[CAR|CDR],[X|CDR]):-
    not(X>CAR).

									/*            Ejercicio 10          */
%busca el menor de la lista.
minor(X,[],X).
minor(X,[CAR|CDR],Min):- X<CAR, minor(X,CDR,Min),!.
minor(X,[CAR|CDR],Min):- not(X<CAR), minor(CAR,CDR,Min),!.
%elimina el valor X q se le pasa.
eliminar(_,[],[]).
eliminar(X,[CAR|CDR],[CAR|L]):- X\=CAR, eliminar(X,CDR,L),!.
eliminar(X,[X|CDR],CDR).
    
ordenar([],[]).
ordenar([X],[X]).
ordenar([CAR|CDR],[Min|List_ord]):- %va creando la lista con los menores
    minor(CAR,CDR,Min), %encuentra el menor.
    eliminar(Min,[CAR|CDR],List_aux), %elimina el menor.
    ordenar(List_aux,List_ord),!. %recursividad con la nueva lista sin el menor.

									/*            Ejercicio 11          */
%concatena dos listas 
concatenate([],L,L).
concatenate([CAR|CDR],L,[CAR|L_out]):- concatenate(CDR,L,L_out).

aplanar([],[]).
aplanar([CAR|CDR],L):-
    aplanar(CAR,L1), %verifica si el elemento no tiene mas listas dentro
    aplanar(CDR,L2), %continua avanzando con la cola de la lista
    concatenate(L1,L2,L),!. %concatena el primer elemento que encuentre (no lista) y lo une al resto de elemento de la lista
aplanar(X,[X]).
	    
									/*            Ejercicio 12          */

ins(X, L, [ X | L ]).
ins(X, [ Y | L1 ], [ Y | L2 ]) :- ins(X, L1, L2).

per([],[]).
per([ X | L ], Lp) :- per(L, L1), ins(X, L1, Lp).
/*  
L = [1, 2, 3];L = [2, 1, 3];L = [2, 3, 1];L = [1, 3, 2];L = [3, 1, 2];L = [3, 2, 1];false.
Basicamente genera todas las posibles permutaciones de una lista.
Lo que hace es partir la lista en el primer elemento y el resto recursivamente hasta llegar a 
la lista vacia donde la unica permutacion es []. luego vuelve generando las permutaciones del resto y poniendo en todas
la cabeza X.
*/


