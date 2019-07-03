elevador( [ 
	[ 1 ,[1,2,3,4,5], 3 ],
	[ 2 ,[1,2,3,4,5], 4 ],
	[ 3 ,[1,2,3,4,5], 2 ] 
] ).


elevador(_,[],_,[]).
elevador(E[X|R], [[E,X]|W]) :- elevador(E,R,W).

