
%con recursividad 

calcularFibo(_, _, Contador) :- 
    Contador >= 10, !,  % Condición de parada: detener después de 10 iteraciones
    write('Fin de la secuencia'), nl.


calcularFibo(PrimerNumero, SegundoNumero, Contador) :-
            Resultado is PrimerNumero + SegundoNumero,
            NuevoContador is Contador + 1,
            write(Resultado), nl, calcularFibo(Resultado, PrimerNumero, NuevoContador).





ultimo([X], X).
ultimo([_|T], X) :- ultimo(T, X).

penultimo([X,_], X).
penultimo([_|T], X) :- penultimo(T, X).

calcular_n_Fibo(Numero):-
                write(1), nl,    
                write(1), nl,
                Lista = [1,1],
                calcular_Fibo(Numero, Lista).


calcular_Fibo(Numero, Lista):-
                length(Lista, Longitud),
                Longitud_Final is Longitud - 2,
                Longitud_Final >= Numero, !,
                write(Lista), nl,
                write('Fin de la seccuencia').
                

calcular_Fibo( Numero, Lista):-
           ultimo(Lista, SegundoNumero),
           penultimo(Lista, PrimerNumero), 
           Resultado is PrimerNumero + SegundoNumero,
           append(Lista, [Resultado], NuevaLista),
           write(Resultado), nl,
           calcular_Fibo(Numero, NuevaLista).
                  
