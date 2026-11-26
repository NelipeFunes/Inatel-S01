% Exercício 1 - Aprendiz de Elite
% 1. Sabendo que Boruto foi treinado por Sasuke e por Naruto, inclua esses fatos.
%    (Fatos mestre(sasuke, boruto). e mestre(naruto, boruto). incluídos em banco_rl14.pl)
% 2. Crie a regra aprendiz_de_elite(Ninja), verdadeira SE o Ninja for discípulo de
%    kakashi OU de sasuke E tiver natureza de chakra raio OU fogo.
% 3. Query: quem são os aprendizes de elite?

:- [banco_rl14].

% Regra 1:
aprendiz_de_elite(Ninja) :-
    (mestre(kakashi, Ninja) ; mestre(sasuke, Ninja)),
    (natureza(Ninja, raio) ; natureza(Ninja, fogo)).

% Query 1:
% ?- aprendiz_de_elite(X).   -> X = sasuke ; X = sasuke ; X = boruto
