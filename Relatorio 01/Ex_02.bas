' Faça um programa que defina um PIN numérico fixo
' no código (por exemplo: 4321).
' Peça para o usuário digitar o PIN de acesso.
' Enquanto o PIN digitado for incorreto, exiba a
' mensagem:
' "PIN inválido. Tente novamente." e peça o PIN
' novamente.
' Quando o usuário digitar o PIN correto, exiba a
' mensagem:
' "Transação autorizada!

'Constantes
CONST pinCorreto = 2001

' Variaveis
DIM pin as INTEGER

' Processamento
DO 
    INPUT "Digite seu pin: ", pin
    IF pin <> pinCorreto THEN
        PRINT "PIN invalido. Tente novamente"
    END IF
LOOP WHILE pin <> pinCorreto

PRINT "Transacao autorizada!"

END