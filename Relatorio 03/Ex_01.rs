// Crie uma função chamada fn validar_placa(placa:
// &str) -> bool.
// A função deve retornar true apenas se a string
// enviada atender a todos os seguintes critérios:
// Ter pelo menos 7 caracteres de comprimento.
// Conter pelo menos 4 letras maiúsculas
// (c.is_ascii_uppercase()).
// Conter pelo menos 2 números (c.is_numeric()).
// Na main, peça ao usuário para digitar a placa de
// um veículo. Use a estrutura loop (com break) para
// continuar pedindo a placa até que a função
// validar_placa retorne true.
// Quando uma placa válida for informada, exiba a
// mensagem "Placa cadastrada no sistema!" e saia
// do laço.
// Dica: Lembre-se de remover a quebra de linha \n
// da leitura do teclado usando .trim()

use std::io;

fn validar_placa(placa: &str) ->bool {
    let mut maiusculas = 0;
    let mut numeros = 0;
    let tamanho = placa.len() >= 7;

    for l in placa.chars() {
        if l.is_ascii_uppercase() {
            maiusculas += 1;
            continue;
        }

        if l.is_numeric() {
            numeros += 1;
        }
    }
    tamanho && maiusculas >= 4 && numeros >= 2
}

fn main() {
    let mut entrada = String::new();
    loop {
        println!("Digite a placa do veiculo: ");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler placa do veiculo");

        let placa = entrada.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente.")
        }
        entrada.clear();
    }
}