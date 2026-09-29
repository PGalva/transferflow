    #!/usr/bin/env ruby

    require 'json'
    require 'net/http'
    require_relative 'conta_repository'
  class Conta
      attr_accessor :nome, :cpf, :email, :senha, :saldo
      

      
      def initialize(nome, cpf, email, senha, saldo) # metodo de instancia
        @nome = nome
        @cpf = Conta.normalize_cpf(cpf)
        @email = Conta.normalize_email(email)
        @senha = senha
        @saldo = to_centavos(saldo)
      end
          def self.create(nome, cpf, email, senha, saldo, conta_repository) # metodo de classe
            

            if saldo < 0
              puts "Saldo inicial não pode ser negativo."
              return nil
            end 
        
          
         conta = new(nome, cpf, email, senha, saldo)
         if conta_repository.validate?(conta)
         return false
         else
         conta_repository.add(conta)
         return conta
         end
        end



    def receber(valor_em_centavos)   
    @saldo += valor_em_centavos  
    
        puts "Notificação enviada com sucesso para #{@nome}!"
    

    end


    def saldo_em_reais
    saldo / 100.0
    end

      def self.normalize_cpf(cpf)
     cpf = cpf.gsub(/\D/,"") if cpf
    end

     def self.normalize_email(email)
     email = email.downcase if email
    end

  private

    def to_centavos(valor)
    (valor*100).to_i
    end


end
