// Cenário: No mundo de Pokémon, treinadores levam criaturas chamadas Pokémon para batalhas
// em ginásios. Cada Pokémon pertence a uma espécie, tem um tipo, que define os seus golpes, e
// uma quantidade de vida. A vida não pode ser alterada diretamente de fora: só os golpes
// recebidos em combate podem reduzi-la, e ela nunca fica abaixo de zero.
// Tarefa:
// 1. Crie a classe Pokemon, cujo constructor recebe apelido, tipo e vidaInicial:
//    apelido e tipo são atributos públicos;
//    a vida fica no atributo privado #vida, que começa com o valor de vidaInicial;
//    crie o getter vida (com get) e nenhum setter: de fora, a vida só pode ser lida;
//    crie o método sofrerDano(pontos), que subtrai os pontos da vida sem deixá-la negativa
//    (se passar de zero, ela fica em 0) e imprime o apelido e a vida restante;
//    crie o método atacar(alvo), que recebe outro Pokémon, imprime um ataque genérico e
//    chama alvo.sofrerDano(10).
// 2. Crie a classe filha Squirtle, cujo constructor recebe apelido e vidaInicial e chama super(...)
//    passando o tipo fixo 'Água'. Sobrescreva atacar(alvo) para imprimir um golpe de água à sua
//    escolha e chamar alvo.sofrerDano(20).
// 3. Crie a classe filha Bulbasaur, do mesmo jeito, com o tipo fixo 'Planta'. Sobrescreva
//    atacar(alvo) para imprimir um golpe de planta à sua escolha e chamar alvo.sofrerDano(15).
// 4. No main, crie um Squirtle e um Bulbasaur, com apelidos à sua escolha. A vida inicial do
//    Squirtle também é à sua escolha, mas o Bulbasaur deve começar com 30. Faça o Bulbasaur
//    atacar o Squirtle uma vez e o Squirtle atacar o Bulbasaur duas vezes. Depois, imprima a vida
//    dos dois usando o getter.
// 5. Tente imprimir o #vida de um dos Pokémon diretamente no main e observe o erro: o
//    programa nem chega a rodar. Depois, transforme essa linha em comentário (//) para o
//    programa voltar a rodar.

class Pokemon {
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida = this.#vida - pontos;
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`${this.apelido} recebeu ${pontos} de dano. Vida restante: ${this.#vida}`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa um ataque basico em ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Agua', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} (${this.tipo}) usa JATO D'AGUA em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} (${this.tipo}) usa CHICOTE DE VINHA em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}


console.log('--- Batalha no Ginasio de Celeste ---');

const tartaruga = new Squirtle('Tartaruga', 44);
const sementinha = new Bulbasaur('Sementinha', 30);

console.log('');
sementinha.atacar(tartaruga);

console.log('');
tartaruga.atacar(sementinha);

console.log('');
tartaruga.atacar(sementinha);

console.log('\n--- Vida apos a batalha ---');
console.log(`${tartaruga.apelido}: ${tartaruga.vida}`);
console.log(`${sementinha.apelido}: ${sementinha.vida}`);

// console.log(tartaruga.#vida);
