#!/usr/bin/env ruby

require = 'json'
require 'net/http'
class Usuario < Conta

  def Transferir(valor, destinatario)
    uri = URI('https://util.devi.tools/api/v2/authorize') #recebe a resposta da API de autorização para verificar se a transferência pode ser realizada
    response = Net::HTTP.get(uri) #faz a requisição GET para obter a autorização da transferência
    data = JSON.parse(response) #recebe a resposta da API e converte para um hash Ruby
    
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