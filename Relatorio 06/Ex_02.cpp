// Cenário: No jogo Persona, cada personagem, seja o protagonista ou um de seus aliados, tem
// características pessoais que devem ser protegidas e alteradas de forma controlada.
// Tarefa:
// 1. Crie uma classe base chamada Pessoa.
//    Adicione os atributos nome (string) e idade(int) como privados.
// 2. Crie uma classe Protagonista e outra Personagem
//    Ambas herdeiras de Pessoa. Protagonista deve ter um atributo de nível(int) e
//    Personagem deve ter um atributo de rank(int)
//    (obs: o rank dos Personagens/social link varia de 0 a 10).
//    Ambos devem ser privados.
// 3. Na main:
//    crie um objeto da classe Protagonista e atribua um nome e nível.
//    Faça o mesmo para um objeto da classe Personagem.
//    Imprima os valores e demonstre como os atributos estão sendo acessados.

#include <iostream>
#include <string>

using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string n, int i) : nome(n), idade(i) {}

    string getNome() {
        return nome;
    }

    int getIdade() {
        return idade;
    }

    virtual ~Pessoa() {}
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int nv) : Pessoa(n, i), nivel(nv) {}

    int getNivel() {
        return nivel;
    }

    void setNivel(int nv) {
        if (nv >= 1) {
            nivel = nv;
        } else {
            cout << "Erro: nivel invalido!" << endl;
        }
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i), rank(r) {}

    int getRank() {
        return rank;
    }

    void setRank(int r) {
        if (r >= 0 && r <= 10) {
            rank = r;
        } else {
            cout << "Erro: o rank deve estar entre 0 e 10!" << endl;
        }
    }
};

int main() {
    Protagonista protagonista("Makoto Yuki", 17, 1);
    Personagem personagem("Yukari Takeba", 16, 0);

    protagonista.setNivel(42);
    personagem.setRank(7);

    cout << "=== Protagonista ===" << endl;
    cout << "Nome: " << protagonista.getNome() << endl;
    cout << "Idade: " << protagonista.getIdade() << endl;
    cout << "Nivel: " << protagonista.getNivel() << endl;

    cout << endl << "=== Personagem ===" << endl;
    cout << "Nome: " << personagem.getNome() << endl;
    cout << "Idade: " << personagem.getIdade() << endl;
    cout << "Rank: " << personagem.getRank() << endl;

    cout << endl << "Tentando colocar rank 15 na " << personagem.getNome() << "..." << endl;
    personagem.setRank(15);
    cout << "Rank continua: " << personagem.getRank() << endl;

    return 0;
}
