// Cenário: No Inatel, durante eventos como a FETIN, diferentes membros da instituição
// desempenham papéis distintos. Todos são Membros do Inatel, mas cada categoria
// possui responsabilidades e formas de se identificar diferentes dentro do campus.
// Tarefa:
// 1. Crie uma classe base chamada MembroInatel:
//    Adicione um atributo nomeCompleto (string).
//    Crie um método (virtual) chamado identificar(). O método deve exibir: "Sou um
//    membro da comunidade Inatel: [nomeCompleto]."
// 2. Crie as classes Coordenador e Pesquisador que herdem de MembroInatel:
//    Adicione o atributo departamento (string) na classe Coordenador.
//    Adicione o atributo laboratorio (string) na classe Pesquisador.
// 3. Sobrescreva o método identificar() em ambas as classes:
//    No Coordenador, ele deve exibir: "Meu nome é [nomeCompleto], sou o
//    coordenador do departamento de [departamento] no Inatel."
//    No Pesquisador, ele deve exibir: "Meu nome é [nomeCompleto], e realizo
//    pesquisas no laboratório [laboratorio] do Inatel."
// 4. Na main:
//    Crie ponteiros da classe base MembroInatel.
//    Aponte o primeiro ponteiro para um objeto do tipo Coordenador e o segundo
//    para um objeto do tipo Pesquisador.
//    Atribua valores aos atributos e chame o método identificar() através dos
//    ponteiros da classe base para demonstrar o polimorfismo.

#include <iostream>
#include <string>

using namespace std;

class MembroInatel {
protected:
    string nomeCompleto;

public:
    MembroInatel(string n) : nomeCompleto(n) {}

    virtual void identificar() {
        cout << "Sou um membro da comunidade Inatel: " << nomeCompleto << "." << endl;
    }

    virtual ~MembroInatel() {}
};

class Coordenador : public MembroInatel {
protected:
    string departamento;

public:
    Coordenador(string n, string d) : MembroInatel(n), departamento(d) {}

    void identificar() override {
        cout << "Meu nome e " << nomeCompleto << ", sou o coordenador do departamento de "
             << departamento << " no Inatel." << endl;
    }
};

class Pesquisador : public MembroInatel {
protected:
    string laboratorio;

public:
    Pesquisador(string n, string l) : MembroInatel(n), laboratorio(l) {}

    void identificar() override {
        cout << "Meu nome e " << nomeCompleto << ", e realizo pesquisas no laboratorio "
             << laboratorio << " do Inatel." << endl;
    }
};

int main() {
    MembroInatel* membro1 = new Coordenador("Joao Pedro Silva", "Engenharia de Computacao");
    MembroInatel* membro2 = new Pesquisador("Maria Clara Souza", "CRR");

    cout << "=== Identificacao na FETIN ===" << endl;

    membro1->identificar();
    membro2->identificar();

    delete membro1;
    delete membro2;

    return 0;
}
