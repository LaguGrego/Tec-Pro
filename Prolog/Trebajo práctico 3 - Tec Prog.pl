									/*            Ejercicio 1            */
factorial(0, 1).
factorial(Numero, Factorial) :- Numero > 0, NumeroAnt is Numero - 1,
factorial(NumeroAnt, FactorialAnt),
Factorial is Numero * FactorialAnt,!.

/* El corte !, en el caso de que se quiera terminar el programa coando devuelva la primera
(y unica) respuesta, se debe colocar en el predicado que sera el último en unificar
del alghoritmo, o sea, la ultima línea que se ejecutará antes de responder la consulta.
*/
									/*            Ejercicio 2            */
p(1).
p(2):-!.
p(3).

/*
a. p(X).  => X = 1; X = 2 
	// busca la condicion p(_), cuando llega a p(2) como tiene el corte ! termina
b. p(X), p(Y).    => X = Y, Y = 1 ; X = 1, Y = 2 ; X = 2, Y = 1 ; X = Y, Y = 2
	// Busca las combinaciones posibles para P(X) y P(Y) y cada vez que llega a 
    P(2) deja de buscar mas opciones por el corte antes dicho.
c. p(X), !, p(Y). => X = Y, Y = 1; X = 1,Y = 2
	//Busca que se cumplan las condiciones p(X) y p(Y), pero por el corte (!) en la 
    consulta se detiene el backtraking, por lo que no se exploran mas posibilidades
    para p(X), solo para p(Y) que se encuentra despues del corte. De todas formas
    p(3) nunca llega a ser una opcion por el corte en p(2), al igual que pasa en 
    los anteriores incisos.
*/
									/*            Ejercicio 3            */

eliminar_primero([X|CDR],X,CDR).
eliminar_primero([CAR|CDR], X,[CAR|L]):- CAR\=X,
    eliminar_primero(CDR,X,L),!.

									/*            Ejercicio 4            */
agregar_nuevo(X,[],[X]).
agregar_nuevo(X,[X|CDR],[X|CDR]):-!.
agregar_nuevo(X,[CAR|CDR],[CAR|L]):-
     not(X=CAR),
    agregar_nuevo(X,CDR,L),!.

									/*            Ejercicio 5            */
semejanza([],[],0).  %corta cuando las dos palabras se terminen
semejanza([],[_|CDR],S):- semejanza([],CDR,S1),S is S1-1. % en estas lineas resta punto cada letra que tenga una
semejanza([_|CDR],[],S):- semejanza(CDR,[],S1),S is S1-1. % palabra y cuando la otra ya termino (\= largo)
	% si las letras son iguales suma un punto y avanza
semejanza([CAR1|CDR1],[CAR1|CDR2],Points):-
    semejanza(CDR1,CDR2,Points2),
    Points is Points2+1,!.
	% letras distintas resta punto y avanza
semejanza([CAR1|CDR1],[CAR2|CDR2],Points):-
    not(CAR1=CAR2),
    semejanza(CDR1,CDR2,Points2),
    Points is Points2-1,!.
									/*            Ejercicio 6            */

diccionary([sanar, hola, sabana, sabalo, prueba, computadora,
      cartera, mate, termo, mesa, silla, sarna]).
%funcion extraida de teoria
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).

buscar_aux(_,[],[]).

buscar_aux(Word,[CAR|Dic],[Sol|L]):-
    atom_chars(Word,Char_word), %transformo ambas palabras a lista de chars para trabajar
    atom_chars(CAR,Char_car),
    semejanza(Char_word,Char_car,Sem), %calculo semejanza
    Sem>0,
    buscar_aux(Word,Dic,L), % recursividad para q avance a la siguiente letra
    Sol = [CAR,Sem],!. % si semejanza >0 devuelvo lista [palabra,semejanza] 

buscar_aux(Word,[CAR|Dic],L):-% hago lo mismo q arriba pero si semejanza=<1 no devuelvo nada
    atom_chars(Word,Char_word),
    atom_chars(CAR,Char_car),
    semejanza(Char_word,Char_car,Sem),
    not(Sem>0),
    buscar_aux(Word,Dic,L).

buscar(Word,[Word]):- diccionary(Dic), miembro(Word,Dic),!.

buscar(Word,L):- diccionary(Dic), buscar_aux(Word,Dic,L).

									/*            Ejercicio 7            */

reemplazar(_,_, _, 0, List_in, List_in). % si la cantidad re reemplazos a realizar es 0, devuelve la lista q recibe
reemplazar(_,_, _, _, [], []).

	% si el from (a partir de que instancia empieza a reemplazar) es \=1 cuando encuentra el elemento
	% que hay que reemplazar,no lo reemplaza y sigue buscando en la lista con from-1. 
reemplazar(Replaced,To_replace, From, Cant, [Replaced|List_in], [Replaced|List_out]):- 
	From>1, From_dism is From-1,
    reemplazar(Replaced,To_replace, From_dism, Cant, List_in, List_out),!.

	% si el Cant es 1 y el elemento de la lista no es el q buscamos reemplazar, sigue buscando
reemplazar(Replaced,To_replace, From , Cant, [CAR|List_in], [CAR|List_out]):- 
    CAR\=Replaced, Cant\=0,
    reemplazar(Replaced,To_replace, From , Cant, List_in, List_out),!.

	% encuentra el elemento, Cant es 1 por lo que reemplaza y resta 1 a cantidad de reemplazos restantes.
reemplazar(Replaced,To_replace, 1 , Cant, [Replaced|List_in], [To_replace|List_out]):- 
    Cant\=0, Cant_dism is Cant-1,
    reemplazar(Replaced,To_replace, 1 , Cant_dism , List_in, List_out),!.

									/*            Ejercicio 8            */
connected(a,b).
connected(a,d).
connected(b,c).
connected(c,g).
connected(g,s).
connected(g,f).
connected(f,e).
connected(f,d).
 
% para ver si dos puntos estan conectados 
connection(X,Y):- connected(X,Y); connected(Y,X).
salir_aux(Ini_pos,[Ini_pos|History],[Ini_pos|History]).% cuando llego al punto de salida, lo incluyo al camino y termino la recursion
salir_aux(Ini_pos,[Actual_pos|History],Way):-
    connection(Actual_pos,Prox_pos), % consigo una prox posicion con las conectadas a la actual
    not(miembro(Prox_pos,History)), % verifico q no estuve en la prox posicion
    salir_aux(Ini_pos,[Prox_pos,Actual_pos|History],Way).% agrego la prox_pos a la lista y dale recursividad

%vamos a buscar desde la salida hasta la posicion inicial 
salir(Pos, Way):- salir_aux(Pos,[s],Way).

%algunos ejemplos no me andan como en el enunciado del ejercicio pero creo q es error del enunciado, sino
%no se q tengo mal













