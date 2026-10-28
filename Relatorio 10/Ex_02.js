// Cenário: Valorant é um jogo de tiro tático em que dois times de cinco agentes se enfrentam. Os
// agentes fazem parte do Protocolo VALORANT, uma organização secreta, e cada um tem uma
// função no time, com uma habilidade própria. Todo agente entra na partida com uma pistola,
// que é dele e é criada junto com ele (composição). Os agentes já existem antes de serem
// reunidos em um esquadrão (agregação).
// Tarefa:
// 1. Parte composta: crie a classe Pistola, cujo constructor recebe e guarda modelo.
// 2. Classe base (contrato e composição): crie a classe AgenteProtocolo, cujo constructor
//    recebe codinome e modeloDaPistola:
//    guarde codinome em um atributo público;
//    crie a Pistola dentro do constructor, com o modelo recebido, e guarde-a no atributo
//    privado #pistola;
//    crie o método usarHabilidade(), que apenas lança um erro com throw new Error(...), com
//    uma mensagem à sua escolha;
//    crie o método entrarEmCombate(), que imprime o codinome, o modelo da pistola e o
//    texto retornado por usarHabilidade().
// 3. Crie as classes filhas Controlador, Iniciador e Duelista, sem constructor próprio. Cada uma
//    sobrescreve usarHabilidade() para retornar um texto com uma habilidade típica da sua função, à
//    sua escolha.
// 4. Agregação: crie a classe Esquadrao, cujo constructor recebe nome e um array de agentes já
//    criados, guardado no atributo privado #agentes, com os métodos:
// 5. iniciarPartida(), que imprime o nome do esquadrão e, com forEach, chama entrarEmCombate()
//    de cada agente (polimorfismo);
// 6. listarControladores(), que usa filter com instanceof para retornar um array só com os agentes
//    da classe Controlador.
// 7. No main, crie dois controladores, um iniciador e um duelista, com codinomes e modelos de
//    pistola à sua escolha. Reúna os quatro em um esquadrão, chame iniciarPartida() e imprima, com
//    forEach, o codinome de cada agente do array retornado por listarControladores().
// 8. Crie um AgenteProtocolo diretamente e, na linha seguinte, chame entrarEmCombate() nele.
//    Observe que o objeto é criado, mas a chamada gera um erro. Depois, transforme a linha da
//    chamada em comentário (//) para o programa voltar a rodar.

class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error(`O agente ${this.codinome} deve implementar o metodo 'usarHabilidade()'`);
    }

    entrarEmCombate() {
        console.log(`[${this.codinome}] Pistola: ${this.#pistola.modelo} | ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Lanca fumacas para bloquear a visao do inimigo.';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Dispara uma flecha de reconhecimento para revelar os inimigos.';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Avanca com uma rajada de vento e abre caminho para o time.';
    }
}


class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\n--- ${this.nome} INICIA A PARTIDA! ---`);

        this.#agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}


const omen = new Controlador('Omen', 'Ghost');
const brimstone = new Controlador('Brimstone', 'Sheriff');
const sova = new Iniciador('Sova', 'Classic');
const jett = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Protocolo Alfa', [omen, brimstone, sova, jett]);

esquadrao.iniciarPartida();

console.log('\nControladores do esquadrao:');
esquadrao.listarControladores().forEach(agente => console.log(`- ${agente.codinome}`));

const recruta = new AgenteProtocolo('Recruta', 'Classic');
// recruta.entrarEmCombate();
