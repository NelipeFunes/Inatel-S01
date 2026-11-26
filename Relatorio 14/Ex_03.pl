% Exercício 3 - Rivais de Treino
% 1. Crie a regra rivais(A, B), verdadeira SE A e B tiverem o mesmo mestre, NÃO forem
%    o mesmo ninja E pertencerem a clãs diferentes.
% 2. Query: quem é (são) o(s) rival(is) de Naruto?

:- [banco_rl14].

% Regra 3:
rivais(A, B) :-
    mestre(M, A),
    mestre(M, B),
    A \= B,
    cla(A, C1),
    cla(B, C2),
    C1 \= C2.

% Query 3:
% ?- rivais(naruto, X).   -> X = minato ; X = sasuke
