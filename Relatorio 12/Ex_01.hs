-- Cenário: Em Persona 5, o Leblanc é um pequeno café em Tóquio. O dono prepara cafés com
-- grãos de várias origens, e cada café da casa tem um nome, um preço e uma intensidade, de
-- 1 (bem suave) a 10 (muito forte). Ele quer um programa que descreva os cafés do dia, diga a
-- força de cada um e calcule o preço quando o cliente pede leite.
-- Tarefa:
-- 1. Defina o tipo Cafe com campos posicionais (sem chaves), nesta ordem: nome (String),
--    preço (Double) e intensidade (Int).
-- 2. Implemente descrever :: Cafe -> String, que retorna um texto com o nome e o preço
--    do café. Separe os campos com pattern matching no parâmetro e converta o preço
--    com show.
-- 3. Implemente forca :: Cafe -> String com guards, que retorna:
--    "Forte" para intensidade 8 ou mais;
--    "Equilibrado" de 5 a 7;
--    "Suave" nos demais casos (otherwise).
-- 4. Implemente precoDoPedido :: Bool -> Cafe -> Double com if ... then ... else. O
--    primeiro argumento diz se o cliente pediu leite (True) ou não (False), e o leite custa 2.0
--    a mais.
-- 5. Na main:
--    crie três cafés à sua escolha, um em cada faixa de intensidade;
--    exiba com putStrLn a descrição e a força de cada um;
--    exiba com print o preço de um deles pedido com leite e sem leite.

data Cafe = Cafe String Double Int


descrever :: Cafe -> String
descrever (Cafe nome preco _) =
  nome ++ " - R$ " ++ show preco


forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"


precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco


main :: IO ()
main = do
  let blendDaCasa = Cafe "Blend da Casa" 8.0 9
  let kilimanjaro = Cafe "Kilimanjaro" 10.5 6
  let kona = Cafe "Kona" 9.0 3

  putStrLn "--- Cafes do dia ---"
  putStrLn (descrever blendDaCasa ++ " | " ++ forca blendDaCasa)
  putStrLn (descrever kilimanjaro ++ " | " ++ forca kilimanjaro)
  putStrLn (descrever kona ++ " | " ++ forca kona)

  putStrLn "--- Kilimanjaro com leite e sem leite ---"
  print (precoDoPedido True kilimanjaro)
  print (precoDoPedido False kilimanjaro)
