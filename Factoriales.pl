
calcular(Factorial):-
        Factorial == 0, !,
        write('Resultado Final: '),  write(1).

calcular(Factorial) :-
        calcularFactorial(Factorial, 1).


calcularFactorial(Factorial, Resultado):-
                Factorial == 1, !,
                write('Resultado Final: '),  write(Resultado).



calcularFactorial(Factorial, Resultado):-
                 NuevoResultado is Factorial * Resultado,
                 NuevoFactorial is Factorial - 1,
                 write(NuevoResultado), nl,
                 calcularFactorial(NuevoFactorial, NuevoResultado).   


factorialR(Numero, Resultado):-
        (Numero > 1 -> 
                NuevoNumero is Numero - 1,
                factorialR(NuevoNumero, NuevoResultado),
                Resultado is Numero * NuevoResultado
        ; Resultado is 1).


fibo(Numero):-
        write(0), nl,
        write(1), nl,
        NNumero is Numero - 2,
        fiboR(NNumero,0,1).

fiboR(Numero, Anterior, Actual):-
    Numero == 0,
    write('Fin de la secuencia').


fiboR(Numero, Anterior, Actual):-
        NuevoActual is Anterior + Actual,
        write(NuevoActual), nl,
        NNumero is Numero - 1,
        fiboR(NNumero, Actual, NuevoActual).





