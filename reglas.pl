%Operadores logicos

/*
, (AND): todas las condiciones deben ser verdaderas
; (OR): al menos una condición debe ser verdadera
\+ (NOT): la condición no debe ser verdadera
*/

%Estructura

%cabeza :- cuerpo 


% Hechos sobre películas
pelicula(titulo('El Laberinto del Fauno'), director('Guillermo del Toro'), ano(2006), genero(fantasia)).
pelicula(titulo('Amores Perros'), director('Alejandro González Iñárritu'), ano(2000), genero(drama)).
pelicula(titulo('Y Tu Mamá También'), director('Alfonso Cuarón'), ano(2001), genero(drama)).
pelicula(titulo('El Espinazo del Diablo'), director('Guillermo del Toro'), ano(2001), genero(terror)).
pelicula(titulo('Roma'), director('Alfonso Cuarón'), ano(2018), genero(drama)).

% Ejemplo 1: Director con múltiples películas

buenDirector :-
    pelicula(titulo(T1), director(X), _, _),
    pelicula(titulo(T2), director(X), _, _),
    T1 \= T2, write(X).

