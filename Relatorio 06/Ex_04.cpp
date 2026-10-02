// Cenário: Durante o Conselho de Paz das Terras Ancestrais, representantes de
// diferentes linhagens se reúnem. Embora cada um pertença a uma cultura distinta
// como Anões, Orcs e Draconatos, todos são reconhecidos como Membros do
// Conselho. Seu objetivo é criar um sistema que gerencie esses representantes em um
// único registro e permita que cada um faça sua saudação tradicional.
// Tarefa:
// 1. Crie uma classe base chamada MembroConselho:
//    Adicione o atributo nome (string).
//    Crie um método (virtual) chamado saudar(). Dentro dele, imprima: "Um
//    membro do conselho faz uma reverência silenciosa."
// 2. Crie três classes filhas que herdem de MembroConselho:
//    Anao: Sobrescreva saudar() para exibir: "Pela força da montanha, eu sou
//    [nome] e honro nosso aço!"
//    Orc: Sobrescreva saudar() para exibir: "Pelo sangue e glória, eu sou [nome] e
//    trago a força de minha tribo!"
//    Draconato: Sobrescreva saudar() para exibir: "Pelo sopro dos ancestrais, eu
//    sou [nome] e falo em nome dos dragões!"
// 3. Na main:
//    Crie uma única lista para armazenar objetos do tipo MembroConselho.
//    Crie uma instância de cada raça (Anao, Orc, Draconato) com nomes diferentes
//    e adicione-as à sua lista.
//    Percorra a lista, Para cada elemento, chame o método saudar() para
//    demonstrar o comportamento polimórfico.

#include <iostream>
#include <string>
#include <vector>

using namespace std;

class MembroConselho {
protected:
    string nome;

public:
    MembroConselho(string n) : nome(n) {}

    virtual void saudar() {
        cout << "Um membro do conselho faz uma reverencia silenciosa." << endl;
    }

    virtual ~MembroConselho() {}
};

class Anao : public MembroConselho {
public:
    Anao(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Pela forca da montanha, eu sou " << nome << " e honro nosso aco!" << endl;
    }
};

class Orc : public MembroConselho {
public:
    Orc(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Pelo sangue e gloria, eu sou " << nome << " e trago a forca de minha tribo!" << endl;
    }
};

class Draconato : public MembroConselho {
public:
    Draconato(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Pelo sopro dos ancestrais, eu sou " << nome << " e falo em nome dos dragoes!" << endl;
    }
};

int main() {
    vector<MembroConselho*> conselho;

    conselho.push_back(new Anao("Thorin"));
    conselho.push_back(new Orc("Grommash"));
    conselho.push_back(new Draconato("Balasar"));
    conselho.push_back(new MembroConselho("Anonimo"));

    cout << "=== Conselho de Paz das Terras Ancestrais ===" << endl;

    for (MembroConselho* m : conselho) {
        m->saudar();
    }

    for (MembroConselho* m : conselho) {
        delete m;
    }

    return 0;
}
