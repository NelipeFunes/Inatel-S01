// Crie um programa em C++ que gerencie o limite de
// peso transportado por um drone industrial de
// entregas.
// No início do programa, solicite ao usuário que
// informe a capacidade máxima de carga do drone em
// kg (ex: 15.0 kg).
// O programa deve manter o peso atual carregado
// inicializado em 0.0 kg e exibir um menu iterativo
// com as seguintes opções:
// 1. Verificar Carga Atual: Exibe o peso atual
// carregado e a capacidade disponível restante.
// 2. Carregar Pacote: Pergunta o peso do pacote e
// tenta adicioná-lo ao drone.
// 3. Descarregar Pacote: Pergunta o peso a ser
// removido e reduz da carga atual.
// 4. Encerrar Operação: Sai do programa.
// Regra de Bloqueio: O programa não pode permitir
// que o peso total ultrapasse a capacidade máxima
// de carga informada. Caso o usuário tente
// adicionar um pacote que exceda esse limite, exiba
// a mensagem: "Alerta: Peso máximo de decolagem
// excedido! Operação cancelada."
// Da mesma forma, ao descarregar, não é permitido
// remover mais peso do que o que já está carregado.
// O menu deve reaparecer após cada operação até
// que a opção de encerrar seja selecionada.
//
// Exemplo de Execução:
// Informe a capacidade maxima de carga do drone (kg): 10.0
//
// === SISTEMA DE CARGA DO DRONE ===
// 1. Verificar Carga
// 2. Carregar Pacote
// 3. Descarregar Pacote
// 4. Encerrar Operacao
// Escolha uma opcao: 2
// Digite o peso do pacote a ser carregado (kg): 6.5
// Pacote adicionado com sucesso!
//
// === SISTEMA DE CARGA DO DRONE ===
// ...
// Escolha uma opcao: 2
// Digite o peso do pacote a ser carregado (kg): 5.0
// Alerta: Peso maximo de decolagem excedido! Operacao cancelada.
//
// === SISTEMA DE CARGA DO DRONE ===
// ...
// Escolha uma opcao: 1
// Carga Atual: 6.50 kg / 10.00 kg
// Espaco Disponivel: 3.50 kg
//
// === SISTEMA DE CARGA DO DRONE ===
// ...
// Escolha uma opcao: 4
// Encerrando sistema de telemetria...

#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    float capacidade;
    float carga = 0.0;
    float peso;
    int opcao;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidade;

    do {
        cout << endl;
        cout << "SISTEMA DE CARGA DO DRONE" << endl;
        cout << "1- Verificar Carga" << endl;
        cout << "2- Carregar Pacote" << endl;
        cout << "3- Descarregar Pacote" << endl;
        cout << "4- Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";

        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Carga Atual: " << fixed << setprecision(2) << carga << " kg / " << capacidade << " kg" << endl;
                cout << "Espaco Disponivel: " << fixed << setprecision(2) << capacidade - carga << " kg" << endl;
                break;

            case 2:
                cout << "Digite o peso do pacote a ser carregado (kg): ";
                cin >> peso;

                if (carga + peso > capacidade) {
                    cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
                } else {
                    carga = carga + peso;
                    cout << "Pacote adicionado com sucesso!" << endl;
                }
                break;

            case 3:
                cout << "Digite o peso do pacote a ser removido (kg): ";
                cin >> peso;

                if (peso > carga) {
                    cout << "Erro: Nao e possivel remover mais peso do que o carregado! Operacao cancelada." << endl;
                } else {
                    carga = carga - peso;
                    cout << "Pacote removido com sucesso!" << endl;
                }
                break;

            case 4:
                cout << "Encerrando sistema de telemetria..." << endl;
                break;

            default:
                cout << "Opcao invalida! Tente novamente." << endl;
        }
    } while (opcao != 4);

    return 0;
}
