# Cenário: Em Cyberpunk, Night City é uma metrópole futurista controlada por grandes
# corporações. Para atacá-las, hackers se organizam em células, grupos que coordenam
# diferentes unidades de rede em um mesmo ataque. Toda unidade segue o mesmo
# protocolo: precisa saber executar uma invasão. Mas cada tipo de unidade faz isso do
# seu jeito. O netrunner usa o seu cyberdeck para quebrar o gelo (ICE) de um servidor. Já
# o drone de vigilância intercepta o sinal da rede.
# Tarefa:
# 1. Interface: crie a classe abstrata IUnidadeDeRede (herdando de ABC), com o método
#    abstrato executar_invasao().
# 2. Parte composta: crie a classe Cyberdeck, com o atributo modelo.
# 3. Implementação com composição: crie a classe OperadorNetrunner, que
#    implementa IUnidadeDeRede:
#    o __init__ recebe nome e o modelo do cyberdeck, e cria o Cyberdeck dentro dele;
#    executar_invasao() exibe o nome do netrunner, o modelo do cyberdeck e que ele
#    está quebrando o gelo (ICE) de um servidor.
# 4. Outra implementação: crie a classe DroneDeVigilancia, que também
#    implementa IUnidadeDeRede:
#    o __init__ recebe codigo, a identificação do drone;
#    executar_invasao() exibe o código do drone e que ele está interceptando
#    o sinal da rede.
# 5. Agregação: crie a classe CelulaHacker:
#    o __init__ recebe nome e uma lista de membros já criados, anotada como
#    list[IUnidadeDeRede];
#    iniciar_ataque() exibe o nome da célula e chama executar_invasao() de
#    cada membro (polimorfismo).
# 6. Na main, crie um netrunner e um drone, junte os dois em uma célula e
#    chame iniciar_ataque().
# 7. Tente criar um objeto IUnidadeDeRede diretamente e observe o erro.
#    Depois, transforme essa linha em comentário (#) para o programa voltar a
#    rodar.

from abc import ABC, abstractmethod


class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:

    def __init__(self, modelo: str):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome: str, modelo_cyberdeck: str):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"<{self.nome}> conecta o cyberdeck {self.cyberdeck.modelo} e esta quebrando o gelo (ICE) de um servidor!")


class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"<Drone {self.codigo}> esta interceptando o sinal da rede!")


class CelulaHacker:

    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self._membros = membros

    def iniciar_ataque(self):
        print(f"\n--- Celula {self.nome} iniciando o ataque ---")
        for membro in self._membros:
            membro.executar_invasao()


if __name__ == "__main__":
    print("--- Night City ---")

    lucy = OperadorNetrunner("Lucy", "Militech Paraline")
    drone = DroneDeVigilancia("DV-077")

    celula = CelulaHacker("Edgerunners", [lucy, drone])
    celula.iniciar_ataque()

    # unidade = IUnidadeDeRede()
