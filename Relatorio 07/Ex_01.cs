// Cenário: Em O Senhor dos Anéis, durante o cerco a Minas Tirith, cada combatente
// convocado é registrado com nome, povo e posto. Alguns chegam armados, outros
// não.
// Tarefa:
// 1. Crie a classe CombatenteDeGondor com as propriedades Nome, Povo e Posto,
//    todas com private set e preenchidas pelo construtor.
// 2. Crie a propriedade Armamento, com private set e valor inicial "Desarmado", e o
//    método Equipar(string arma) para alterá-la.
// 3. Crie o método ApresentarUnidade(), que exibe os dados do combatente. O
//    armamento só deve aparecer se for diferente de "Desarmado".
// 4. Na Main, crie três combatentes à sua escolha, equipe pelo menos um e chame
//    ApresentarUnidade() em todos.
// 5. Tente alterar o Posto de um combatente na Main, observe o erro e comente a linha.

using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");

        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Cerco a Minas Tirith ===");

        CombatenteDeGondor aragorn = new CombatenteDeGondor("Aragorn", "Dunedain", "Capitao");
        CombatenteDeGondor gimli = new CombatenteDeGondor("Gimli", "Anao", "Guerreiro");
        CombatenteDeGondor pippin = new CombatenteDeGondor("Pippin", "Hobbit", "Guarda da Cidadela");

        aragorn.Equipar("Anduril");
        gimli.Equipar("Machado de Batalha");

        aragorn.ApresentarUnidade();
        gimli.ApresentarUnidade();
        pippin.ApresentarUnidade();

        // pippin.Posto = "Capitao";
    }
}
