# Cenário: Em Cyberpunk 2077, o Afterlife é o bar mais famoso de Night City, uma
# metrópole futurista, e é frequentado por mercenários. O cardápio tem coquetéis comuns
# e drinks que homenageiam lendas. Todo drink tem um nome, que nunca muda, e um
# preço, que o bar pode reajustar dentro da tabela da casa.
# Tarefa:
# 1. Crie a classe CoquetelAfterlife, cujo initialize recebe nome e preco:
#    nome pode ser lido de fora, mas não alterado (use attr_reader);
#    o preço fica guardado em @_preco, sem attr_reader, e o initialize atribui o valor
#    recebido diretamente a ele.
# 2. Em CoquetelAfterlife, crie o getter manual preco e o setter manual preco=(valor). O
#    setter só aceita valores de 5 a 200. Fora dessa faixa, ele exibe "Preço inválido!" e
#    mantém o valor anterior.
# 3. Ainda em CoquetelAfterlife, crie o método ficha, que retorna (não imprime) um texto
#    com o nome e o preço do drink.
# 4. Crie a classe filha DrinkDeLenda, com o atributo exclusivo lenda (com attr_reader):
#    o initialize recebe nome, preco e lenda e repassa os dois primeiros ao pai com
#    super(nome, preco);
#    sobrescreva ficha, reaproveitando o texto do pai com super e acrescentando a lenda
#    homenageada.
# 5. Na main, crie um array com um CoquetelAfterlife e dois DrinkDeLenda, à sua escolha, e
#    percorra-o com .each, imprimindo a ficha de cada drink. Depois, tente definir, com o
#    setter, o preço de um dos drinks de lenda como 500 e depois como 80, e imprima a ficha
#    dele de novo.
# 6. Tente alterar o nome de um dos drinks diretamente no main (objeto.nome = ...) e observe
#    o erro. Depois, transforme essa linha em comentário (#) para o programa voltar a rodar.


class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preco invalido!"
    end
  end

  def ficha
    "#{nome} | Preco: #{@_preco} eurodolares"
  end
end


class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    super + " | Homenagem a: #{@lenda}"
  end
end


puts "--- Cardapio do Afterlife ---"

margarita = CoquetelAfterlife.new("Margarita", 15)
dose_do_jackie = DrinkDeLenda.new("Dose do Jackie", 40, "Jackie Welles")
tequila_do_johnny = DrinkDeLenda.new("Tequila do Johnny", 60, "Johnny Silverhand")

cardapio = [margarita, dose_do_jackie, tequila_do_johnny]

cardapio.each do |drink|
  puts drink.ficha
end

puts "\n--- Reajuste de preco ---"
puts "Tentando definir o preco da #{tequila_do_johnny.nome} como 500..."
tequila_do_johnny.preco = 500
puts "Tentando definir o preco da #{tequila_do_johnny.nome} como 80..."
tequila_do_johnny.preco = 80

puts "\n--- Ficha atualizada ---"
puts tequila_do_johnny.ficha

# dose_do_jackie.nome = "Dose do V"
