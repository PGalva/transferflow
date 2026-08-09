require 'net/http'
require 'json'

uri =URI('https://util.devi.tools/api/v1/notify') #URI significa o endereço da API de notificação para onde a requisição POST será enviada
content = JSON.generate({ destinatario: destinatario, mensagem: mensagem }) #gera o conteúdo da mensagem em formato JSON para enviar na requisição POST
response = NET::HTTP.post(uri, content, "Content-Type" => "application/json") #faz a requisição POST para enviar a notificação

class NotificationService < Conta
  def enviar_notificacao(destinatario, mensagem)
    if saldo >= 0 && response.code == '200'
      puts "Notificação enviada para #{destinatario}: #{mensagem}"
    else
      puts "Falha ao enviar notificação para #{destinatario}, status: #{response.code}"
      
    end
  end
  

def receber_notificacao(valor)

 if  @saldo += valor 
    uri = URI('https://util.devi.tools/api/v1/notify')
    
    corpo_da_mensagem = { 
      message: "Você recebeu um pagamento de R$#{valor}!",
      destinatario: self.email 
    }.to_json

    response = Net::HTTP.post(    #faz a requisição POST para enviar a notificação
      uri, 
      corpo_da_mensagem, 
      "Content-Type" => "application/json" #define o tipo de conteúdo como JSON
    )

    if response.code == "200" || response.code == "204"
      puts "Notificação enviada com sucesso para #{@nome}!"
    else
      puts "Alerta: Falha ao enviar notificação (Status: #{response.code})"
    end
  end

end

end