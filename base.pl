/* parametros Numero elevador, Andar Para Parar*/
:- dynamic paradas/2.
/* parametros Numero elevador, Andar Atual, Status*/
:- dynamic estado_atual/3.

elevador(1,1).
elevador(1,2).
elevador(1,3).
elevador(1,4).
elevador(1,5).
elevador(1,6).
elevador(1,7).
elevador(1,8).
elevador(1,9).
elevador(1,10).
elevador(1,11).
elevador(1,13).
elevador(1,14).
elevador(1,15).
elevador(1,16).
elevador(1,17).
elevador(1,18).
elevador(1,19).
elevador(1,20).

elevador(2,1).
elevador(2,2).
elevador(2,3).
elevador(2,4).
elevador(2,5).
elevador(2,6).
elevador(2,7).
elevador(2,8).
elevador(2,9).
elevador(2,10).
elevador(2,11).
elevador(2,12).
elevador(2,13).
elevador(2,14).
elevador(2,16).
elevador(2,17).
elevador(2,18).
elevador(2,19).
elevador(2,20).

elevador(3,1).
elevador(3,2).
elevador(3,3).
elevador(3,4).
elevador(3,5).
elevador(3,6).
elevador(3,7).
elevador(3,8).
elevador(3,9).
elevador(3,10).
elevador(3,11).
elevador(3,12).
elevador(3,13).
elevador(3,14).
elevador(3,15).
elevador(3,16).
elevador(3,17).
elevador(3,18).
elevador(3,19).
elevador(3,20).

estado_atual(1,1,s).
estado_atual(2,1,s).
estado_atual(3,1,s).

add_parada(Elevador,Andar) :- 
    assert((paradas(Elevador,Andar))).

get_andares(Elevador,Andares) :- 
    paradas(Elevador,Andares).

atualiza_andar_atual(Elevador,Andar,Status) :- 
    retract(estado_atual(Elevador,_,_)) , 
    assert(estado_atual(Elevador,Andar,Status)).

 compare_andar(Elevador,Andar_atual,Status,Andar_origem,Andar_destino) :-
 	(
	 	estado_atual(Elevador,Andar_atual,Status),
		 	Andar_atual =< Andar_origem ->
		 		atualiza_andar_atual(Elevador,Andar_destino,s)
		 	;
		 		atualiza_andar_atual(Elevador,Andar_destino,d)

 	).


/*1º tanto faz a pessoa pegar qualquer elevador, pois está tudo na mesma posição e direção*/

compare_mesmo(X,Y,W,A,B,C) :-
	estado_atual(1,X,A), estado_atual(2,Y,B), estado_atual(3,W,C),  
	Y =:= X,
	W =:= Y,
	A == B,
	B == C.

/*Caso: 2º - Pessoa está em uma posição, querendo ir para um Andar_destino > Andar_origem e elevadores > Andar_origem e existe pelo menos um descendo*/
/*Condição essencial: Elevador descendo*/
/*Condição disputa: Andar_origem - elevador < outro elevador descendo*/


/*Caso: 3º - Pessoa está em uma posição, querendo ir para um Andar_destino > Andar_origem e elevadores > Andar_origem e todos estão subindo*/
/*Condição essencial: Mais próximo 20º*/
/*Condição disputa: função recursiva que conta quantidade de paradas*/

/*Caso: 4º - Pessoa está em uma posição, querendo ir para um Andar_destino > Andar_origem*/
/*Condição essencial: Elevador subindo*/
/*Condição disputa: Andar_origem - elevador < outro elevador descendo*/


qual_elevador(Andar_origem, Andar_destino) :- 
    (


        compare_mesmo(X,Y,W,A,B,C)->
            add_parada(1,Andar_destino),
            compare_andar(1,Andar_atual,s,Andar_origem,Andar_destino),
            format('Elevador: ~w  Destino: ~wº andar',[1, Andar_destino])
        ;

	        estado_atual(1,Andar_atual_1,Status_1), estado_atual(2,Andar_atual_2,Status_2), estado_atual(3,Andar_atual_3,Status_3), 
			(
		        Andar_atual_1 =< Andar_origem,
		        Andar_atual_2 =< Andar_origem,
		        Andar_atual_3 =< Andar_origem,
		        Andar_origem < Andar_destino ->

		        	(
		        		Status_1 == s, 
		        		Status_2 == s,
		        		Status_3 == s ->

		        		(
		        			Andar_origem - Andar_atual_1 < Andar_origem - Andar_atual_2,
		        			Andar_origem - Andar_atual_1 < Andar_origem - Andar_atual_3->
		        				add_parada(1,Andar_destino),
            					compare_andar(1,Andar_atual,s,Andar_origem,Andar_destino),
		        				format('Elevador: ~w  Destino: ~wº andar',[1, Andar_destino])

		        			;
		        			(
		        				Andar_origem - Andar_atual_2 < Andar_origem - Andar_atual_1,
		        				Andar_origem - Andar_atual_2 < Andar_origem - Andar_atual_3->
		        					add_parada(2,Andar_destino),
            						compare_andar(2,Andar_atual,s,Andar_origem,Andar_destino),
		        					format('Elevador: ~w  Destino: ~wº andar',[2, Andar_destino])

		        				;
		        					add_parada(3,Andar_destino),
            						compare_andar(3,Andar_atual,s,Andar_origem,Andar_destino),
		        					format('Elevador: ~w  Destino: ~wº andar',[3, Andar_destino])
		        			)

		        		)
		        		/*;*/


		        	)
		        /*;*/

			)
            
    ).







