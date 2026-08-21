'Faça um programa que peça e leia:
'A distância percorrida em um treino de corrida
'(em quilômetros)
'O tempo total gasto para completar a corrida (em
'minutos)
'Calcule o pace médio do corredor (tempo gasto por
'quilômetro):
'Pace = Tempo\Distância
'Ao final, exiba o valor do pace médio calculado (em
'min/km).

DIM distancia as Single
DIM tempo as Single
DIM pace as Single

DO
    INPUT "Digite a distancia percorrida: ", distancia
    IF distancia <= 0 THEN
        PRINT "Distancia nao pode ser menor ou igual a 0, digite uma distancia valida"
    END IF
LOOP WHILE distancia <= 0

DO
    INPUT "Digite o tempo em que a distancia foi percorrida: ", tempo
    IF tempo <= 0 THEN
        PRINT "Tempo nao pode ser menor ou igual a 0, digite um tempo valido"
    END IF
LOOP WHILE tempo <= 0

pace = tempo/distancia

PRINT "Seu pace foi de: "; pace; " min/km"

END