-- Crie um programa em Lua que peça ao usuário a
-- quantidade N de elementos de uma tabela e, em
-- seguida, leia esses N números inteiros para
-- preenchê-la.
-- Depois de preencher a tabela, solicite ao usuário um
-- número inteiro adicional X (o número a ser buscado).
-- Escreva uma função chamada
-- contarOcorrencias(tabela, alvo) que receba a tabela e
-- o valor X como parâmetros. A função deve percorrer
-- todos os elementos da tabela e retornar apenas a
-- quantidade de vezes que o número X aparece nela

local N;
local X;
local numeros = {};

local function contarOcorrencias(tabela, alvo)
    local ocorrencias = 0;
    for i = 1, #tabela do
        if tabela[i] == alvo then ocorrencias = ocorrencias + 1;
        end
    end
    return ocorrencias;
end

print("Digite a quantidade de elementos: ")
N = tonumber(io.read());

for i = 1, N do
    print("Digite o elemento " .. i .. ": ")
    table.insert(numeros, tonumber(io.read()));
end

print("Digite o numero X a ser buscado: ")
X = tonumber(io.read());

print("O numero " .. X .. " aparece " .. contarOcorrencias(numeros, X) .. " vez(es) na tabela.");
