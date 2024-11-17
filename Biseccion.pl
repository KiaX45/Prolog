calcularPM(A,B,N):-
    Numerador is A + B,
    C is Numerador / 2,
    Resultado is (C * C) - N,
    (abs(Resultado) < 0.0001 -> 
        write('La raiz cuadrada es: '),write(C),nl;
        actualizar(A,B,C,Resultado,N)).

actualizar(A,_,C,R,N):-
    ResultadoA is (A*A) - N,
    Comparador is ResultadoA * R,
    (Comparador < 0 -> 
        Nb is C, Na is a;
        Nb is b, Na is C),
    calcularPM(Na,Nb,N).