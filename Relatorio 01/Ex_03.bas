' Faça um programa que peça e leia uma quantidade
' de tempo em Horas.
' Converta esse valor para:
' Minutos
' Segundos
' Ao final, exiba:
' O valor original em horas
' O valor equivalente em minutos
' O valor equivalente em segundos

DIM horas as INTEGER
DIM minutos as LONG
DIM segundos as LONG

INPUT "Digite o tempo em horas: ", horas

minutos = horas * 60
segundos = minutos * 60

PRINT horas; " tem : "; minutos; " minutos"
PRINT horas; " tem : "; segundos; " segundos"

END
