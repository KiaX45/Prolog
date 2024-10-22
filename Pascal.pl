pascal:-
    write("digite el tamaño de la piramide"),nl,
    read(Tamano),
    Lista = [1], Lista2 = [1,1],
    write(Lista), nl,
    write(Lista2), nl,
    NuevoTamano is Tamano -2,
    recorrerPiramide(Lista2,NuevoTamano,1).

recorrerPiramide(_, 0, _):- !.

recorrerPiramide(Lista, Tamano, Times) :-
    NuevoTimes is Times + 1,
    obtenerLista(Lista, [1], ListaTemporal, Times),
    append(ListaTemporal, [1], ListaFinal),
    write(ListaFinal), nl,
    NuevoTamano is Tamano - 1,
    recorrerPiramide(ListaFinal, NuevoTamano, NuevoTimes).

obtenerLista(Lista, ListaTemporal, ListaFinal, Times) :-
    sumar(Lista, Resultado, NuevaLista),
    append(ListaTemporal, [Resultado], NuevaListaTemporal),
    NuevoTimes is Times - 1,
    obtenerLista(NuevaLista, NuevaListaTemporal, ListaFinal, NuevoTimes).

obtenerLista(_,ListaTemporal,ListaTemporal,0):- !.


sumar([PrimerNumero|NuevaLista], Resultado, NuevaLista) :-
    getSegundoNumero(NuevaLista, SegundoNumero),
    Resultado is PrimerNumero + SegundoNumero.

getSegundoNumero([SegundoNumero|_], SegundoNumero).