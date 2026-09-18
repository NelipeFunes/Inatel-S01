// Crie uma função chamada
// float calcular_confiabilidade_sistema(float
// probabilidades[], int tamanho).
// Em um sistema crítico cujos componentes estão
// conectados em série, o sistema só funciona se
// todos os seus componentes funcionarem.
// A probabilidade de o sistema continuar em
// operação é dada pelo produto das probabilidades
// individuais de cada componente.
// A função deve receber o array com as
// probabilidades de funcionamento de cada
// componente (valores entre 0.0 e 1.0) e o seu
// tamanho. Em seguida, deve iterar pelo array,
// multiplicar todas as probabilidades e retornar a
// probabilidade conjunta final do sistema.
// Na main:
// Peça ao usuário a quantidade de componentes do
// sistema N.
// Crie um array de float para armazenar as
// probabilidades.
// Solicite ao usuário que digite a probabilidade de
// cada componente.
// Chame a função calcular_confiabilidade_sistema
// passando o array e o tamanho.
// Exiba a confiabilidade total do sistema.
//
// Exemplo de Execução:
// Digite a quantidade de componentes do sistema: 3
// Digite a probabilidade do componente 1 (ex: 0.95): 0.98
// Digite a probabilidade do componente 2 (ex: 0.95): 0.95
// Digite a probabilidade do componente 3 (ex: 0.95): 0.90
// Confiabilidade total do sistema: 0.8379 (83.79%)

#include <iostream>
#include <iomanip>

using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float confiabilidade = 1.0;

    for (int i = 0; i < tamanho; i++) {
        confiabilidade = confiabilidade * probabilidades[i];
    }

    return confiabilidade;
}

int main() {
    int quantidade;

    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> quantidade;

    float probabilidades[100];

    for (int i = 0; i < quantidade; i++) {
        cout << "Digite a probabilidade do componente " << i + 1 << " : ";
        cin >> probabilidades[i];
    }

    float confiabilidade = calcular_confiabilidade_sistema(probabilidades, quantidade);

    cout << "Confiabilidade total do sistema: " << fixed << setprecision(4) << confiabilidade
         << " (" << setprecision(2) << confiabilidade * 100 << "%)" << endl;

    return 0;
}
