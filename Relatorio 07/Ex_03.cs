// Cenário: A elfa Frieren carrega um grimório especial criado junto com ela
// (composição) e viaja com companheiros que encontrou ao longo da jornada,
// existindo antes de conhecê-la (agregação).
// Tarefa:
// 1. Crie a classe Grimorio com a propriedade FeiticoFavorito (valor inicial
//    "Nenhum") e o método Abrir(), que a exibe.
// 2. Crie a classe Companheiro com Nome e Funcao e o método Apresentar().
// 3. Crie a classe Maga com:
//    Nome e um Grimorio criado dentro do construtor (Composição);
//    uma lista privada de Companheiro, o método Recrutar(Companheiro c)
//    (Agregação) e o método MostrarGrupo().
// 4. Na Main, crie dois companheiros antes da Maga, crie a Maga, recrute-os,
//    defina o feitiço favorito do grimório e chame MostrarGrupo() e Abrir().
// 5. Explique, em um comentário no código, o que é composição e o que é
//    agregação no seu programa.

using System;
using System.Collections.Generic;

public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine($"\nO grimorio foi aberto. Feitico favorito: {FeiticoFavorito}");
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public Companheiro(string nome, string funcao)
    {
        this.Nome = nome;
        this.Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"{Nome} - {Funcao}");
    }
}

// Composição: o Grimorio é criado dentro do construtor da Maga, nasce junto com ela
// e não existe fora dela. Se a Maga deixar de existir, o grimório vai junto.
// Agregação: os Companheiros são criados na Main antes da Maga e só depois são
// recrutados. A Maga guarda apenas uma referência para eles, então eles continuam
// existindo independentemente dela.
public class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; set; }

    private List<Companheiro> _companheiros;

    public Maga(string nome)
    {
        this.Nome = nome;
        this.Grimorio = new Grimorio();
        this._companheiros = new List<Companheiro>();
    }

    public void Recrutar(Companheiro c)
    {
        this._companheiros.Add(c);
        Console.WriteLine($"{c.Nome} entrou para o grupo de {Nome}.");
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\nGrupo de {Nome} ({_companheiros.Count} companheiros):");

        foreach (var companheiro in _companheiros)
        {
            companheiro.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== A Jornada de Frieren ===");

        Companheiro fern = new Companheiro("Fern", "Maga aprendiz");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        frieren.Grimorio.FeiticoFavorito = "Magia para fazer flores brotarem";

        frieren.MostrarGrupo();
        frieren.Grimorio.Abrir();
    }
}
