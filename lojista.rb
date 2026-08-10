#!/usr/bin/env ruby

require_relative 'conta'

class Lojista < Conta
  
      def Receber(valor, remetente)
        @saldo += valor
        puts "Recebimento de R$#{valor} realizado com sucesso de #{remetente.nome}."
      end
  

end
