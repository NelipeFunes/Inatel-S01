// Faça um programa em Go que leia 3 valores inteiros
// representando a quantidade de vendas efetuadas por
// um vendedor em 3 trimestres consecutivos.
// Primeiro, verifique se a soma total das vendas
// atinge o mínimo exigido pela empresa (pelo menos
// 100 unidades no total).
// Caso a soma seja menor que 100, exiba a
// mensagem de erro: "Meta mínima anual não
// atingida!".
// Caso atinja a meta mínima, utilize um laço switch
// (sem expressão) para classificar o bônus do
// vendedor com base na soma total:
// Categoria Top Seller: soma maior ou igual a 250
// unidades.
// Categoria Sênior: soma entre 180 e 249
// unidades.
// Categoria Pleno: soma entre 100 e 179 unidades.

package main

import "fmt"

func main() {
	var trimestre1 int
	var trimestre2 int
	var trimestre3 int

	fmt.Print("Digite as vendas do 1o trimestre: ")
	fmt.Scanln(&trimestre1)

	fmt.Print("Digite as vendas do 2o trimestre: ")
	fmt.Scanln(&trimestre2)

	fmt.Print("Digite as vendas do 3o trimestre: ")
	fmt.Scanln(&trimestre3)

	total := trimestre1 + trimestre2 + trimestre3

	if total < 100 {
		fmt.Println("Meta minima anual nao atingida!")
	} else {
		fmt.Printf("Total de vendas: %d unidades\n", total)

		switch {
		case total >= 250:
			fmt.Println("Classificacao: Categoria Top Seller")
		case total >= 180:
			fmt.Println("Classificacao: Categoria Senior")
		default:
			fmt.Println("Classificacao: Categoria Pleno")
		}
	}
}
