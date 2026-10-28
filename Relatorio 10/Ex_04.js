// Cenário: Em Hunter x Hunter, Hunters são aventureiros licenciados que dominam o
// Nen, a técnica de controlar a própria energia vital, chamada de aura. Todo usuário de
// Nen pertence a um tipo de Nen, que define o seu estilo de luta. A Trupe Fantasma, um
// grupo de ladrões cujos membros são chamados de Aranhas, foi avistada em uma
// cidade, e três Hunters de tipos diferentes vão enfrentá-la.
// Tarefa:
// 1. Crie a classe base UsuarioDeNen, cujo constructor recebe nome, com o método
//    atacar(alvo), que recebe uma Aranha (passo 3) e imprime um ataque genérico de
//    aura contra ela, citando o nome dos dois.
// 2. Crie as classes filhas Intensificador, Transmutador e Materializador, sem
//    constructor próprio. Cada uma sobrescreve atacar(alvo) para imprimir um ataque
//    típico do seu tipo de Nen, à sua escolha, citando o nome dos dois.
// 3. Crie a classe Aranha, cujo constructor recebe nome e numero (o número tatuado).
// 4. Agregação: crie a classe TrupeFantasma, cujo constructor recebe cidade e um
//    array de Aranhas já criadas, com valor padrão [], guardado no atributo privado
//    #aranhas, com os métodos:
//    revelarAranhas(), que imprime a cidade e, com forEach, o número e o nome de
//    cada Aranha;
//    buscarAranha(numero), que usa find para retornar a Aranha com o número
//    informado.
// 5. No main, crie duas Aranhas, à sua escolha, antes da Trupe. Crie a Trupe com uma
//    cidade à sua escolha, chame revelarAranhas() e use buscarAranha(...) para pegar
//    uma das duas Aranhas.
// 6. Ainda no main, crie um array com um usuário de Nen de cada tipo (Intensificador,
//    Transmutador e Materializador), com nomes à sua escolha, e percorra-o com
//    forEach, fazendo cada um chamar atacar(...) contra a Aranha encontrada no passo
//    anterior.

class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} concentra a aura e ataca ${alvo.nome}!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`[Intensificador] ${this.nome} reforca o punho com aura e acerta um JAJANKEN: PEDRA em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`[Transmutador] ${this.nome} transforma a aura em eletricidade e solta um RAIO NARUKAMI em ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`[Materializador] ${this.nome} materializa uma CORRENTE ACORRENTADORA e prende ${alvo.nome}!`);
    }
}


class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`--- A Trupe Fantasma foi avistada em ${this.cidade}! ---`);

        this.#aranhas.forEach(aranha => {
            console.log(`Aranha n. ${aranha.numero}: ${aranha.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}


const uvogin = new Aranha('Uvogin', 11);
const nobunaga = new Aranha('Nobunaga', 1);

const trupe = new TrupeFantasma('Yorknew', [uvogin, nobunaga]);

trupe.revelarAranhas();

const alvo = trupe.buscarAranha(11);
console.log(`\nAranha encontrada: n. ${alvo.numero} - ${alvo.nome}`);

const hunters = [
    new Intensificador('Gon'),
    new Transmutador('Killua'),
    new Materializador('Kurapika')
];

console.log('\n--- Os Hunters atacam! ---');
hunters.forEach(hunter => {
    hunter.atacar(alvo);
});
