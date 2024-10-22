es_gato(tom).
es_amigo(pedro, juan). %decimos que pedro es amigo de Juan
es_padre(juan, maria). % decimos que juan es padre de maria 

%Relaciones con multiples niveles de hechos 
es_perro(fido).
es_perro(sam).
es_perro(salomon).


es_owner(maria, fido).
es_owner(juan, fido).
es_owner(juan, sam).
es_owner(tom, sam).

%consultas interesantes 
/*
findall(Y, ( es_owner(Y, sam), es_perro(X)), DueñoSam). 
DueñoSam = [juan, juan, juan, tom, tom, tom].

*/

%Relaciones anidadas (estructuras compuestas)

libro(titulo('El Quijote'), autor('Miguel de Cervantes'), ano(1605)).
libro(titulo('El SanchoPanza'), autor('Miguel de Cervantes'), ano(1700)).

%consultas interesantes: 
/*
libro(titulo(X), autor('Miguel de Cervantes'), ano(Año)), Año >= 1700.  
X = 'El SanchoPanza',
Año = 1700.

findall(X, (libro(titulo(X), autor('Miguel de Cervantes'), ano(Año)), Año >= 1700), Libros).  
Libros = ['El SanchoPanza'].

*/