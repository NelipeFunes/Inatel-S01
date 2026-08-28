-- Crie um programa em Lua que solicite ao usuário
-- a quantidade N de elementos de uma tabela e,
-- em seguida, leia esses N números inteiros para
-- preenchê-la.
-- Depois de preencher a tabela, peça ao usuário
-- para digitar um número inteiro que servirá como
-- limite (K).
-- Escreva uma função chamada
-- filtrarMaiores(tabela, limite) que receba a tabela
-- original e o limite K como parâmetros. A função
-- deve percorrer a tabela e retornar uma nova
-- tabela contendo apenas os números que forem
-- estritamente maiores que K.
-- Ao final, imprima os elementos dessa nova tabela
-- no programa principal

local N;
local K;
local numeros = {};
local maiores;

local function filtrarMaiores(tabela, limite)
    local filtrados = {};
    for i = 1, #tabela do
        if tabela[i] > limite then table.insert(filtrados, tabela[i]);
        end
    end
    return filtrados;
end

print("Digite a quantidade de elementos: ")
N = tonumber(io.read());

for i = 1, N do
    print("Digite o elemento " .. i .. ": ")
    table.insert(numeros, tonumber(io.read()));
end

print("Digite o valor limite: ")
K = tonumber(io.read());

maiores = filtrarMaiores(numeros, K);

print("Elementos maiores que " .. K .. " ---");
for i = 1, #maiores do print(maiores[i]);
end
