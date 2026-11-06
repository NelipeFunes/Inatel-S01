// Cenário: Em Dungeon Meshi (Delicious in Dungeon), um grupo de aventureiros explora
// uma masmorra e, sem comida, aprende com um cozinheiro anão a preparar os monstros
// que derrota. Todo monstro vira ingrediente, mas cada tipo tem a sua própria receita. O
// cozinheiro carrega sempre a sua panela, que é dele e nasce com ele (composição), e
// junta os monstros que o grupo derrota pelo caminho (agregação).
// Tarefa:
// 1. Crie a classe abstrata Monstro:
//    atributo private String nome, recebido no construtor, e o getter public String
//    getNome();
//    método abstrato public abstract String receita();, que nas filhas vai retornar o
//    modo de preparo.
// 2. Crie as classes Slime e Mandragora, que herdam de Monstro. Cada uma tem um
//    construtor (Slime(String nome) e Mandragora(String nome)) que repassa o nome
//    com super(nome), e sobrescreve receita() com @Override, retornando um modo de
//    preparo à sua escolha.
// 3. Parte composta: crie a classe Panela, com o atributo private String material, recebido
//    no construtor, e o getter public String getMaterial().
// 4. Crie a classe Cozinheiro:
//    atributos private String nome, private Panela panela e private ArrayList<Monstro>
//    ingredientes;
//    construtor Cozinheiro(String nome, String materialDaPanela), que cria a Panela
//    dentro dele, com o material recebido, e cria a lista de ingredientes vazia;
//    método public void adicionarIngrediente(Monstro monstro), que adiciona um
//    monstro já criado à lista;
//    método public void servirBanquete(), que imprime o nome do cozinheiro e o material da
//    panela e, com um for-each, o nome e a receita() de cada ingrediente.
// 5. No main, crie um Slime e uma Mandragora, à sua escolha, antes do cozinheiro. Depois,
//    crie o cozinheiro, com o nome e o material da panela à sua escolha, adicione os dois
//    monstros e chame servirBanquete().
// 6. Explique, em um comentário no código, o que é composição e o que é agregação no seu
//    programa.

import java.util.ArrayList;

public class Ex_04 {
    public static void main(String[] args) {
        Slime slime = new Slime("Slime Gigante");
        Mandragora mandragora = new Mandragora("Mandragora Gritadora");

        Cozinheiro senshi = new Cozinheiro("Senshi", "Adamantita");

        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();
    }
}


abstract class Monstro {

    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}


class Slime extends Monstro {

    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Seque ao sol, corte em tiras e cozinhe no caldo.";
    }
}


class Mandragora extends Monstro {

    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Arranque da terra, empane e frite como tempura.";
    }
}


class Panela {

    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}


// Composição: a Panela é criada dentro do construtor do Cozinheiro, com o material recebido.
// Ela nasce junto com o Cozinheiro e pertence só a ele: ninguém fora da classe guarda essa
// Panela, então ela deixa de existir junto com ele.
// Agregação: os Monstros (Slime e Mandragora) são criados na main antes do Cozinheiro e só
// depois são entregues pelo adicionarIngrediente. A lista ingredientes guarda apenas uma
// referência para eles, então eles já existiam antes e continuam existindo fora do Cozinheiro.
class Cozinheiro {

    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        this.ingredientes.add(monstro);
        System.out.println("[Masmorra] " + nome + " guardou o ingrediente: " + monstro.getNome());
    }

    public void servirBanquete() {
        System.out.println("\n--- Banquete de " + nome + " (panela de " + panela.getMaterial() + ") ---");

        for (Monstro monstro : ingredientes) {
            System.out.println("- " + monstro.getNome() + ": " + monstro.receita());
        }
    }
}
