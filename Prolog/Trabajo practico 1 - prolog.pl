                                            /* Ejercicio 1 */ 
f(a, 2).
f(a, 3).
f(b, 2).
f(b, 4).
f(c, 1).
f(c, 2).

/*
f(X, 1).  => X = c
f(X).     => procedure `f(A)' does not exist
f(a, X).  => X = 2
f(c, 1).  => true
f(X, Y).  => X = a, Y = 2
f(2, a).  => false
f(X, Y), f(X, 4).  => X = b, Y = 2
*/ 

                                               /* Ejercicio 2 */  
  /*esta todo comentado porq sino me da error en los ejercicios siguientes
padre(leoncio, alberto).
padre(leoncio, geronimo).
padre(alberto, juan).
padre(alberto, luis).
padre(geronimo, luisa).
hermano(X,Y):- 
    padre(Z,X), padre(Z,Y), X\=Y.
nieto(X,Y):- 
    padre(Y,Z), padre(Z,X).
 
como consultaria si alberto es padre de luis?------padre(alberto,luis).  => true
como consultaria si luis es padre de alberto?------padre(luis, alberto).  => false
como consultaria quien es hermano de luis?---------hermano(luis, X). => juan
como consultaria de quien es nieto luisa?----------nieto(luisa, X). => false
como consultaria quien es nieto de quien? ---------nieto(X,Y). => X = juan, Y = leoncio
 */

                                                /* Ejercicio 3 */ 
menu("Bombones de jamón", "Locro", "Dulce de batata").
menu("Bombones de jamón", "Locro", "Alfajor norteño").
menu("Tarta de Atún", "Atados de repollo", "Dulce de batata").
menu("Tarta de Atún", "Pollo romano con hierbas y vino", "Flan").
menu("Volovanes de atún", "Matambre con espinacas y parmesano", "Torta moka").
menu("Buñuelos de bacalao", "Pollo romano con hierbas y vino", "Alfajor norteño").
/*
menu(X,Y,Z).  ----> todos los menúes. 
menu(X,Y,"Dulce de batata"). ---> X = "Bombones de jamón", Y = "Locro" ; X = "Tarta de atún", Y = "Atados de repollo".
menu(X,"Locro",Z). ----> X = "Bombones de jamón", Z = "Dulce de batata" ; X = "Bombones de jamón", Z = "Alfajor norteño"
menu(X,"Pato a la naranja",Z). ----> false.
menu("Locro", Y, Z). ---> false.
 */

                                            /* Ejercicio 4 */
 /* Comienza ejecuntando la consulta [menu(X,"Locro",Z).], comienza a evaluar todas los posibles menúes con las condiciones
  dadas, encuentra la primera respuesta correcta y la devuelve, luego si decidimos seguir buscando (next) seguira evaluando y encontrará
  la segunda respuesta correcta y la devuelve. Si decidimos seguir buscando llegará al final de la lista sin ningún 
  éxito por lo que devuelve false*/
                                           /* Ejercicio 5 */
ruta(santafe, parana).
ruta(parana, corrientes).
ruta(santafe, cordoba).
ruta(santafe, coronda).
ruta(santafe, rosario).
ruta(rosario, capital).
ruta(rosario, mardelplata).
ruta(capital, cordoba).
combinacion(X, Y):- ruta(X, Z), ruta(Z, Y).

/*consultas:
 *ruta(X, cordoba). ----> X=santafe , X=capital.
 *ruta(parana, Y). ----> Y=corrientes.
 *ruta(parana, cordoba). ----> false / ruta(cordoba, parana). ----> false.
 *combinacion(santafe, corrientes). ---> true.
 */
                                          /* Ejercicio 6 */
estrella(sol).
orbita(sol,mercurio).
orbita(sol,venus).
orbita(sol,tierra).
orbita(sol,jupiter).
orbita(sol,saturno).
orbita(sol,marte).
orbita(sol,urano).
orbita(sol,neptuno).
orbita(sol,pluton).
orbita(tierra,luna).
orbita(marte,deimos).
orbita(marte,phobos).
orbita(jupiter,adrastea).
orbita(jupiter,aitne).
orbita(jupiter,amalthea).
orbita(jupiter,ananke).
orbita(jupiter,aoede).
orbita(saturno,aegir).
orbita(saturno,albiorix).
orbita(saturno,atlas).
orbita(saturno,bebhionn).
orbita(saturno,bergelmir).
orbita(saturno,bestla).
orbita(urano,ariel).
orbita(urano,belinda).
orbita(urano,bianca).
orbita(urano,trinculo).
orbita(urano,caliban).
orbita(neptuno,despina).
orbita(neptuno,galatea).
orbita(neptuno,triton).
orbita(pluton,hydra).
planeta(P):- orbita(sol,P).
luna(L):- orbita(P,L), planeta(P).
lunaDe(P,L):- orbita(P,L), planeta(P).

