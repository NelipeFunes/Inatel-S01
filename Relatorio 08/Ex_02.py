# Cenário: Em Overwatch, todo herói pode usar a sua suprema, mas o efeito depende da
# função. Os suportes, além disso, conseguem curar a equipe.
# Tarefa:
# 1. Crie a classe base HeroiOverwatch, cujo __init__ recebe codinome e funcao, com o
#    método usar_suprema(), que exibe uma suprema genérica.
# 2. Crie as classes filhas HeroiTanque e HeroiSuporte, sem __init__ próprio, e sobrescreva
#    usar_suprema() nas duas.
# 3. Em HeroiSuporte, crie também o método exclusivo curar_equipe().
# 4. Na main, crie uma lista list[HeroiOverwatch] com um herói de cada classe.
# 5. Percorra a lista com for chamando usar_suprema() e, usando isinstance, chame
#    curar_equipe() apenas nos suportes.


class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usa a sua suprema!")


class HeroiTanque(HeroiOverwatch):

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) golpeia o chao com o martelo e DERRUBA todos os inimigos!")


class HeroiSuporte(HeroiOverwatch):

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) ativa a VALQUIRIA e voa sobre o campo de batalha!")

    def curar_equipe(self):
        print(f"<{self.codinome}> cura toda a equipe!")


if __name__ == "__main__":
    print("--- Partida de Overwatch ---")

    soldado = HeroiOverwatch("Soldado: 76", "Dano")
    reinhardt = HeroiTanque("Reinhardt", "Tanque")
    mercy = HeroiSuporte("Mercy", "Suporte")

    equipe: list[HeroiOverwatch] = [soldado, reinhardt, mercy]

    print("\n--- Supremas ---")
    for heroi in equipe:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
