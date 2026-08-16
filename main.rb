#!/usr/bin/env ruby

require_relative 'conta'
require_relative 'lojista'
require_relative 'usuario'
require_relative 'authorize_fake'


joao = Usuario.create("João", "123.456.789-00", "joao@email.com", "senha123", 1000.0)

Brama = Lojista.create("Brama", "987.654.321-00", "brama@email.com", "senha456", 500.0)

autorizado = AuthorizeFake.new

joao.transferir(autorizado, 20, Brama)
# joao.transferir(autorizado, 0, Brama)
# joao.transferir(autorizado, 100, Brama)
puts joao.saldo
puts Brama.saldo