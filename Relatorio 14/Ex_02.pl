% Exercício 2 - Ninja Versátil
% 1. Crie a regra ninja_versatil(Ninja), verdadeira SE o Ninja tiver pelo menos duas
%    naturezas de chakra associadas no banco de dados E for da vila konoha.
% 2. Query: quem é (são) o(s) ninja(s) versátil(eis)?
% Dica: teste natureza(Ninja, X) e natureza(Ninja, Y) com X \= Y.

:- [banco_rl14].

% Regra 2:
ninja_versatil(Ninja) :-
    natureza(Ninja, X),
    natureza(Ninja, Y),
    X \= Y,
    vila(Ninja, konoha).

% Query 2:
% ?- ninja_versatil(X).   -> X = sasuke ; X = kakashi ; X = jiraiya ; X = hiruzen ; X = hashirama (com repetições)
