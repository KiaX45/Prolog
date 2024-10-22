
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




