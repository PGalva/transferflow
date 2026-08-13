require 'net/http'
require 'json'

class NotificationService

  uri =URI('https://util.devi.tools/api/v1/notify') #URI significa o endereço da API de notificação para onde a requisição POST será enviada

  def enviar_notificacao(destinatario, mensagem)

    content = JSON.generate({ destinatario: destinatario, mensagem: mensagem }) #gera o conteúdo da mensagem em formato JSON para enviar na requisição POST
    response = Net::HTTP.post(uri, content, "Content-Type" => "application/json") #faz a requisição POST para enviar a notificação



      if saldo >= 0 && response.code == '200'
        puts "Notificação enviada para #{destinatario}: #{mensagem}"
      else
        puts "Falha ao enviar notificação para #{destinatario}, status: #{response.code}"
        
      end
  end
  


end