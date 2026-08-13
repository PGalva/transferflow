require_relative 'conta'
require_relative 'notificationservice'
require 'json'
require 'net/http'
require 'authorizeFake'
require 'AuthorizeHttp'

class Usuario < Conta
  
  def transferir(autoriza, valor, destinatario)
      
    unless autoriza.autorizado?
      puts "Transferência não autorizada."
      return 
    end
    
    if saldo >= valor
          @saldo -= valor
          destinatario.receber(valor)
          puts "Transferência de R$#{valor} realizada com sucesso para #{destinatario.nome}."
      else
        puts "Saldo insuficiente para realizar a transferência."
      end
    

  end



end