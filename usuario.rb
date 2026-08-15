require_relative 'conta'
require_relative 'notificationservice'
require_relative 'authorize_fake'
require_relative 'authorize_http'

class Usuario < Conta
  
  def transferir(autoriza, valor, destinatario)
      
    unless autoriza.autorizado?
      puts "Transferência não autorizada."
      return 
    end
    
    if @saldo >= valor
          @saldo -= valor
          destinatario.receber(valor)
          puts "Transferência de R$#{valor} realizada com sucesso para #{destinatario.nome}."
      else
        puts "Saldo insuficiente para realizar a transferência."
      end
    

  end



end