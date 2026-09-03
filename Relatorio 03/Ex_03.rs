// Crie uma função chamada fn
// imprimir_terminados_em(digito: i32,
// limite_inferior: i32, limite_superior: i32).
// Esta função deve receber três números inteiros e
// não retornar nenhum valor.
// Dentro da função, use um laço for para iterar de
// limite_inferior até limite_superior (inclusive). Em
// cada iteração, imprima o número apenas se o seu
// último dígito for igual ao digito informado (dica:
// você pode obter o último dígito de um número
// positivo usando o operador de resto numero % 10).
// Na main, peça ao usuário para digitar:
// O dígito final desejado (de 0 a 9).
// O limite inferior.
// O limite superior.
// Em seguida, chame a função
// imprimir_terminados_em passando os três
// valores fornecidos.

use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    for numero in limite_inferior..=limite_superior {
        if numero % 10 == digito {
            println!("{}", numero);
        }
    }
}

fn main() {
    let mut entrada = String::new();

    println!("Digite o digito final desejado (0 a 9): ");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler digito final");
    let digito: i32 = entrada.trim().parse().unwrap_or(0);
    entrada.clear();
    
    println!("Digite o limite inferior: ");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler limite inferior");
    let limite_inferior: i32 = entrada.trim().parse().unwrap_or(0);
    entrada.clear();
    
    println!("Digite o limite superior: ");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler limite superior");
    let limite_superior: i32 = entrada.trim().parse().unwrap_or(0);

    println!("Numeros terminados em {} entre {} e {}:", digito, limite_inferior, limite_superior);
    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
