// Cenário: Em Dandadan, dois estudantes do ensino médio descobrem que fantasmas e alienígenas
// existem de verdade e passam a anotar, em um mapa, os locais da cidade onde cada ser
// sobrenatural foi visto. Alienígenas e espíritos não têm nada em comum, a não ser uma coisa: todos
// se manifestam quando alguém investiga o local.
// Tarefa:
// 1. Interface: crie a interface Sobrenatural, com o método void manifestar();.
// 2. Crie a classe Alienigena, que implementa Sobrenatural:
//    atributo private String nome, recebido no construtor;
//    implemente public void manifestar() com @Override, imprimindo o nome e um
//    comportamento de alienígena à sua escolha.
// 3. Crie a classe EspiritoYoukai, que também implementa Sobrenatural, do mesmo jeito: atributo
//    private String nome, recebido no construtor, e public void manifestar() com um comportamento
//    de espírito à sua escolha.
// 4. Crie a classe MapaDeAvistamentos:
//    atributo private HashMap<String, Sobrenatural> avistamentos, criado vazio no construtor,
//    que não recebe parâmetros; a chave do mapa é o nome do local;
//    método public void registrar(String local, Sobrenatural ser), que guarda o ser no mapa,
//    usando o local como chave;
//    método public void investigar(String local), que busca o local no mapa: se não encontrar nada
//    (null), imprime que o local está tranquilo; se encontrar, chama manifestar() do ser.
// 5. Na main, crie um Alienigena e um EspiritoYoukai, à sua escolha, e registre cada um em um local à
//    sua escolha. Depois, investigue os dois locais e um terceiro local, que não foi registrado.

import java.util.HashMap;

public class Ex_03 {
    public static void main(String[] args) {
        Alienigena serpoian = new Alienigena("Serpoian");
        EspiritoYoukai turboGranny = new EspiritoYoukai("Turbo Granny");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        mapa.registrar("Hospital abandonado", serpoian);
        mapa.registrar("Tunel abandonado", turboGranny);

        mapa.investigar("Hospital abandonado");
        mapa.investigar("Tunel abandonado");
        mapa.investigar("Escola");
    }
}


interface Sobrenatural {
    void manifestar();
}


class Alienigena implements Sobrenatural {

    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("<" + nome + "> desce do disco voador e tenta abduzir todo mundo!");
    }
}


class EspiritoYoukai implements Sobrenatural {

    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("<" + nome + "> surge da escuridao e persegue quem entrou no local!");
    }
}


class MapaDeAvistamentos {

    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        this.avistamentos.put(local, ser);
        System.out.println("[Mapa] Avistamento registrado em: " + local);
    }

    public void investigar(String local) {
        System.out.println("\n--- Investigando: " + local + " ---");

        Sobrenatural ser = this.avistamentos.get(local);

        if (ser == null) {
            System.out.println("O local esta tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}
