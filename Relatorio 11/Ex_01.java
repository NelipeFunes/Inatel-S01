// Cenário: Em O Castelo Animado, filme do Studio Ghibli, um castelo mágico anda sozinho pelos
// campos, movido por um demônio do fogo que vive na lareira. Lá moram magos e o próprio demônio,
// e todo morador sabe se apresentar, cada um do seu jeito. Não existe um "morador genérico": todo
// morador é de um tipo específico.
// Tarefa:
// 1. Crie a classe abstrata Morador:
//    atributo private String nome, recebido no construtor;
//    getter public String getNome();
//    método abstrato public abstract void apresentar();.
// 2. Crie a classe Mago, que herda de Morador:
//    atributo private String feitico;
//    construtor Mago(String nome, String feitico), que repassa o nome com super(nome);
//    sobrescreva apresentar() com @Override, imprimindo o nome (use getNome()) e o feitiço.
// 3. Crie a classe DemonioDoFogo, que herda de Morador:
//    construtor DemonioDoFogo(String nome), que repassa o nome com super(nome);
//    sobrescreva apresentar() com @Override, imprimindo o nome e que ele faz o
//    castelo andar.
// 4. Na main, crie um Mago e um DemonioDoFogo, à sua escolha, guardando os dois em
//    variáveis do tipo Morador. Chame apresentar() nos dois.
// 5. Tente criar um objeto Morador diretamente no main e observe o erro: o programa nem
//    chega a compilar. Depois, transforme essa linha em comentário (//) para o programa
//    voltar a rodar.

public class Ex_01 {
    public static void main(String[] args) {
        Morador howl = new Mago("Howl", "Transformacao em passaro");
        Morador calcifer = new DemonioDoFogo("Calcifer");

        System.out.println("--- Moradores do Castelo Animado ---");

        howl.apresentar();
        calcifer.apresentar();

        // Morador sophie = new Morador("Sophie");
    }
}


abstract class Morador {

    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}


class Mago extends Morador {

    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("<" + getNome() + "> Sou um mago e meu feitico favorito e: " + feitico + ".");
    }
}


class DemonioDoFogo extends Morador {

    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("<" + getNome() + "> Sou um demonio do fogo e faco o castelo andar!");
    }
}
