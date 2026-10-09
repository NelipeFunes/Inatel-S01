// Cenário: No mundo Pokémon, numa batalha de exibição, cada Pokémon entra em campo e
// ataca do seu jeito: os do Tipo Planta usam um golpe próprio, os do Tipo Elétrico atacam
// normalmente e depois soltam uma descarga, e os sem tipo definido usam um ataque
// comum.
// Tarefa:
// 1. Crie a classe base Pokemon com Especie e Nivel (recebidos no construtor) e o método
//    virtual Atacar(), com um ataque genérico.
// 2. Crie as classes TipoPlanta e TipoEletrico, que herdam de Pokemon.
// 3. Em TipoPlanta, sobrescreva Atacar() sem chamar o pai. Em TipoEletrico, sobrescreva
//    Atacar() chamando primeiro base.Atacar().
// 4. Na Main, crie uma List<Pokemon> com um Pokémon de cada classe (você escolhe quais)
//    e percorra-a com foreach chamando Atacar().

using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; set; }
    public int Nivel { get; set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) ---");
        Console.WriteLine($"{Especie} usou Investida!");
    }
}

public class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) ---");
        Console.WriteLine($"{Especie} usou Folha Navalha!");
    }
}

public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine($"{Especie} soltou uma Descarga Eletrica!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Batalha de Exibicao ===");

        List<Pokemon> pokemons = new List<Pokemon>();

        pokemons.Add(new Pokemon("Eevee", 15));
        pokemons.Add(new TipoPlanta("Bulbasaur", 12));
        pokemons.Add(new TipoEletrico("Pikachu", 20));

        foreach (var pokemon in pokemons)
        {
            pokemon.Atacar();
        }
    }
}
