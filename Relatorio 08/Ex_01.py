# Cenário: Em Dark Souls, todo morto-vivo carrega almas e Frascos de Estus, que se
# recarregam nas fogueiras e nunca passam de 10. Os clérigos, além disso, conhecem um
# milagre próprio.
# Tarefa:
# 1. Crie a classe MortoVivo, cujo __init__ recebe e inicializa nome (público), _almas
#    (protegido) e __estus (privado).
# 2. Crie os métodos get_estus() e set_estus(quantidade). O setter só aceita valores de
#    0 a 10. Fora dessa faixa, ele exibe "Quantidade de Estus inválida!" e mantém o valor
#    anterior.
# 3. Crie o método mostrar_status(), que retorna um texto com os três dados (ex.: "Morto-
#    vivo Petrus | Almas: 2000 | Estus: 5").
# 4. Crie a classe filha Clerigo, com o atributo exclusivo milagre. Inicialize a parte herdada
#    com super().__init__(...) e sobrescreva mostrar_status(), reaproveitando o texto do pai
#    com super().mostrar_status().
# 5. No main, crie um Clerigo e exiba o status. Tente definir o Estus como 15 e depois como
#    10 e exiba o status de novo.
# 6. Tente imprimir o __estus do clérigo diretamente no main, observe o erro e comente a
#    linha.


class MortoVivo:

    def __init__(self, nome: str, almas: int, estus: int):
        self.nome = nome
        self._almas = almas
        self.__estus = estus

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus invalida!")

    def mostrar_status(self):
        return f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"


class Clerigo(MortoVivo):

    def __init__(self, nome: str, almas: int, estus: int, milagre: str):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    def mostrar_status(self):
        return super().mostrar_status() + f" | Milagre: {self.milagre}"


if __name__ == "__main__":
    print("--- Fogueira de Firelink ---")

    petrus = Clerigo("Petrus", 2000, 5, "Cura")

    print("\n--- Status Inicial ---")
    print(petrus.mostrar_status())

    print("\n--- Descansando na fogueira ---")
    print("Tentando definir o Estus como 15...")
    petrus.set_estus(15)
    print("Tentando definir o Estus como 10...")
    petrus.set_estus(10)

    print("\n--- Status Final ---")
    print(petrus.mostrar_status())

    # print(petrus.__estus)
