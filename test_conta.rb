#!/usr/bin/env ruby

require_relative 'conta'
require 'minitest/autorun'
require_relative 'usuario'
require_relative 'lojista'


class TestConta < Minitest::Test 

# def test_to_centavos
# cents = Conta.new("Teste", "123.456.789-00","a@x.com", "s", 10.0)
# cents1 = cents.send(:to_centavos, 10.0)

# assert_equal 1000, cents1

# end

#   def test_create
#   create1 = Conta.create("A", "123.456.789-00", "a@x.com", "s", 100)
#   create2 = Conta.create("B", "12345678900", "b@x.com", "s", 100)

#   assert_nil create2

#   end
  
    # def test_transferir
    # joao = Usuario.create("João", "123.456.789-00", "joao@email.com", "senha123", 1000.0)
    # cotsco = Lojista.create("Cotsco", "987.654.321-00", "cotsco@email.com", "senha123", 1000.0)

    # joao.transferir(AuthorizeFake.new(true), 100, cotsco)

    #  assert_equal 900, joao.saldo_em_reais
    #   assert_equal 1100, cotsco.saldo_em_reais


    # end


    def test_receber
    joao = Usuario.create("João", "123.456.789-00", "joao@email.com", "senha123", 1000.0)
    cotsco = Lojista.create("Cotsco", "987.654.321-00", "cotsco@email.com", "senha123", 1000.0)
     joao.transferir(AuthorizeFake.new(true), 100, cotsco)
    # cotsco.receber(AuthorizeFake.new(true), 100, joao)
    cotsco.receber(100)

    assert_equal 900, joao.saldo_em_reais
    assert_equal 1100, cotsco.saldo_em_reais
    end
end