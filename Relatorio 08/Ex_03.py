# Cenário: Em Persona 5, um grupo de estudantes chamado Phantom Thieves invade
# Palácios: mundos criados a partir do coração de pessoas corruptas, cada um
# conhecido pelo nome do seu dono (ex.: o Palácio de Kamoshida). O líder do grupo, de
# codinome Joker, luta com a sua Persona, uma criatura que nasce de dentro dele e só
# existe enquanto ele existir (composição). Ao longo da história, ele recruta aliados:
# colegas que já existiam antes de entrar no grupo e continuam existindo fora dele
# (agregação).
# Tarefa:
# 1. Crie a classe Persona, com nome e arcano e o método invocar(), que exibe os dois
#    dados.
# 2. Crie a classe Aliado, com nome (nome real) e codinome.
# 3. Crie a classe Lider, que representa o Joker, com:
#    codinome;
#    uma Persona criada dentro do __init__, com nome "Arsène" e arcano "Louco";
#    uma lista _equipe que começa vazia.
# 4. Em Lider, crie os métodos:
#    recrutar(aliado: Aliado), que adiciona o aliado à _equipe;
#    infiltrar(palacio), que recebe o nome do dono do Palácio, exibe o Palácio
#    invadido, invoca a Persona e lista a equipe.
# 5. Na main, crie aliados antes do líder. Depois, crie o líder com codinome, recrute os
#    dois e chame infiltrar("").
# 6. Explique, em um comentário no código, o que é composição e o que é agregação
#    no seu programa.


class Persona:

    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona! {self.nome} (Arcano: {self.arcano}) foi invocada!")


class Aliado:

    def __init__(self, nome: str, codinome: str):
        self.nome = nome
        self.codinome = codinome


# Composição: a Persona (Arsène) é criada dentro do __init__ do Lider, nasce junto com
# o Joker e só existe enquanto ele existir. Se o Lider deixar de existir, a Persona vai
# junto, porque ninguém fora dele guarda essa Persona.
# Agregação: os Aliados (Ryuji e Ann) são criados no main antes do Lider e só depois
# são recrutados. A _equipe guarda apenas uma referência para eles, então eles já
# existiam antes de entrar no grupo e continuam existindo fora dele.
class Lider:

    def __init__(self, codinome: str):
        self.codinome = codinome
        self.persona = Persona("Arsene", "Louco")
        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"-> {aliado.nome} entrou para os Phantom Thieves como {aliado.codinome}.")

    def infiltrar(self, palacio):
        print(f"\n--- {self.codinome} invadiu o Palacio de {palacio} ---")
        self.persona.invocar()
        print(f"Equipe ({len(self._equipe)} aliados):")
        for aliado in self._equipe:
            print(f"- {aliado.codinome} ({aliado.nome})")


if __name__ == "__main__":
    print("--- Phantom Thieves ---")

    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")

    joker.recrutar(ryuji)
    joker.recrutar(ann)

    joker.infiltrar("Kamoshida")
