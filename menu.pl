%Nombre: Luis Alejandro Medina Bravo
%Codigo: 221034029


menu :-
     write("1 Fibonacci"),nl,
     write("2 Tabla Multiplicar"),nl,
     write("3 Factorial"),nl,
     write("4 Salir"),nl,
     write("digite una opcion"),nl,
     read(N),
     caso(N),!.

caso(1):-
       write("Usted selecciono la opcion Fibonacci"),nl,
       write("Digite el numero de Fibonacci que desea obtener"),nl,
       leer_numero(Numero),
       (Numero >= 0 ->
           write("---------------------------------"),nl,
           write("Fibonacci: "),nl,
           depuracion(Numero),
           write("---------------------------------"),nl,
           write("Volviendo al menu"),nl,
           menu
       ;
           write("---------------------------------"),nl, 
           write("Error: Ingrese un numero positivo o igual a cero"),nl,
           write("---------------------------------"),nl,
           menu
       ).

caso(3):-
    write("Usted selecciono la opcion factorial"),nl,
    write("Ingrese el numero del que quiere conocer el factorial"),nl,
    leer_numero(Numero),
    (Numero >= 0 ->
        factorial(Numero,Resultado),
        write("El factorial de "), write(Numero), write(" es: "), write(Resultado),nl,
        write("---------------------------------"),nl,
        write("Volviendo al menu"),nl,
        menu
    ;
        write("---------------------------------"),nl, 
        write("Error: Ingrese un numero positivo o igual a cero"),nl,
        write("---------------------------------"),nl,
        menu
    ).


caso(2):-
    write("Usted selecciono la opcion Tabla de multiplicar"),nl,
    write("Ingrese el numero para conocer su tabla de multiplicar"),nl,
    leer_numero(Numero),
    multiplicar(Numero, 0),
    write("---------------------------------"),nl,
    write("Volviendo al menu"),nl,
    menu.

caso(4):-
    write("Fin del programa"), !.


caso(_):-
    write("---------------------------------"),nl, 
    write("Error: Ingrese un numero valido"),nl,
    write("---------------------------------"),nl,
    menu.


%Regla para la comprobación si el input es un número

leer_numero(Numero) :-
    read(Input),
    (   integer(Input) % Comprueba si el input es un número
    ->  Numero = Input
    ;   fail).



%Reglas para el fibonacci    

depuracion(0):-
        write(0),nl,!.

depuracion(1):-
        write(0),nl,    
        write(1),nl,!.

depuracion(Numero):-
        write(0),nl,    
        write(1),nl,
        NuevoNumero is Numero - 1,
        fibonacci(NuevoNumero,0,1).


fibonacci(0,_,_):-!.

fibonacci(Contador, PrimerNumero, SegundoNumero):-
            NuevoContador is Contador - 1,
            Resultado is PrimerNumero + SegundoNumero,
            write(Resultado), nl,
            fibonacci(NuevoContador, SegundoNumero, Resultado).


%Reglas para el factorial

factorial(0, 1):-!.

factorial(Numero,Resultado):-
         NuevoNumero is Numero - 1,
         factorial(NuevoNumero, ResultadoParcial),
         Resultado is Numero * ResultadoParcial. 


%Reglas para la tabla de multiplicar

multiplicar(_,11):-!.

multiplicar(Numero, Multiplicado):-
            Resultado is Numero * Multiplicado,
            write(Numero), write(" x "), write(Multiplicado), write(" = "), write(Resultado),nl,
            NuevoMultiplicado is Multiplicado + 1,
            multiplicar(Numero, NuevoMultiplicado).



