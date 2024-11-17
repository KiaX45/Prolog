% Definición dinámica de características
:- dynamic caracteristica/1.

% Regla para limpiar todas las características anteriores
limpiar :-
    retractall(caracteristica(_)),
    write('Se han limpiado todas las características'), nl.

% Reglas para establecer características por tipo de animal
establecer_tigre(_) :-
    limpiar,
    assertz(caracteristica(tiene_pelo)),
    assertz(caracteristica(da_leche)),
    assertz(caracteristica(come_carne)),
    assertz(caracteristica(tiene_garras)),
    assertz(caracteristica(dientes_agudos)),
    assertz(caracteristica(ojos_frente)),
    assertz(caracteristica(color_leonado)),
    assertz(caracteristica(rayas_negras_y_blancas)).

establecer_leopardo(_) :-
    limpiar,
    assertz(caracteristica(tiene_pelo)),
    assertz(caracteristica(da_leche)),
    assertz(caracteristica(come_carne)),
    assertz(caracteristica(tiene_garras)),
    assertz(caracteristica(dientes_agudos)),
    assertz(caracteristica(ojos_frente)),
    assertz(caracteristica(color_leonado)).

establecer_jirafa(_) :-
    limpiar,
    assertz(caracteristica(tiene_pelo)),
    assertz(caracteristica(da_leche)),
    assertz(caracteristica(tiene_pezunas)),
    assertz(caracteristica(tiene_cuello_largo)).

establecer_cebra(_) :-
    limpiar,
    assertz(caracteristica(tiene_pelo)),
    assertz(caracteristica(da_leche)),
    assertz(caracteristica(tiene_pezunas)),
    assertz(caracteristica(rumia)),
    assertz(caracteristica(rayas_negras_y_blancas)).

establecer_pinguino(_) :-
    limpiar,
    assertz(caracteristica(tiene_plumas)),
    assertz(caracteristica(no_vuela)),
    assertz(caracteristica(nada)),
    assertz(caracteristica(pone_huevos)).

establecer_avestruz(_) :-
    limpiar,
    assertz(caracteristica(tiene_plumas)),
    assertz(caracteristica(no_vuela)),
    assertz(caracteristica(tiene_cuello_largo)),
    assertz(caracteristica(pone_huevos)),
    assertz(caracteristica(es_negra_y_blanca)).

establecer_albatros(_) :-
    limpiar,
    assertz(caracteristica(tiene_plumas)),
    assertz(caracteristica(vuela)),
    assertz(caracteristica(vuela_bien)),
    assertz(caracteristica(pone_huevos)).

% Reglas de inferencia modificadas para usar solo características
es_mamifero(X) :- 
    (   
        (caracteristica(tiene_pelo), caracteristica(da_leche)) -> 
        (write(X), write(' es mamífero porque tiene pelo y da leche'), nl)
        ;
        (caracteristica(tiene_pelo)) -> 
        (write(X), write(' es mamífero porque tiene pelo'), nl)
        ;
        (caracteristica(da_leche)) ->
        (write(X), write(' es mamífero porque da leche'), nl)
    ).


es_ave(X) :-
    (   
        (caracteristica(tiene_plumas), caracteristica(no_vuela), caracteristica(pone_huevos)) ->
        (write(X), write(' es ave porque tiene plumas, no vuela y pone huevos'), nl)
        ;
        (caracteristica(pone_huevos), caracteristica(vuela)) -> 
        (write(X), write(' es ave porque pone huevos y vuela'), nl)
        ;
        (caracteristica(tiene_plumas), caracteristica(pone_huevos)) -> 
        (write(X), write(' es ave porque tiene plumas y pone huevos'), nl)
        ;
        (caracteristica(tiene_plumas)) -> 
        (write(X), write(' es ave porque tiene plumas'), nl)
    ).


es_carnivoro(X) :- 
    es_mamifero(X),
    (
        (caracteristica(ojos_frente), caracteristica(tiene_garras), caracteristica(dientes_agudos), caracteristica(come_carne)) ->
        (write(X), write(' es carnívoro porque tiene ojos orientados hacia el frente, tiene garras y tiene dientes agudos'), nl)
        ;
        (caracteristica(ojos_frente), caracteristica(tiene_garras), caracteristica(dientes_agudos)) ->
        (write(X), write(' es carnívoro porque tiene ojos orientados hacia el frente, tiene garras y tiene dientes agudos'), nl)
        ;
        (caracteristica(come_carne) ->
        write(X), write(' es carnívoro porque come carne'), nl)
    ).

es_ungulado(X) :- 
    es_mamifero(X),
    (caracteristica(tiene_pezunas), caracteristica(rumia)) ->
    (write(X), write(' es ungulado porque tiene pezuñas y rumia'), nl)
    ;
    (caracteristica(tiene_pezunas)) ->
    (write(X), write(' es ungulado porque tiene pezuñas'), nl)
    ;
    (caracteristica(rumia)) ->
    (write(X), write(' es ungulado porque rumia'), nl).

es_jirafa(X) :-
    es_ungulado(X),
    write(X), write(' es jirafa porque es ungulado y tiene cuello largo'), nl,
    !.

es_cebra(X) :-
    es_ungulado(X),
    write(X), write(' es cebra porque es ungulado y tiene rayas negras y blancas'), nl,
    !.

es_tigre(X) :-
    es_carnivoro(X),
    write(X), write(' es tigre porque es carnívoro, tiene rayas negras y color leonado'), nl,
    !.

es_leopardo(X) :-
    es_carnivoro(X),
    write(X), write(' es leopardo porque es carnívoro, tiene rayas negras y color leonado'), nl,
    !.


es_pinguino(X) :-
    es_ave(X),
    write(X), write(' es pinguino porque es ave, nada y no vuela'), nl,
    !.

es_avestruz(X) :-
    es_ave(X),
    write(X), write(' es avestruz porque es ave, tiene cuello largo y es negra y blanca'), nl,
    !.

es_albatros(X) :-
    es_ave(X),
    write(X), write(' es albatros porque es ave, vuela y vuela bien'), nl,
    !.



% Predicados principales para procesar animales

tigre(X) :- 
    establecer_tigre(X),
    es_tigre(X).

leopardo(X) :-
    establecer_tigre(X),
    es_leopardo(X).

pinguino(X) :- 
    establecer_pinguino(X),
    es_pinguino(X).

cebra(X) :- 
    establecer_cebra(X),
    es_cebra(X).    

jirafa(X) :-
    establecer_jirafa(X),
    es_jirafa(X).

avestruz(X) :-
    establecer_avestruz(X),
    es_avestruz(X).

albatros(X) :-
    establecer_albatros(X),
    es_albatros(X).



% Predicado para mostrar características actuales
mostrar_caracteristicas :-
    write('Características registradas:'), nl,
    forall(caracteristica(X),
           (write('- '), write(X), nl)).