require_relative 'conta'
require_relative 'notificationservice'
require_relative 'authorize_fake'
require_relative 'authorize_http'

class Usuario < Conta
  
  def transferir(autoriza, valor, destinatario)

      if valor <= 0
        puts "Valor de transferência inválido. Deve ser maior que zero."
        return
      end

      return puts "Saldo insuficiente." if valor > saldo 
      
    unless autoriza.autorizado?
      puts "Transferência não autorizada."
      return 
    end
         @saldo -= valor
          destinatario.receber(valor)
          puts "Transferência de R$#{valor} realizada com sucesso para #{destinatario.nome}."
        
    

  end



end