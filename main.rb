#!/usr/bin/env ruby

require_relative 'conta'
require_relative 'notificationservice'
require_relative 'saldo'
require_relative 'lojista'
require_relative 'authorizeFake'
require_relative 'usuario'



joao = Usuario.create("João", "123.456.789-00", "joao@email.com", "senha123", 1000.0)