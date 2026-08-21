' Faça um programa que leia o peso de uma pessoa
' (em kg) e a quantidade de água que ela já ingeriu no
' dia (em ml).
' A meta diária recomendada de água é calculada
' multiplicando o peso do indivíduo por 35 ml.
' Se a quantidade ingerida for maior ou igual à
' meta recomendada, exiba a mensagem:
' "Meta atingida!"
' Caso contrário, exiba a mensagem:
' "Meta não atingida"

' Variaveis
DIM nome as String
DIM peso as Single
DIM aguaIngerida as Single
DIM metaParaAtingir as Single

' Entrada de dados
PRINT "Bem vindo a calculadora de ingestao de agua"
INPUT "Digite o seu nome: ", nome
INPUT "Digite o seu peso: ", peso
INPUT "Digite a quantidade de agua ingerida hoje: ", aguaIngerida

' Processamento de dados
metaParaAtingir = peso * 35

' Condicional
IF aguaIngerida < metaParaAtingir THEN
    PRINT nome; ", a meta nao foi atingida"
ELSE 
    PRINT nome; ", a meta foi atingida, parabens!"
END IF

END



