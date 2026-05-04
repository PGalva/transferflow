#!/usr/bin/env ruby

require = 'json'
require 'net/http'
class Usuario < Conta

  def Transferir(valor, destinatario)
    uri = URI('https://util.devi.tools/api/v2/authorize')
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    
    if @saldo >= valor && data["authorization"] == "true"
      @saldo -= valor
      destinatario.saldo += valor
      puts "Transferência de R$#{valor} realizada com sucesso para #{destinatario.nome}."
    end
    if @saldo < valor || data["authorization"] == "false"
      puts "Saldo insuficiente ou autorização negada para transferência."
    end
  end




end  