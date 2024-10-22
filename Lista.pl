
get(0, [Numero|_], Numero).

get(Indice, [_|NuevaLista], Numero ) :-
    NuevoIndice is Indice - 1,
    get(NuevoIndice, NuevaLista, Numero).

test(Indice) :-
Lista = [1,2,3,4],
get(Indice, Lista, Numero),
write(Numero),!.

recorrerLista(Indice, Lista):-
    length(Lista, Longitud),
    Indice == Longitud, !,
    write("Fin de la secuencia").

recorrerLista(Indice, Lista) :-
    get(Indice, Lista, Numero),
    write("["), write(Indice), write("] = "), write(Numero), nl,
    NuevoIndice is Indice + 1,
    recorrerLista(NuevoIndice, Lista).    


eliminar(0, [_|NuevaLista], ListaAntes, ListaFinal) :-
    append(ListaAntes, NuevaLista, ListaFinal).

eliminar(Indice, [Numero|NuevaLista], ListaAntes, ListaFinal) :-
        Indice > 0,
        NuevoIndice is Indice -1,
        append(ListaAntes, [Numero], NuevaListaAntes),
        eliminar(NuevoIndice, NuevaLista, NuevaListaAntes, ListaFinal).

eliminar(_, [], ListaAntes, ListaAntes).


testEliminar :-
    Lista = [0,1,2],
    Indice = 3,
    ListaAntes = [],
    eliminar(Indice, Lista, ListaAntes, ListaFinal),
    recorrerLista(0,ListaFinal).

%Caso cuando finaliza totalmente
eliminarRepetidos(_,SecondIndex,Lista):-
        length(Lista, Longitud),
        NuevoSecondIndex is SecondIndex + 1,
        NuevoSecondIndex == Longitud,!,
        write(Lista), nl,
        write("Programa Finalizado").


%Caso cuando termina una iteración
eliminarRepetidos(Indice,SecondIndex,Lista):-
        length(Lista, Longitud),
        Indice == Longitud,
        NuevoIndice is SecondIndex + 2,
        NuevoSecondIndex is SecondIndex + 1,
        eliminarRepetidos(NuevoIndice, NuevoSecondIndex, Lista).


%Caso cuando encuentra repetido
eliminarRepetidos(Indice,SecondIndex,Lista):-
        get(SecondIndex, Lista, Comparador),
        get(Indice, Lista, Comparando),
        Comparador == Comparando,
        eliminar(Indice, Lista, [], ListaFinal),
        NuevoIndice is Indice + 0,
        eliminarRepetidos(NuevoIndice, SecondIndex, ListaFinal).


%Caso cuando no encuentra repetido
eliminarRepetidos(Indice,SecondIndex,Lista):-
        get(SecondIndex, Lista, Comparador),
        get(Indice, Lista, Comparando),
        Comparador \= Comparando,
        NuevoIndice is Indice + 1,
        eliminarRepetidos(NuevoIndice, SecondIndex, Lista).

testEliminarRepetidos :-
    Lista = [1,2,1,1,2,2],
    eliminarRepetidos(1,0,Lista).



