// Cenário: Em Persona 5, o Leblanc é um pequeno café em Tóquio, famoso pelo café coado na
// hora e pelo curry da casa. O cardápio tem itens comuns, vendidos pelo preço cadastrado, e
// combos, que saem com desconto.
// Tarefa:
// 1. Crie a classe ItemDoCardapio:
//    atributos private String nome e private double preco, recebidos no construtor;
//    getters public String getNome() e public double getPreco();
//    método public double precoFinal(), que retorna o preço.
// 2. Crie a classe ComboLeblanc, que herda de ItemDoCardapio:
//    construtor ComboLeblanc(String nome, double preco), que repassa os dois valores
//    com super(nome, preco);
//    sobrescreva precoFinal() com @Override, retornando o preço com 10% de desconto
//    (getPreco() * 0.9).
// 3. Crie a classe CafeLeblanc:
//    atributo private ArrayList<ItemDoCardapio> cardapio, criado vazio no construtor,
//    que não recebe parâmetros;
//    método public void adicionar(ItemDoCardapio item), que adiciona um item já criado
//    ao cardápio;
//    método public void mostrarCardapio(), que percorre o cardápio com um for-each e
//    imprime o nome e o precoFinal() de cada item.
// 4. No main, crie dois ItemDoCardapio e um ComboLeblanc, com nomes e preços à sua
//    escolha. Crie o CafeLeblanc, adicione os três itens e chame mostrarCardapio().

import java.util.ArrayList;

public class Ex_02 {
    public static void main(String[] args) {
        ItemDoCardapio cafe = new ItemDoCardapio("Cafe coado", 500.0);
        ItemDoCardapio curry = new ItemDoCardapio("Curry da casa", 800.0);
        ComboLeblanc combo = new ComboLeblanc("Combo curry e cafe", 1200.0);

        CafeLeblanc leblanc = new CafeLeblanc();

        leblanc.adicionar(cafe);
        leblanc.adicionar(curry);
        leblanc.adicionar(combo);

        leblanc.mostrarCardapio();
    }
}


class ItemDoCardapio {

    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}


class ComboLeblanc extends ItemDoCardapio {

    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}


class CafeLeblanc {

    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        this.cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        this.cardapio.add(item);
        System.out.println("[Cardapio] Item adicionado: " + item.getNome());
    }

    public void mostrarCardapio() {
        System.out.println("\n--- Cardapio do Leblanc ---");

        for (ItemDoCardapio item : cardapio) {
            System.out.println("- " + item.getNome() + ": " + item.precoFinal() + " ienes");
        }
    }
}
