// Crie uma função recursiva chamada
// int combinar_equipes(int n).
// Em um torneio eliminatório simétrico, o número de
// cenários de confrontos possíveis para uma chave
// de tamanho n é determinado pela análise
// combinada dos seus subgrupos, seguindo as regras:
// Se n = 0, a função deve retornar 0.
// Se n = 1, a função deve retornar 1 (cenário base
// com um grupo único).
// Para qualquer valor n > 1, retorne a soma dos
// cenários dos dois níveis anteriores chamando a
// própria função:
// combinar_equipes(n - 1) + combinar_equipes(n - 2).
// Na main, solicite ao usuário o tamanho do
// chaveamento n e exiba a quantidade total de
// combinações calculadas recursivamente.
//
// Exemplo de Execução:
// Digite o tamanho do chaveamento (n): 6
// Total de cenários de confrontos possíveis: 8

#include <iostream>

using namespace std;

int combinar_equipes(int n) {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
        return combinar_equipes(n - 1) + combinar_equipes(n - 2);
    }
}

int main() {
    int n;

    cout << "Digite o tamanho do chaveamento (n): ";
    cin >> n;

    cout << "Total de cenarios de confrontos possiveis: " << combinar_equipes(n) << endl;

    return 0;
}
