calcularN(N,Actual,Anterior):-
        Resultado is abs(Actual - Anterior),
        (Resultado < 0.0001 -> 
                write('La raiz cuadrada es: '),write(Actual),nl;
                NAnterior = Actual,
                calcularNumero(N,Actual,NAnterior)).

calcularNumero(Numero,_,Anterior):-
        NNumero is Numero / Anterior,
        Numerador is NNumero + Anterior,
        NActual is Numerador / 2,
        write(Anterior),nl,
        calcularN(Numero,NActual,Anterior).


raiz(N):-
   Anterior is N / 2,
    calcularN(N,N,Anterior).