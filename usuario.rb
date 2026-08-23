require_relative 'conta'
require_relative 'notificationservice'
require_relative 'authorize_fake'
require_relative 'authorize_http'

class Usuario < Conta
  
  def transferir(autoriza, valor, destinatario)

    cents = to_centavos(valor)

      if cents <= 0
        puts "Valor de transferência inválido. Deve ser maior que zero."
        return
      end
      
      if cents > saldo 
      raise "Saldo insuficiente." 
      
    unless autoriza.autorizado?
      puts "Transferência não autorizada."
      return 
    end
         @saldo -= cents
          destinatario.receber(cents)
          puts "Transferência de R$#{valor} realizada com sucesso para #{destinatario.nome}."
        
    

  end



end