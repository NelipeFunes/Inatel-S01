// Cenário: Em Gravity Falls, dois irmãos gêmeos passam as férias em uma cidadezinha cheia de
// mistérios, na casa do tio-avô, que administra a Cabana do Mistério: uma loja de souvenirs e falsas
// atrações para turistas. Lá, eles encontram um diário misterioso, escrito por um autor desconhecido,
// que registra as criaturas sobrenaturais da cidade. Cada ficha é escrita dentro do diário e só existe
// nele (composição). Já os funcionários da Cabana são moradores da cidade, que existiam antes de
// serem contratados e continuam existindo fora dela (agregação).
// Tarefa:
// 1. Crie a classe FichaDeCriatura, cujo constructor recebe criatura (o nome da criatura) e
//    nivelDePerigo, com o método descrever(), que retorna um texto com os dois dados.
// 2. Crie a classe DiarioMisterioso, cujo constructor recebe numero (o número do diário), com o
//    atributo privado #fichas, que começa como um array vazio, e os métodos:
//    anotar(criatura, nivelDePerigo), que cria uma FichaDeCriatura dentro do método e a adiciona
//    ao #fichas com push;
//    exibirFichas(), que imprime o número do diário e, com forEach, o texto retornado por
//    descrever() de cada ficha.
// 3. Crie a classe Funcionario, cujo constructor recebe nome e cargo.
// 4. Crie a classe CabanaDoMisterio, cujo constructor recebe dono (o nome do dono), com o atributo
//    privado #funcionarios, que começa como um array vazio, e os métodos:
//    contratar(funcionario), que adiciona um funcionário já criado ao #funcionarios com push;
//    abrirAsPortas(), que imprime o nome do dono e, com forEach, o nome e o cargo de cada
//    funcionário.
// 5. No main, crie um diário com o número à sua escolha, anote nele duas ou três criaturas à sua
//    escolha e chame exibirFichas(). Depois, crie dois funcionários antes da Cabana, à sua escolha.
//    Por fim, crie a Cabana, contrate os dois e chame abrirAsPortas().
// 6. Explique, em um comentário no código, o que é composição e o que é agregação no seu
//    programa.

class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} | Nivel de perigo: ${this.nivelDePerigo}`;
    }
}

// Composição: cada FichaDeCriatura é criada dentro do método anotar() do DiarioMisterioso e
// guardada só no #fichas, que é privado. Ninguém fora do diário tem acesso às fichas, então
// elas só existem dentro do diário e deixam de existir junto com ele.
// Agregação: os Funcionario (Soos e Wendy) são criados no main antes da CabanaDoMisterio e
// só depois são contratados. O #funcionarios guarda apenas uma referência para eles, então
// eles já existiam antes da Cabana e continuam existindo fora dela.
class DiarioMisterioso {
    #fichas = [];

    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`--- Diario Misterioso n. ${this.numero} ---`);

        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- ${this.dono} abre as portas da Cabana do Misterio! ---`);

        this.#funcionarios.forEach(funcionario => {
            console.log(`${funcionario.nome} - ${funcionario.cargo}`);
        });
    }
}


const diario = new DiarioMisterioso(3);

diario.anotar('Gnomo', 2);
diario.anotar('Gobblewonker', 6);
diario.anotar('Bill Cipher', 10);

diario.exibirFichas();

const soos = new Funcionario('Soos', 'Faz-tudo');
const wendy = new Funcionario('Wendy', 'Caixa');

const cabana = new CabanaDoMisterio('Tio Stan');

cabana.contratar(soos);
cabana.contratar(wendy);

cabana.abrirAsPortas();
