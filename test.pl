membro(X,[X|R]).
membro(X,[Y|R]) :- membro(X,R).

% Resposta true - membro(c,[a,b,c,d,e])