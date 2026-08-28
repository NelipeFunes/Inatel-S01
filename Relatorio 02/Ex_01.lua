-- Crie um programa em Lua que solicite e leia três
-- números inteiros:
-- 1. M: o expoente inicial
-- 2. N: o expoente final (assuma que M <= N)
-- 3. base: a base da potenciação
-- Escreva uma função chamada
-- gerarTabelaPotencias(inicio, fim, base) que receba
-- esses três valores como parâmetros. A função
-- deve percorrer todos os números do intervalo de
-- inicio até fim (inclusive) e exibir a base elevada a
-- cada um dos expoentes nesse intervalo.

local M;
local N;
local base;

local function gerarTabelaPotencias(inicio, fim, base)  
    for expoente = inicio, fim do print(base^ expoente);
    end
end

print("Digite o inicio do loop: ")
M = tonumber(io.read());
print("Digite o fim do loop: ")
N = tonumber(io.read());
print("Digite a base a ser elevada: ")
base = tonumber(io.read());

gerarTabelaPotencias(M, N, base);
