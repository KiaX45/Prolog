% Reglas básicas que el usuario puede invocar para registrar características de un animal
:- dynamic caracteristica/1.


nombre(X) :-
    assertz(caracteristica(nombre(X))),
    write('Se ha registrado el nombre: '), write(X), nl.

decir_nombre :-
    (caracteristica(nombre(Nombre)) -> write(Nombre), write(" ")
    ; write("El animal ")).

tiene_plumas :-
    assertz(caracteristica(tiene_plumas)),
    write('Se ha registrado: tiene plumas'), nl.

pone_huevos :-
    assertz(caracteristica(pone_huevos)),
    write('Se ha registrado: pone huevos'), nl.

vuela :-
    assertz(caracteristica(vuela)),
    write('Se ha registrado: vuela'), nl.

no_vuela :-
    assertz(caracteristica(no_vuela)),
    write('Se ha registrado: no vuela'), nl.

nada :-
    assertz(caracteristica(nada)),
    write('Se ha registrado: nada'), nl.

vuela_bien :-
    assertz(caracteristica(vuela)),
    assertz(caracteristica(vuela_bien)),
    write('Se ha registrado: vuela bien'), nl.

tiene_pelo :-
    assertz(caracteristica(tiene_pelo)),
    write('Se ha registrado: tiene pelo'), nl.

da_leche :-
    assertz(caracteristica(da_leche)),
    write('Se ha registrado: da leche'), nl.

ojos_frente :-
    assertz(caracteristica(ojos_frente)),
    write('Se ha registrado: ojos orientados hacia el frente'), nl.

tiene_garras :-
    assertz(caracteristica(tiene_garras)),
    write('Se ha registrado: tiene garras'), nl.

dientes_agudos :-
    assertz(caracteristica(dientes_agudos)),
    write('Se ha registrado: tiene dientes agudos'), nl.

come_carne :-
    assertz(caracteristica(come_carne)),
    write('Se ha registrado: come carne'), nl.

tiene_pezunas :-
    assertz(caracteristica(tiene_pezunas)),
    write('Se ha registrado: tiene pezunas'), nl.

rumia :-
    assertz(caracteristica(rumia)),
    write('Se ha registrado: rumia'), nl.

tiene_cuello_largo :-
    assertz(caracteristica(tiene_cuello_largo)),
    write('Se ha registrado: tiene cuello largo'), nl.

es_negra_y_blanca :-
    assertz(caracteristica(es_negra_y_blanca)),
    write('Se ha registrado: es negra y blanca'), nl.

rayas_negras_y_blancas :-
    assertz(caracteristica(rayas_negras_y_blancas)),
    write('Se ha registrado: rayas negras y blancas'), nl.

color_leonado :-
    assertz(caracteristica(color_leonado)),
    write('Se ha registrado: color leonado'), nl.



% Sistema de inferencia paso a paso
inferir_animal :-
    write('Iniciando proceso de inferencia...'), nl,
    animal_posible,
    primera_pregunta_aves.

%Reglas de comprobación si los datos son validos o no 
animal_posible :-
    % Condiciones para animales con plumas
    (caracteristica(tiene_plumas), caracteristica(tiene_pelo) ->
        write('Error: Un animal con plumas no puede tener pelo.'), nl, fail
    ; true),
    
    (caracteristica(tiene_plumas), caracteristica(da_leche) ->
        write('Error: Un animal con plumas no puede dar leche.'), nl, fail
    ; true),
    
    (caracteristica(tiene_plumas), caracteristica(tiene_garras) ->
        write('Error: Un animal con plumas no puede tener garras.'), nl, fail
    ; true),

    % Condiciones para animales que ponen huevos
    (caracteristica(pone_huevos), caracteristica(da_leche) ->
        write('Error: Un animal que pone huevos no puede dar leche.'), nl, fail
    ; true),

    % Condiciones para animales que vuelan
    (caracteristica(vuela), caracteristica(nada) ->
        write('Error: Un animal que vuela no puede nadar.'), nl, fail
    ; true),
    
    % Condiciones para animales que no vuelan
    (caracteristica(no_vuela), caracteristica(vuela_bien) ->
        write('Error: Un animal que no vuela no puede volar bien.'), nl, fail
    ; true),

    % Condiciones para animales con pelo
    (caracteristica(tiene_pelo), caracteristica(tiene_plumas) ->
        write('Error: Un animal con pelo no puede tener plumas.'), nl, fail
    ; true),

    % Condiciones para animales que dan leche
    (caracteristica(da_leche), caracteristica(tiene_plumas) ->
        write('Error: Un animal que da leche no puede tener plumas.'), nl, fail
    ; true),

    % Si pasa todas las verificaciones, entonces es un animal posible
    write('Todas las caracteristicas son consistentes.'), nl.

primera_pregunta_aves :-
    (caracteristica(tiene_plumas) ->
        decir_nombre,
        write('tiene plumas, es un ave.'), nl,
        aves_que_pueden_volar
    ;
        segunda_pregunta_aves).

segunda_pregunta_aves :-
    (caracteristica(pone_huevos), caracteristica(vuela) ->
        decir_nombre,
        write('pone huevos y vuela, es un ave.'), nl,
        aves_que_vuelan
    ;
        primera_pregunta_mamiferos).

