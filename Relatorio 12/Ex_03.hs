-- Cenário: Uma ilustradora desenha criaturas, ruínas e paisagens sombrias e guarda tudo num
-- caderno de esboços. No programa, o caderno é uma lista, e cada esboço novo entra na frente
-- dela: o primeiro da lista é sempre o mais recente. Ela quer saber qual foi o último desenho,
-- quantos esboços já fez e quantas horas passou desenhando.
-- Tarefa:
-- 1. Defina o tipo Esboco com campos nomeados: titulo :: String, tecnica :: String
--    (nanquim, grafite, carvão...) e horas :: Int.
-- 2. Implemente esbocoMaisRecente :: [Esboco] -> String com pattern matching:
--    para a lista vazia ([]), retorna um aviso de que o caderno está vazio;
--    para (e:_), retorna o título e a técnica do primeiro esboço.
-- 3. Implemente contarEsbocos :: [Esboco] -> Int com recursão, sem usar length. No caso
--    base, o caderno vazio tem 0 esboços.
-- 4. Implemente horasDesenhando :: [Esboco] -> Int com recursão, sem usar sum nem map.
--    Ela soma as horas do primeiro esboço ao total do resto.
-- 5. Na main:
--    crie um caderno com pelo menos três esboços à sua escolha;
--    exiba o esboço mais recente, o número de esboços e o total de horas;
--    exiba também o esboço mais recente de um caderno vazio ([]).
-- 6. Ainda na main, crie um caderno novo, colocando mais um esboço à sua escolha na frente
--    do anterior, com :. Exiba o esboço mais recente e o número de esboços dos dois
--    cadernos: o anterior deve continuar igual.
-- 7. Tente exibir, com head, o título do primeiro esboço de um caderno vazio e observe o erro
--    ao executar. Depois, transforme essa linha em comentário (--) para o programa voltar
--    a rodar.

data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }


esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno esta vazio."
esbocoMaisRecente (e:_) = "Mais recente: " ++ titulo e ++ " (" ++ tecnica e ++ ")"


contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto


horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto


main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Catedral em ruinas", tecnica = "nanquim", horas = 6 }
        , Esboco { titulo = "Lobo das cinzas",    tecnica = "carvao",  horas = 4 }
        , Esboco { titulo = "Pantano sombrio",    tecnica = "grafite", horas = 3 }
        ]

  putStrLn "--- Caderno ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))
  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])

  let cadernoNovo =
        Esboco { titulo = "Torre do vigia", tecnica = "nanquim", horas = 5 } : caderno

  putStrLn "--- Caderno novo ---"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Esbocos: " ++ show (contarEsbocos cadernoNovo))
  putStrLn "--- Caderno anterior ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))

  -- putStrLn (titulo (head []))
