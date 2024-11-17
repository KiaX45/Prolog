%creación de los productos basicos 
%producto(nombre, [tamaño, envase, congelado])
producto(papasFritas, [grande, plastico, no]).
producto(gaseosa, [grande, vidrio, no]).
producto(yogurt, [pequeno, plastico, si]).
producto(cereal, [mediano, carton, no]).
producto(helado, [pequeno, carton, si]).

:- dynamic pedido/2.


%reglas para añadir los productos que se desean comprar

mostrar_productos :-
    findall(Producto, producto(Producto, _), ListaProductos),
    write('Productos disponibles: '), nl,!,
    recorrer_productos(ListaProductos, 0),
    anadir_Prodcutos(ListaProductos).

recorrer_productos([Producto|NuevaLista], Index):-
    write(Index), write(': '), write(Producto),nl,
    NuevoIdex is Index + 1,
    recorrer_productos(NuevaLista, NuevoIdex).

recorrer_productos(_,_).

anadir_Prodcutos(Productos) :-
  write('seleccione en producto que quiera ingresar en base al index por favor'),nl,
  read(Index),nl,
  getProduct(Productos, Index, Producto),
  write('Usted selecciono el elemento: '), write(Producto),nl,
  write('Cuantas unidades desea comprar de este producto'), nl,
  read(Cantidad),nl,
  assertz(pedido(Producto, Cantidad)),
  write('Producto agregado al carrito'),nl,
  write('Desea agregar otro producto? (si/no)'),nl,
  read(Respuesta),nl,
  (Respuesta == 'si' -> anadir_Prodcutos(Productos)
  ; write('Gracias por su compra')).


getProduct([ProductoActual|_], 0, ProductoActual).

getProduct([_|ListaProductos], Index, Producto):- 
    NuevoIdex is Index - 1,
    getProduct(ListaProductos, NuevoIdex, Producto).


%reglas para el empaquetamiento de productos

empaquetar_grande(EspaciosDisponibles, NumeroDeBolsas) :-
    (encontrar_grande(ProductoFinal, CantidadFinal) ->  % Si encuentra un producto grande
        EspaciosRequeridos is CantidadFinal * 6,
        (EspaciosDisponibles >= EspaciosRequeridos ->
            % Caso: Todo el producto cabe en los espacios disponibles
            retract(pedido(ProductoFinal, CantidadFinal)),
            NuevosEspacios is EspaciosDisponibles - EspaciosRequeridos,
            empaquetar_grande(NuevosEspacios, NumeroDeBolsas)
        ;
            % Caso: No cabe todo, actualizar pedidos y usar una nueva bolsa
            NuevoNumeroDeBolsas is NumeroDeBolsas + 1,
            CantidadRestante is ceiling((EspaciosRequeridos - EspaciosDisponibles) / 6),
            retract(pedido(ProductoFinal, CantidadFinal)),
            assertz(pedido(ProductoFinal, CantidadRestante)),
            empaquetar_grande(36, NuevoNumeroDeBolsas)
        )
    ;   
        % Caso base: no hay más productos grandes
        empaquetar_mediano(EspaciosDisponibles, NumeroDeBolsas).
    ).

% Predicado para encontrar productos grandes
encontrar_grande(Producto, Cantidad) :-
    producto(Producto, Propiedades),
    member(grande, Propiedades),
    pedido(Producto, Cantidad),
    Cantidad > 0.  % Aseguramos que solo consideramos pedidos con cantidad positiva


empaquetar_mediano(EspaciosDisponibles, NumeroDeBolsas) :-
    (encontrar_mediano(ProductoFinal, CantidadFinal) ->  % Si encuentra un producto mediano
        EspaciosRequeridos is CantidadFinal * 4,
        (EspaciosDisponibles >= EspaciosRequeridos ->
            % Caso: Todo el producto cabe en los espacios disponibles
            retract(pedido(ProductoFinal, CantidadFinal)),
            NuevosEspacios is EspaciosDisponibles - EspaciosRequeridos,
            empaquetar_mediano(NuevosEspacios, NumeroDeBolsas)
        ;
            % Caso: No cabe todo, actualizar pedidos y usar una nueva bolsa
            NuevoNumeroDeBolsas is NumeroDeBolsas + 1,
            CantidadRestante is ceiling((EspaciosRequeridos - EspaciosDisponibles) / 4),
            retract(pedido(ProductoFinal, CantidadFinal)),
            assertz(pedido(ProductoFinal, CantidadRestante)),
            empaquetar_mediano(16, NuevoNumeroDeBolsas)
        )
    ;   
        % Caso base: no hay más productos medianos
        empaquetar_pequeno(EspaciosDisponibles, NumeroDeBolsas).
    ).


    encontrar_mediano(Producto, Cantidad) :-
    producto(Producto, Propiedades),
    member(mediano, Propiedades),
    pedido(Producto, Cantidad),
    Cantidad > 0.  % Aseguramos que solo consideramos pedidos con cantidad positiva

empaquetar_pequeno(EspaciosDisponibles, NumeroDeBolsas) :-
    (encontrar_pequeno(ProductoFinal, CantidadFinal) ->  % Si encuentra un producto pequeño
        EspaciosRequeridos is CantidadFinal * 2,
        (EspaciosDisponibles >= EspaciosRequeridos ->
            % Caso: Todo el producto cabe en los espacios disponibles
            retract(pedido(ProductoFinal, CantidadFinal)),
            NuevosEspacios is EspaciosDisponibles - EspaciosRequeridos,
            empaquetar_pequeno(NuevosEspacios, NumeroDeBolsas)
        ;
            % Caso: No cabe todo, actualizar pedidos y usar una nueva bolsa
            NuevoNumeroDeBolsas is NumeroDeBolsas + 1,
            CantidadRestante is ceiling((EspaciosRequeridos - EspaciosDisponibles) / 2),
            retract(pedido(ProductoFinal, CantidadFinal)),
            assertz(pedido(ProductoFinal, CantidadRestante)),
            empaquetar_pequeno(8, NuevoNumeroDeBolsas)
        )
    ;   
        % Caso base: no hay más productos pequeños
        write('Empaquetamiento finalizado'), nl,
        write('Numero de bolsas utilizadas: '), write(NumeroDeBolsas), nl,
        mostrar_carrito
    ).

encontrar_pequeno(Producto, Cantidad) :-
    producto(Producto, Propiedades),
    member(pequeno, Propiedades),
    pedido(Producto, Cantidad),
    Cantidad > 0.  % Aseguramos que solo consideramos pedidos con cantidad positiva



%utilidades 
limpiar :-
    retractall(pedido(_,_)),
    write('Carrito limpiado'),nl.


mostrar_carrito :-
    findall(pedido(Producto, Cantidad), pedido(Producto, Cantidad), ListaPedidos),
    write('Productos en el carrito: '), nl,!,
    recorrer_carrito(ListaPedidos).

recorrer_carrito([pedido(Producto, Cantidad)|NuevaLista]):-
    write('Producto: '), write(Producto), write(' | Cantidad: '), write(Cantidad), nl,
    recorrer_carrito(NuevaLista).

recorrer_carrito([]).   