aves_que_pueden_volar :-
    (caracteristica(vuela) ->
        decir_nombre,
        write('es un ave que puede volar.'), nl,
        aves_que_vuelan
    ;
        decir_nombre,
        write('es un ave que no puede volar.'), nl,
        aves_que_no_pueden_volar).

aves_que_no_pueden_volar :-
    (caracteristica(nada) ->
        decir_nombre,
        write('Es un pinguino porque puede nadar.'), nl
    ;
        caracteristica(tiene_cuello_largo),
        caracteristica(es_negra_y_blanca) ->
            decir_nombre, write('Tiene cuello largo y es negra y blanca.'), nl,
            write('Entonces '), decir_nombre,         
            write('Es un avestruz.'), nl
    ;
        write('No puedo determinar qué ave no voladora es. '), decir_nombre).

aves_que_vuelan :-
    (caracteristica(vuela_bien) ->
        decir_nombre,
        write('es un ave que vuela bien.'), nl,
        write('Entonces '), decir_nombre,
        write('es un albatros.'), nl
    ;
        write('No puedo determinar qué ave voladora es.')).

primera_pregunta_mamiferos :-
    (
        caracteristica(tiene_pelo), caracteristica(da_leche) ->
        decir_nombre,
        write('tiene pelo y da leche, entonces es un mamifero.'), nl,
        es_carnivoro_ojos_frente
    ;
        
        caracteristica(tiene_pelo) ->
        decir_nombre,
        write('tiene pelo, es un mamifero.'), nl,
        es_carnivoro_ojos_frente
    ;
        segunda_pregunta_mamiferos).

segunda_pregunta_mamiferos :-
    (caracteristica(da_leche) ->
        decir_nombre,
        write(' da leche, es un mamifero.'), nl,
        es_carnivoro_ojos_frente
    ;
        decir_nombre,
        write('no es ni ave ni mamífero. No puedo determina que animal es'), nl).

es_carnivoro_ojos_frente :-
    (caracteristica(ojos_frente),
     caracteristica(tiene_garras),
     caracteristica(dientes_agudos) ->
        decir_nombre, write('tiene ojos al frente, garras y dientes agudos.'), nl,
        write('Entonces '), decir_nombre,
        write('es carnívoro'), nl,
        es_tigre
    ;
        es_carnivoro).

es_carnivoro :-
    (caracteristica(come_carne) ->
        decir_nombre,
        write('come carne, entonces es carnívoro.'), nl,
        es_tigre
    ;
        decir_nombre,
        write('no es carnivoro.'), nl, es_ungulado).


es_tigre :-
    (caracteristica(rayas_negras_y_blancas),
        caracteristica(color_leonado) ->
        decir_nombre,    
        write('tiene franjas negras y es  de color leonado.'), nl,
        write('Entonces '), decir_nombre,
        write('es un tigre.'), nl,
        write('¿Estoy en lo correcto? (s/n)'), nl,
        read(Respuesta),
        (Respuesta == 's' ->
            write('¡Genial!'), nl;
            write('Entonces el unico animal que cumple con las caracteristicas es un leopardo.'), nl)
    ;
        write('No puedo determinar qué animal es.'), nl).


es_ungulado :-
    (
        caracteristica(rumia), caracteristica(tiene_pezunas) ->
        decir_nombre, write('rumia y tiene pezuñas.'), nl,
        write('Entonces '), decir_nombre,
        write('es un ungulado rumiante.'), nl,
        es_cebra
    ;
        caracteristica(tiene_pezunas) ->
        decir_nombre,
        write('tiene pezuñas, es un ungulado.'), nl,
        es_jirafa
    ;
        es_ungulado_rumiante).

es_ungulado_rumiante :-
    (caracteristica(rumia)  ->
        decir_nombre,
        write('que es mamifero y rumiante es ungulado '), nl,
        es_cebra
    ;
        write('tu animal es mamifero pero no es ni carnivoro ni rumiante no puedo determinarlo.'), nl).

es_jirafa :-
%la jiraga tiene que tener el cuello largo pero no debe ser rumiante
    (
        caracteristica(tiene_cuello_largo), caracteristica(rumia)->
        decir_nombre, write('tiene cuello largo pero tambien rumia no lo puedo determinar')
        ;
        caracteristica(tiene_cuello_largo) ->
        decir_nombre,
        write('tiene cuello largo.'), nl,
        write('Entonces '), decir_nombre,
        write('es una jirafa.'), nl
    ;
        es_cebra).

es_cebra :-
    (caracteristica(es_negra_y_blanca), caracteristica(tiene_cuello_largo)->
        write('No puedo determinar qué animal es.'), nl 
        ;
        caracteristica(es_negra_y_blanca) ->
        decir_nombre, write('tiene rayas negras y blancas.'), nl,
        write('Entonces '), decir_nombre,
        write('es una cebra.'), nl
    ;
        write('No puedo determinar qué animal es.'), nl).
    

% Utilidades
limpiar :-
    retractall(caracteristica(_)),
    write('Se han limpiado todas las caracteristicas'), nl.

mostrar_caracteristicas :-
    (   caracteristica(_) ->
        write('Caracteristicas registradas:'), nl,
        forall(caracteristica(X),
               (write('- '), write(X), nl))
    ;   write('No hay caracteristicas registradas.'), nl
    ).
