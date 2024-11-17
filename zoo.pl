% Hechos iniciales que podemos conocer directamente
tiene_plumas(paloma).
tiene_plumas(pinguino).
tiene_plumas(avestruz).
tiene_plumas(albatros).

pone_huevos(paloma).
pone_huevos(pinguino).
pone_huevos(avestruz).
pone_huevos(albatros).

vuela(paloma).
vuela(albatros).
no_vuela(pinguino).
no_vuela(avestruz).

tiene_pelo(tigre).
tiene_pelo(leopardo).
tiene_pelo(jirafa).
tiene_pelo(cebra).

da_leche(tigre).
da_leche(leopardo).
da_leche(jirafa).
da_leche(cebra).

tiene_cuello_largo(avestruz).
tiene_cuello_largo(jirafa).

es_negra_y_blanca(avestruz).
franjas_negras_y_blancas(cebra).

vuela_bien(albatros).

come_carne(tigre).
come_carne(leopardo).

tiene_ojos_frente(tigre).
tiene_ojos_frente(leopardo).

tiene_garras(tigre).
tiene_garras(leopardo).

tiene_dientes_agudos(tigre).
tiene_dientes_agudos(leopardo).

franjas_negras_leonado(tigre).
pintas_negras_leonado(leopardo).

rumia(jirafa).
rumia(cebra).

tiene_pezuna(jirafa).
tiene_pezuna(cebra).

% Reglas de inferencia
% R1
es_ave(X) :- 
    tiene_plumas(X).

% R2
es_ave(X) :- 
    pone_huevos(X),
    vuela(X).

% R3
es_mamifero(X) :- 
    tiene_pelo(X).

% R4
es_mamifero(X) :- 
    da_leche(X).

% R5
es_pinguino(X) :- 
    es_ave(X),
    no_vuela(X),
    nada(X).

% R6
es_avestruz(X) :- 
    es_ave(X),
    tiene_cuello_largo(X),
    es_negra_y_blanca(X).

% R7
es_albatros(X) :- 
    es_ave(X),
    vuela_bien(X).

% R8
es_carnivoro(X) :- 
    es_mamifero(X),
    come_carne(X).

% R9
es_carnivoro(X) :- 
    es_mamifero(X),
    tiene_ojos_frente(X),
    tiene_garras(X),
    tiene_dientes_agudos(X).

% R10
es_tigre(X) :- 
    es_carnivoro(X),
    franjas_negras_leonado(X).

% R11
es_leopardo(X) :- 
    es_carnivoro(X),
    pintas_negras_leonado(X).

% R12
es_ungulado(X) :- 
    es_mamifero(X),
    rumia(X).

% R13
es_ungulado(X) :- 
    es_mamifero(X),
    tiene_pezuna(X).

% R14
es_jirafa(X) :- 
    es_ungulado(X),
    tiene_cuello_largo(X).

% R15
es_cebra(X) :- 
    es_ungulado(X),
    franjas_negras_y_blancas(X).

inferir()
