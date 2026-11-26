% Exercício 4 - Linhagem
% 1. Crie a regra linhagem(Mestre, Discipulo), que define a cadeia de treinamento:
%    - Caso base: linhagem(M, D) é verdadeiro SE M for mestre de D.
%    - Passo recursivo: linhagem(M, D) é verdadeiro SE M for mestre de um
%      intermediário Z E Z estiver na linhagem de D.
% 2. Query: quem faz parte da linhagem de Jiraiya (discípulos diretos ou indiretos)?

:- [banco_rl14].

% Regra 4:
linhagem(M, D) :-
    mestre(M, D).                             % Caso Base: mestre direto

linhagem(M, D) :-
    mestre(M, Z),
    linhagem(Z, D).                           % Passo Recursivo

% Query 4:
% ?- linhagem(jiraiya, X).   -> X = minato ; X = nagato ; X = naruto ; X = kakashi ; X = obito ; X = rin ; X = sasuke ; X = sakura ; X = konohamaru ; X = boruto (com repetições)
