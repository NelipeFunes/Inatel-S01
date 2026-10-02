// Cenário: Em uma competição de tecnologia avançada, cada robô possui um modelo, uma
// versão de software, uma potência de laser e um nível de integridade do chassi.
// Tarefa:
// Crie uma classe Robô.
// Adicione os atributos: modelo (string), versao (int), potenciaLaser (float) e integridade
// (int).
// Crie um método chamado disparar(): Ele deve receber como parâmetro um objeto da
// classe Robô (o alvo). O método deve exibir uma mensagem confirmando o disparo e
// subtrair o valor da potenciaLaser da integridade do robô atingido.
// Na main: Instancie 2 objetos da classe Robô.
// Atribua valores personalizados aos atributos de cada um.
// Execute o método disparar(), definindo qual robô será o atacante e qual será o alvo.
// Ao final, exiba o status atualizado de ambos os robôs para ver como ficou a
// integridade após o confronto.

#include <iostream>
#include <string>

using namespace std;

class Robo {
protected:
    string modelo;
    int versao;
    float potenciaLaser;
    int integridade;

public:
    Robo(string m, int v, float p, int i) : modelo(m), versao(v), potenciaLaser(p), integridade(i) {}

    void disparar(Robo* alvo) {
        cout << modelo << " disparou o laser em " << alvo->modelo << " causando " << potenciaLaser << " de dano!" << endl;
        alvo->integridade = alvo->integridade - potenciaLaser;
    }

    void exibirStatus() {
        cout << "Modelo: " << modelo << " | Versao: " << versao << " | Potencia do Laser: " << potenciaLaser
             << " | Integridade: " << integridade << endl;
    }

    virtual ~Robo() {}
};

int main() {
    Robo* robo1 = new Robo("RX-78", 2, 35.5, 100);
    Robo* robo2 = new Robo("Zaku-II", 1, 20.0, 120);

    cout << "=== Status inicial ===" << endl;
    robo1->exibirStatus();
    robo2->exibirStatus();

    cout << endl << "=== Confronto ===" << endl;
    robo1->disparar(robo2);
    robo2->disparar(robo1);
    robo1->disparar(robo2);

    cout << endl << "=== Status final ===" << endl;
    robo1->exibirStatus();
    robo2->exibirStatus();

    delete robo1;
    delete robo2;

    return 0;
}
