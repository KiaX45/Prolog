% Base de conocimiento (hechos sobre animales)
animal(tigre).
animal(leopardo).
animal(jirafa).
animal(cebra).
animal(pinguino).
animal(avestruz).
animal(albatros).

% Predicado principal que inicia el juego
adivinar_animal :-
    write('¡Piensa en un animal de los siguientes!'), nl,
    write('tigre, leopardo, jirafa, cebra, pinguino, avestruz, albatros'), nl,
    write('Responde las siguientes preguntas con "si." o "no."'), nl,
    primera_pregunta_aves.

%preguntas aves
primera_pregunta_aves :-
    write('¿El animal que pensaste tiene plumas?'), nl,
    read(Respuesta),
    %si la respuesta es si pasamos directamente pero si es no preguntamos la segunda de aves
    (Respuesta == 'si' -> aves_que_pueden_volar ; segunda_pregunta_aves).

segunda_pregunta_aves :-
    write('¿El animal que pensaste pone huevos y vuela ?'), nl,
    read(Respuesta),
     (Respuesta == 'si' -> aves_que_vuelan ; primera_pregunta_mamiferos).


%Rama de preguntas para aves 
%hay dos tipos de aves que vuelan y no vuelan gracias a la segunda pregunta estamos seguros
%de que si puede volar o no pero si solo respondio la primera pregunta no estamos seguros si puede volar o no

aves_que_pueden_volar :-
    write('Okey entonces es un ave ¿pero puede Volar?'),nl,
    read(Respuesta),
    (Respuesta == 'si' -> aves_que_vuelan ; aves_que_no_pueden_volar).


aves_que_no_pueden_volar :-
    write('Okey entonces tu ave no puede volar'),nl,
    %solo hay dos aves que no pueden volar pinguino y avestruz
    write('¿El animal que pensaste puede nadar?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es un pinguino'),nl, concluir ; avestruz).

avestruz :- 
    write('Okey entonces tu ave no puede volar y no puede nadar'),nl,
    write('¿El animal que pensaste tiene cuello largo y es negra y blanca?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es un avestruz'),nl, concluir ; write('MMM algo salio mal'),nl, intentarlo_de_nuevo).



aves_que_vuelan :-
    write('Okey entonces es una ave que puede volar'),nl,
    %solo hay un ave que puede volar albatros pero le debemos preguntar si vuela bien
    write('¿El animal que pensaste vuela bien?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es un albatros'),nl, concluir ; write('MMM algo salio mal'),nl, intentarlo_de_nuevo).

%Rama de preguntas para mamiferos

primera_pregunta_mamiferos :-
    write('¿El animal que pensaste tiene pelo?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> es_carnivoro_ojos_frente ; segunda_pregunta_mamiferos). 

segunda_pregunta_mamiferos :-
    write('¿El animal que pensaste da leche?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> es_carnivoro_ojos_frente ; write('Tu animal no es un mamifero pero tampoco es un ave No esta en la lista de animales disponibles'),nl, intentarlo_de_nuevo).

%preguntas mamiferos

es_carnivoro_ojos_frente :-
    write('Okey entonces tu animal es un mamifero'),nl, 
    write('¿El animal que pensaste tiene ojos orientados hacia el frente tiene garras y tiene dientes agudos?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es Carnivoro'),nl, es_tigre ; es_carnivoro).

es_carnivoro :-
    write('¿El animal que pensaste come carne?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es Carnivoro'),nl, es_tigre ; write('Tu animal no es carnivoro'),nl, es_ungulado).

es_tigre :-
    write('¿El animal que pensaste tiene franjas negras y es leonado?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es un tigre'),nl ; write('MMM algo salio mal'),nl, intentarlo_de_nuevo),
    write('¿Estoy en lo correcto?'),
    read(Respuesta2),
    (Respuesta2 == 'si' -> write('Genial Gracias por jugar'),nl, intentarlo_de_nuevo ; es_leopardo).

es_leopardo :-
    write('Rayos entonces ¿Tu animal es un leopardo?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Genial Gracias por jugar'),nl, intentarlo_de_nuevo ; write('MMM algo salio mal'),nl, intentarlo_de_nuevo).

es_ungulado :-
    write('¿El animal que pensaste tiene pezunas?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es ungulado'), nl, es_girafa; es_ungulado_rumiante).

es_ungulado_rumiante :-
    write('¿El animal que pensaste rumia?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es ungulado'), nl, es_girafa ; write('No es ungulado no es carnivoro y no es un ave ¿Que sera?'),nl, intentarlo_de_nuevo).


es_girafa :-
    write('¿El animal que pensaste tiene cuello largo?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es una jirafa'), nl, concluir ; es_cebra).

es_cebra :-
    write('¿El animal que pensaste tiene franjas negras y blancas?'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> write('Tu animal es una cebra'), nl, concluir ; write('mmm Algo salio mal'),nl, intentarlo_de_nuevo).

concluir() :-
    write('¿Estoy en lo correcto?'),
    read(Respuesta),
    (Respuesta = si ->
        write('Genial! Gane!'), nl;
        write('Oh, me equivoque. Intentemoslo de nuevo!'), nl
    ), intentarlo_de_nuevo.

intentarlo_de_nuevo :-
    write('¿Quieres jugar otra vez? (si/no)'),
    read(OtraVez),
    (OtraVez = si ->
        nl, adivinar_animal;
        write('Gracias por jugar!'), nl
    ).


% Predicado para iniciar el juego
inicio :-
    write('¡Bienvenido al Adivinador de Animales!'), nl,
    write('====================================='), nl,
    adivinar_animal.