sumar_lista([], 0).



sumar_lista([Primero|NuevaLista], Resultado):-
           % write(Primero),
            NuevoResultado is Primero + Resultado,
            write(NuevoResultado),
            sumar_lista(NuevaLista, NuevoResultado).    