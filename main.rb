#!/usr/bin/env ruby

require_relative 'conta'
require_relative 'lojista'
require_relative 'usuario'
require_relative 'authorize_fake'


joao = Usuario.create("João", "123.456.789-00", "joao@email.com", "senha123", 1000.0)

Brama = Lojista.create("Brama", "987.654.321-00", "brama@email.com", "senha456", 500.0)


negado = AuthorizeFake.new(false)
joao.transferir(negado, 100, Brama)

autorizado = AuthorizeFake.new(true)

joao.transferir(autorizado, 100, Brama)    # sucesso
joao.transferir(autorizado, -500, Brama)   # valor inválido
joao.transferir(autorizado, 0, Brama)      # valor inválido
joao.transferir(autorizado, 999999, Brama) # saldo insuficiente