%cantLunas(P,Cant):- ->aca deberia contar la cantidad de respuestas que encuentra orbita(planeta,X). Se haria con recursion.

                                                 /* Ejercicio 7 */
 % Entradas
entrada('Empanadas de carne').
entrada('Croquetas de jamón').
entrada('Ensalada César').

% Platos principales
plato_principal('Bife de chorizo').
plato_principal('Lomo a la pimienta').
plato_principal('Milanesa de pollo').

% Postres
postre('Flan con dulce de leche').
postre('Tiramisú').
postre('Brownie con helado').

carta(Entrada,Principal,Postre):- entrada(Entrada), plato_principal(Principal), postre(Postre).
%esto debería retornar 27 respuestas posibles.
												/* Ejercicio 8 */
hombre(pedro).
hombre(juan).
hombre(alberto).
hombre(luis).
hombre(carlos).
hombre(jorge).
mujer(maria).
mujer(susana).
mujer(lucia).
mujer(laura).
mujer(julia).
mujer(claudia).
mujer(ana).
mujer(diana).
mujer(patricia).

progenitor(claudia,laura).
progenitor(claudia,susana).
progenitor(jorge,patricia).
progenitor(jorge,laura).
progenitor(jorge,susana).
progenitor(jorge,patricia).
progenitor(jorge,pedro).
progenitor(jorge,juan).
progenitor(jorge,alberto).
progenitor(jorge,lucia).
progenitor(carlos,pedro).
progenitor(carlos,juan).
progenitor(carlos,alberto).
progenitor(carlos,lucia).
progenitor(laura,maria).
progenitor(laura,luis).
progenitor(alberto,maria).
progenitor(alberto,luis).
progenitor(luis,diana).
progenitor(luis,patricia).
progenitor(mariana, diego).
progenitor(diego, pilar).
progenitor(pilar, agustin).
progenitor(agustin, valentin).

padre(X, Y):- progenitor(X,Y), hombre(X).
madre(X, Y):- progenitor(X,Y), mujer(X).
abuelo(X, Y):- padre(X,Z), progenitor(Z,Y).
abuela(X, Y):- madre(X,Z), progenitor(Z,Y).
hermanos(X, Y):-
padre(Z,X),
padre(Z,Y),
madre(Q,X),
madre(Q,Y), X = Y.
hermano(X,Y):- hermanos(X,Y), hombre(X).
hermana(X,Y):- hermanos(X,Y), mujer(X).

%sucesor(X,Y):- progenitor(Y,X). ->aca deberia ser recursivo y buscar si encuentra un camino yendo por los progenitores.

es_madre(X):- madre(X,_). 
es_padre(X):- padre(X,_). 
tia(X,Y):- hermana(X,Z), progenitor(Z,Y).
yerno(X,Y):- hombre(X), progenitor(X,Z),
    progenitor(C,Z), X \= C, progenitor(Y,C).
nuera(X,Y):- mujer(X), progenitor(X,Z),
    progenitor(C,Z), X \= C, progenitor(Y,C).
												/* Ejercicio 9 */

% Definición de las profesiones
abogado(haydee).
abogado(pedro).
ingeniero(haydee).
medico(tania).
contador(livio).

% Definición del género de las personas
femenino(tania).
femenino(haydee).
masculino(livio).
masculino(pedro).

% Definición de los tipos de libros
novela(rayuela).
novela(karamazov).
novela(leones).
cuentos(octaedro).
poemas(inventario).

% Definición de la longitud de los libros
largo(rayuela).
largo(karamazov).
largo(inventario).
corto(octaedro).
corto(leones).

% Definición de las preferencias de lectura
gusta(livio,rayuela).
gusta(pedro,X):- cuentos(X).
gusta(X,Y):- abogado(X), novela(Y), largo(Y).
gusta(X,Y):- ingeniero(X), novela(Y).
gusta(X,Y):- medico(X), novela(Y).
gusta(X,Y):- femenino(X), largo(Y).
gusta(X,Y):- contador(X), masculino(X), cuentos(Y).
gusta(X,Y):- contador(X), masculino(X), poemas(Y).
valioso(X):- gusta(Y,X), gusta(Z,X), Y = Z.
/* consultas 
 * gusta(livio, L).
 * gusta(X,leones).
 * corto(X).
 */



