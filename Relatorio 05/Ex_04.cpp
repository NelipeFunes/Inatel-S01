// Crie um programa em C++ que gerencie o estado de
// ativação de um painel solar com uma matriz 5 X 5
// de células fotovoltaicas (total de 25 células).
// 1. Declare uma matriz int matriz_solar[5][5] e
// garanta que todas as células iniciem com 0
// (inativas).
// 2. O programa deve rodar dentro de um laço while
// exibindo as seguintes opções:
// Ativar Célula: Solicita a fileira (0 a 4) e a
// coluna (0 a 4). Se matriz_solar[f][c] == 0, mude
// para 1 e exiba "Sucesso: Célula solar ativada!".
// Se matriz_solar[f][c] == 1, exiba "Erro: Célula
// solar já está em operação!".
// Telemetria do Painel: Percorre a matriz com dois
// laços for aninhados e exibe o mapa visual da
// matriz no terminal (ex: usando [0] para inativo e
// [1] para ativo).
// Sair: Encerra o laço principal.
// 3. Relatório Final (Pós-Menu): Assim que o
// usuário escolher a opção 3 (Sair), o programa
// deve percorrer a matriz uma última vez para
// calcular e exibir:
// Quantidade total de células ativas (1).
// Quantidade total de células inativas (0).
// Percentual da matriz em operação.
//
// Exemplo de Execução:
// === TELEMETRIA DO PAINEL SOLAR ===
// 1. Ativar Celula
// 2. Ver Mapa da Matriz
// 3. Sair
// Escolha uma opcao: 1
// Digite a fileira (0-4): 2
// Digite a coluna (0-4): 3
// Sucesso: Celula solar ativada!
//
// === TELEMETRIA DO PAINEL SOLAR ===
// ...
// Escolha uma opcao: 2
// --- Mapa da Matriz Solar ---
// [0] [0] [0] [0] [0]
// [0] [0] [0] [0] [0]
// [0] [0] [0] [1] [0]
// [0] [0] [0] [0] [0]
// [0] [0] [0] [0] [0]
//
// === TELEMETRIA DO PAINEL SOLAR ===
// ...
// Escolha uma opcao: 3
//
// === RELATORIO FINAL DE OPERACAO ===
// Total de celulas ATIVAS: 1
// Total de celulas INATIVAS: 24
// Capacidade Operacional: 4.00%

#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    int matriz_solar[5][5] = {0};
    int opcao = 0;
    int fileira, coluna;

    while (opcao != 3) {
        cout << endl;
        cout << "TELEMETRIA DO PAINEL SOLAR" << endl;
        cout << "1- Ativar Celula" << endl;
        cout << "2- Ver Mapa da Matriz" << endl;
        cout << "3- Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite a fileira (0-4): ";
                cin >> fileira;
                cout << "Digite a coluna (0-4): ";
                cin >> coluna;

                if (fileira < 0 || fileira > 4 || coluna < 0 || coluna > 4) {
                    cout << "Erro: Posicao fora da matriz!" << endl;
                } else if (matriz_solar[fileira][coluna] == 0) {
                    matriz_solar[fileira][coluna] = 1;
                    cout << "Sucesso: Celula solar ativada!" << endl;
                } else {
                    cout << "Erro: Celula solar ja esta em operacao!" << endl;
                }
                break;

            case 2:
                cout << "Mapa da Matriz Solar" << endl;
                for (int i = 0; i < 5; i++) {
                    for (int j = 0; j < 5; j++) {
                        cout << "[" << matriz_solar[i][j] << "] ";
                    }
                    cout << endl;
                }
                break;

            case 3:
                break;

            default:
                cout << "Opcao invalida! Tente novamente." << endl;
        }
    }

    int ativas = 0;
    int inativas = 0;

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (matriz_solar[i][j] == 1) {
                ativas++;
            } else {
                inativas++;
            }
        }
    }

    float percentual = (ativas / 25.0) * 100;

    cout << endl;
    cout << "RELATORIO FINAL DE OPERACAO" << endl;
    cout << "Total de celulas ATIVAS: " << ativas << endl;
    cout << "Total de celulas INATIVAS: " << inativas << endl;
    cout << "Capacidade Operacional: " << fixed << setprecision(2) << percentual << "%" << endl;

    return 0;
}
