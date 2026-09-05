#!/usr/bin/env ruby

require_relative 'conta'
require_relative 'lojista'
require_relative 'usuario'
require_relative 'authorize_fake'
require_relative 'saldo_insuficiente_error'


joao = Usuario.create("João", "123.456.789-00", "joao@email.com", "senha123", 1000.0)

Brama = Lojista.create("Brama", "987.654.321-00", "brama@email.com", "senha456", 500.0)


# negado = AuthorizeFake.new(false)
# joao.transferir(negado, 100, Brama)

autorizado = AuthorizeFake.new(true)

# begin
#   joao.transferir(autorizado, 999999, Brama)
# rescue ZeroDivisionError => e
#   puts "capturei"
# end

# puts "cheguei aqui?"
# 

usuario1 = Usuario.create("A", "112.776.000S-00", "AAAAA@x.com", "s", 100)
usuario2 = Usuario.create("A", "100.446.700-00", "AAAA@xadadada.com", "s", 1000)



puts "\n--- Dados dos Usuários Criados ---"
puts "Nome: #{joao.nome} | CPF: #{joao.cpf} | Email: #{joao.email} | Saldo: #{joao.saldo}"
puts "Nome: #{usuario1.nome} | CPF: #{usuario1.cpf} | Email: #{usuario1.email} | Saldo: #{usuario1.saldo}"
puts "Nome: #{usuario2.nome} | CPF: #{usuario2.cpf} | Email: #{usuario2.email} | Saldo: #{usuario2.saldo}"

puts "\n--- Dados dos Lojistas Criados ---"
puts "Nome: #{Brama.nome} | CPF: #{Brama.cpf} | Email: #{Brama.email} | Saldo: #{Brama.saldo}"
