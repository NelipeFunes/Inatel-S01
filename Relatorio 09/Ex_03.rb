# Cenário: Em Steins;Gate, um grupo de amigos mantém o Laboratório de Gadgets do Futuro, um
# pequeno laboratório de invenções em Tóquio. A invenção mais importante do grupo é o PhoneWave,
# um micro-ondas ligado a um celular que, por acidente, envia mensagens de texto para o passado. O
# aparelho foi montado dentro do laboratório e só existe nele (composição). Os membros do
# laboratório já eram pessoas comuns antes de entrar no grupo e continuam existindo fora dele
# (agregação).
# Tarefa:
# 1. Crie a classe PhoneWave, com o método enviar_dmail(mensagem), que imprime a mensagem e
#    avisa que ela foi enviada para o passado.
# 2. Crie a classe MembroDoLab, cujo initialize recebe numero (o número de Lab Mem) e nome, os
#    dois com attr_reader.
# 3. Crie a classe LaboratorioDeGadgets, cujo initialize não recebe parâmetros e:
#    cria um PhoneWave dentro dele, guardado em @phonewave;
#    cria o array @membros vazio.
# 4. Em LaboratorioDeGadgets, crie os métodos:
#    admitir(membro), que adiciona um membro já criado ao @membros e imprime o número e o
#    nome dele;
#    experimento(mensagem), que imprime, com .each, o número e o nome de cada membro
#    presente e depois envia a mensagem pelo enviar_dmail do PhoneWave guardado em
#    @phonewave.
# 5. No main, crie dois membros antes do laboratório, à sua escolha. Depois, crie o laboratório, admita
#    os dois e chame experimento(...) com uma mensagem à sua escolha.
# 6. Explique, em um comentário no código, o que é composição e o que é agregação no seu
#    programa.


class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail: #{mensagem}"
    puts "O PhoneWave enviou a mensagem para o passado!"
  end
end


class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end


# Composição: o PhoneWave é criado dentro do initialize do LaboratorioDeGadgets e fica
# guardado em @phonewave. Ele nasce junto com o laboratório e só existe nele: se o
# laboratório deixar de existir, o PhoneWave vai junto, porque ninguém fora dele o guarda.
# Agregação: os MembroDoLab (Okabe e Mayuri) são criados no main antes do laboratório e
# só depois são admitidos. O @membros guarda apenas uma referência para eles, então eles
# já existiam antes de entrar no grupo e continuam existindo fora dele.
class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero}: #{membro.nome} foi admitido no laboratorio."
  end

  def experimento(mensagem)
    puts "\n--- Experimento no Laboratorio de Gadgets do Futuro ---"
    puts "Membros presentes:"

    @membros.each do |membro|
      puts "Lab Mem #{membro.numero}: #{membro.nome}"
    end

    @phonewave.enviar_dmail(mensagem)
  end
end


puts "--- Laboratorio de Gadgets do Futuro ---"

okabe = MembroDoLab.new(1, "Rintaro Okabe")
mayuri = MembroDoLab.new(2, "Mayuri Shiina")

laboratorio = LaboratorioDeGadgets.new

laboratorio.admitir(okabe)
laboratorio.admitir(mayuri)

laboratorio.experimento("Nao coloque a banana no PhoneWave!")
