// Cenário: No universo de Lovecraft, na Biblioteca da Universidade Miskatonic, um
// pesquisador cataloga relatos de entidades cósmicas. Algumas têm origem conhecida;
// outras, não.
// Tarefa:
// 1. Crie a classe base EntidadeCosmica com Nome e Origem (valor inicial "Desconhecida") e
//    o método virtual Manifestar(), que só exibe a origem se ela for conhecida.
// 2. Crie as classes Profundo e MiGo, que herdam de EntidadeCosmica. Uma sobrescreve
//    Manifestar() sem chamar o pai; a outra chama base.Manifestar() antes.
// 3. Crie a classe Pesquisador com Nome, uma lista privada de EntidadeCosmica, o método
//    Catalogar(EntidadeCosmica e) e o método LerCatalogo().
// 4. Na Main, crie uma entidade de cada classe, defina a origem de pelo menos uma,
//    catalogue todas em um pesquisador e chame LerCatalogo().

using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
    }

    public virtual void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine("Uma presenca indescritivel se manifesta.");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine("Surge das aguas escuras de Innsmouth, coberto de escamas.");
    }
}

public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine("Suas asas membranosas zumbem enquanto carrega cilindros de cerebros.");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }

    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\nCatalogo de {Nome} ({_catalogo.Count} relatos):");

        foreach (var entidade in _catalogo)
        {
            entidade.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Biblioteca da Universidade Miskatonic ===");

        EntidadeCosmica sombra = new EntidadeCosmica("Sombra sem Nome");
        Profundo dagon = new Profundo("Dagon");
        MiGo fungo = new MiGo("Mi-Go");

        fungo.Origem = "Yuggoth";

        Pesquisador armitage = new Pesquisador("Henry Armitage");

        armitage.Catalogar(sombra);
        armitage.Catalogar(dagon);
        armitage.Catalogar(fungo);

        armitage.LerCatalogo();
    }
}
