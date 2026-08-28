-- Crie um programa em Lua que contenha
-- obrigatoriamente subfunções dedicadas para cada
-- uma das seguintes operações sobre dois números:
-- 1.
-- calcularMedia(a, b): retorna a média aritmética
-- entre os dois valores.
-- 2. encontrarMaior(a, b): retorna o maior valor entre
-- os dois números.
-- 3.
-- calcularDiferencaAbsoluta(a, b): retorna a
-- diferença positiva entre os números (ou seja,
-- |a - b|).
-- Crie uma função principal chamada
-- analisarNumeros(n1, n2, operacao) que receba dois
-- números e um texto indicando a operação desejada
-- ("media", "maior" ou "diferenca").
-- A função principal deve chamar a subfunção
-- correspondente e retornar o resultado calculado.
-- Caso a operação informada seja inválida, retorne a
-- mensagem de erro: "Operação inválida!"

local number1;
local number2;
local operacao;

local function calcularMedia(a, b)
    return (a + b) / 2;
end

local function encontrarMaior(a, b)
    if a > b then return a;
    else return b;
    end
end

local function calcularDiferencaAbsoluta(a, b)
    if a > b then return a - b;
    else return b - a;
    end
end

local function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then return calcularMedia(n1, n2);
    elseif operacao == "maior" then return encontrarMaior(n1, n2);
    elseif operacao == "diferenca" then return calcularDiferencaAbsoluta(n1, n2);
    else return "Operacao invalida!";
    end
end

print("Digite o primeiro numero: ")
number1 = tonumber(io.read());
print("Digite o segundo numero: ")
number2 = tonumber(io.read());
print('Digite a operacao ("media", "maior" ou "diferenca"): ')
operacao = io.read();

print("Resultado: " .. analisarNumeros(number1, number2, operacao));
