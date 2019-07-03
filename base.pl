/* parametros Numero elevador, Andar Para Parar*/
:- dynamic paradas/2.
/* parametros Numero elevador, Andar Atual, Status*/
:- dynamic estado_atual/3.

elevador(1,0).
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
elevador(1,12).
elevador(1,13).
elevador(1,14).
elevador(1,15).
elevador(1,16).
elevador(1,17).
elevador(1,18).
elevador(1,19).
elevador(1,20).

elevador(2,0).
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
elevador(2,15).
elevador(2,16).
elevador(2,17).
elevador(2,18).
elevador(2,19).
elevador(2,20).

elevador(3,0).
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

estado_atual(1,0,s).
estado_atual(2,0,s).
estado_atual(3,0,s).

add_parada(Elevador,Andar) :- 
    assert((paradas(Elevador,Andar))).

get_andares(Elevador,Andares) :- 
    paradas(Elevador,Andares).

atualiza_andar_atual(Elevador,Andar,Status) :- 
    retract(estado_atual(Elevador,_,_)) , 
    assert(estado_atual(Elevador,Andar,Status)).

qual_elevador(Andar_origem, Andar_destino) :- 
    (
        estado_atual(1,0,_) , estado_atual(2,0,_), estado_atual(3,0,_)->
            add_parada(1,Andar_destino),
            
            write('Elevador 1')
        ;
            write('FALTA IMPLEMENTAR')
    ).







