-- Cenário: Em A Viagem de Chihiro, filme do Studio Ghibli, a bruxa Yubaba administra uma casa
-- de banhos frequentada por espíritos, como deuses e criaturas mágicas. Cada atendimento
-- registra o espírito, o serviço contratado, o valor e a etapa em que ele está: na fila, no banho ou
-- concluído. Só os atendimentos concluídos já foram pagos.
-- Tarefa:
-- 1. Crie o tipo Etapa, com as opções NaFila, NoBanho e Concluido, e deriving (Show, Eq).
-- 2. Defina o tipo Atendimento com campos nomeados: cliente :: String, servico :: String,
--    valor :: Double e etapa :: Etapa.
-- 3. Implemente descrever :: Atendimento -> String, que retorna o cliente, o serviço e a etapa
--    (use show na etapa).
-- 4. Implemente concluir :: Atendimento -> Atendimento, que retorna um atendimento novo,
--    igual ao recebido, mas com a etapa Concluido (use a cópia com { etapa = ... }).
-- 5. Implemente arrecadado :: [Atendimento] -> Double, que soma o valor só dos
--    atendimentos concluídos: use filter com uma lambda que compara a etapa com ==,
--    depois map e sum.
-- 6. Na main, crie três atendimentos à sua escolha, nenhum concluído, e monte com eles
--    uma lista. Depois, crie uma lista nova em que alguns deles, mas não todos, passam
--    por concluir.
-- 7. Ainda na main, exiba as duas listas com mapM_ e o valor arrecadado em cada uma: a lista
--    original deve continuar igual.

data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)


data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }


descrever :: Atendimento -> String
descrever atendimento =
  cliente atendimento ++ " | " ++ servico atendimento ++ " | " ++ show (etapa atendimento)


concluir :: Atendimento -> Atendimento
concluir atendimento = atendimento { etapa = Concluido }


arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))


main :: IO ()
main = do
  let espiritoDoRio =
        Atendimento { cliente = "Espirito do Rio"
                    , servico = "Banho de ervas medicinais"
                    , valor   = 150.0
                    , etapa   = NoBanho }
  let semRosto =
        Atendimento { cliente = "Sem-Rosto"
                    , servico = "Banho de sais"
                    , valor   = 80.0
                    , etapa   = NaFila }
  let deusRabanete =
        Atendimento { cliente = "Deus Rabanete"
                    , servico = "Banho quente"
                    , valor   = 45.5
                    , etapa   = NaFila }
  let atendimentos = [espiritoDoRio, semRosto, deusRabanete]
  let atualizados = [concluir espiritoDoRio, semRosto, concluir deusRabanete]

  putStrLn "--- Atendimentos originais ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))
  putStrLn "--- Atendimentos atualizados ---"
  mapM_ putStrLn (map descrever atualizados)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atualizados))
