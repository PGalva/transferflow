  #!/usr/bin/env ruby

  require = 'json'
  require 'net/http'

class Conta
    attr_accessor :nome, :cpf, :email, :senha, :saldo
    

    
    def initialize(nome, cpf, email, senha, saldo)
      @nome = nome
      @cpf = cpf
      @email = email
      @senha = senha
      @saldo = saldo
    end

        def self.create(nome, cpf, email, senha, saldo)
          ja_existe = @@email_exists ||= []
          cpf_existe = @@cpf_exists ||= []

            if ja_existe.include?(email)
              puts "Email já cadastrado"
            return nil
            end

            if cpf_existe.include?(cpf)
          puts "CPF já cadastrado"
            return nil
          end

          ja_existe << email
          cpf_existe << cpf

          new(nome, cpf, email, senha)
        
        if saldo < 0
          puts "Saldo inicial não pode ser negativo."
          return nil
        end
      end
  private



  def receber(valor)

    @saldo += valor

    
    uri = URI('https://util.devi.tools/api/v1/notify')
    
    corpo_da_mensagem = { 
      message: "Você recebeu um pagamento de R$#{valor}!",
      destinatario: self.email 
    }.to_json

    response = Net::HTTP.post(
      uri, 
      corpo_da_mensagem, 
      "Content-Type" => "application/json"
    )

    if response.code == "200" || response.code == "204"
      puts "Notificação enviada com sucesso para #{@nome}!"
    else
      puts "Alerta: Falha ao enviar notificação (Status: #{response.code})"
    end
  end

end