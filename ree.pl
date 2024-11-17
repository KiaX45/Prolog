
test:-
    reemplazar([], [1,2,5,4,5,6,7,5,9,5], 5, 0).   

reemplazar(LF,Lista, _, _):-
          length(Lista, L),
          L == 0,!,
          write('Resultado Final: '), write(LF).

reemplazar(LA,[Primero|Lista], Buscar, Reemplazar):-
            (Primero == Buscar ->
               NuevoPrimero = Reemplazar;
                NuevoPrimero = Primero),
            append(LA, [NuevoPrimero], LF),
            reemplazar(LF, Lista, Buscar, Reemplazar).