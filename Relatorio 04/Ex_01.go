// Crie uma função chamada
// ValidarCodigoRastreio(codigo string) (bool, string).
// O código de rastreio de um pacote só será aceito
// se possuir exatamente 10 caracteres.
// Se tiver exatamente 10 caracteres, a função
// deve retornar true e a mensagem "Código de
// rastreio registrado no sistema!".
// Caso contrário, deve retornar false e a
// mensagem "Erro: O código de rastreio deve ter
// exatamente 10 caracteres.".
// Na main, utilize um laço for para solicitar o código
// ao usuário repetidamente até que a função
// retorne true. A cada tentativa inválida, exiba a
// mensagem de erro retornada pela função.

package main

import "fmt"

// Recebe o codigo digitado, retorna se ele e valido e a mensagem do sistema
func ValidarCodigoRastreio(codigo string) (bool, string) {
	if len(codigo) == 10 {
		return true, "Codigo de rastreio registrado no sistema!"
	}
	return false, "Erro: O codigo de rastreio deve ter exatamente 10 caracteres."
}

func main() {
	var codigo string

	for {
		fmt.Print("Digite o codigo de rastreio: ")
		fmt.Scanln(&codigo)

		valido, mensagem := ValidarCodigoRastreio(codigo)
		fmt.Println(mensagem)

		if valido {
			break
		}
	}
}
