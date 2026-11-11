-- Cenário: Em O Serviço de Entregas da Kiki, filme do Studio Ghibli, Kiki é uma bruxa de 13
-- anos que se muda para uma cidade à beira-mar e abre um serviço de entregas: ela leva as
-- encomendas voando na sua vassoura, uma viagem por encomenda. A vassoura só aguenta
-- um peso máximo por viagem, então Kiki quer saber quais encomendas do dia consegue levar
-- e quanto vai receber de frete (o valor cobrado pela entrega) por elas.
-- Tarefa:
-- 1. Fora da main, defina pesoMaximo :: Double, com o peso (em kg) que a vassoura aguenta,
--    à sua escolha.
-- 2. Defina o tipo Encomenda com campos nomeados (com chaves): destinatario :: String,
--    peso :: Double e frete :: Double.
-- 3. Implemente descrever :: Encomenda -> String, que retorna o destinatário, o peso e o
--    frete, lidos com as funções de campo (destinatario e, ...).
-- 4. Implemente cabemNaVassoura :: [Encomenda] -> [Encomenda], que usa filter com uma
--    lambda para manter só as encomendas com peso menor ou igual a pesoMaximo.
-- 5. Implemente totalDeFretes :: [Encomenda] -> Double, que soma os fretes com map e sum.
-- 6. Na main:
--    crie uma lista com pelo menos quatro encomendas à sua escolha, algumas mais
--    pesadas que o máximo;
--    com mapM_, exiba todas e depois só as que cabem na vassoura;
--    exiba o total de fretes das encomendas que cabem.
-- 7. Logo abaixo da definição de pesoMaximo, tente defini-lo de novo com outro valor e
--    observe o erro: o programa nem compila. Depois, transforme essa linha em comentário
--    (--) para o programa voltar a rodar.

pesoMaximo :: Double
pesoMaximo = 4.0
-- pesoMaximo = 6.0


data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }


descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " | " ++ show (peso e) ++ " kg | frete de R$ " ++ show (frete e)


cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas


totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)


main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Osono",  peso = 2.0, frete = 12.5 }
        , Encomenda { destinatario = "Ursula", peso = 6.0, frete = 20.0 }
        , Encomenda { destinatario = "Tombo",  peso = 1.5, frete = 7.5 }
        , Encomenda { destinatario = "Kokiri", peso = 8.0, frete = 30.0 }
        , Encomenda { destinatario = "Barsa",  peso = 3.5, frete = 15.0 }
        ]
  let cabem = cabemNaVassoura encomendas

  putStrLn "--- Encomendas do dia ---"
  mapM_ putStrLn (map descrever encomendas)
  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever cabem)
  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes cabem))
