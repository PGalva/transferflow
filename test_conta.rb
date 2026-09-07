#!/usr/bin/env ruby

require_relative 'conta'
require 'minitest/autorun'
require_relative 'usuario'


class TestConta < Minitest::Test 

def test_to_centavos
cents = Conta.new("Teste", "123.456.789-00","a@x.com", "s", 10.0)
cents1 = cents.send(:to_centavos, 10.0)

assert_equal 1000, cents1

end

  def test_create
  create1 = Conta.create("A", "123.456.789-00", "a@x.com", "s", 100)
  create2 = Conta.create("B", "12345678900", "b@x.com", "s", 100)

  assert_nil create2

  end

  def test_transferir

end