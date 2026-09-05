    #!/usr/bin/env ruby

    require 'json'
    require 'net/http'
  class Conta
      attr_accessor :nome, :cpf, :email, :senha, :saldo
      

      
      def initialize(nome, cpf, email, senha, saldo) # metodo de instancia
        @nome = nome
        @cpf = self.normalize_cpf(cpf)
        @email = self.normalize_email(email)
        @senha = senha
        @saldo = to_centavos(saldo)
      end


          def self.create(nome, cpf, email, senha, saldo) # metodo de classe

            ja_existe = @@email_exists ||= []
            cpf_existe = @@cpf_exists ||= []

              if ja_existe.include?(self.normalize_email(email))
                puts "Email já cadastrado"
              return nil
              end

              if cpf_existe.include?(self.normalize_cpf(cpf))
            puts "CPF já cadastrado"
              return nil
              end

            if saldo < 0
              puts "Saldo inicial não pode ser negativo."
              return nil
            end

            ja_existe << self.normalize_email(email)
            cpf_existe << self.normalize_cpf(cpf)

            

    
        
          
          new(nome, cpf, email, senha, saldo)
        end



    def receber(valor)   
    @saldo += valor  
    
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
