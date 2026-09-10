// Crie uma função chamada func gerarEscalaPlantao(n
// int).
// - Um sistema de TI precisa organizar uma escala de
// plantão técnico que ocorre a cada 4 dias, iniciando no
// dia 1 do mês.
// - A função deve receber a quantidade de plantões
// desejada (n int) e usar um laço for para calcular e
// exibir os dias do mês em que os plantões
// acontecerão (ex: 1º plantão no Dia 1, 2º plantão no Dia
// 5, 3º plantão no Dia 9, e assim por diante).
// - Na main, peça ao usuário para digitar a quantidade
// de plantões que deseja gerar e chame a função
// gerarEscalaPlantao.

package main

import "fmt"

func gerarEscalaPlantao(n int) {
	fmt.Println("--- Escala de Plantao Tecnico ---")

	dia := 1

	for plantao := 1; plantao <= n; plantao++ {
		fmt.Printf("Plantao %d: Dia %d do mes\n", plantao, dia)

		dia = dia + 4
	}
}

func main() {
	var quantidade int

	fmt.Print("Digite a quantidade de plantoes necessarios: ")
	fmt.Scanln(&quantidade)

	gerarEscalaPlantao(quantidade)
}
