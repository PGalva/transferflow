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

end