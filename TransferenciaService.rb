class TransferenciaService
  def transferir(remetente, valor, destinatario, autoriza)
    
    cents = remetente.to_centavos(valor)

    if cents <= 0
      raise SaldoInvalidoError, "Valor inválido. Deve ser maior que zero."
      return
    end

    if cents > remetente.saldo 
      raise SaldoInsuficienteError,"Saldo insuficiente." 
    end

    unless autoriza.autorizado?
      raise NaoautorizaError, "Transferência não autorizada."
      return 
    end

      remetente.debitar(cents)
    destinatario.receber(cents)
    puts "Transferência de R$#{valor} realizada com sucesso para #{destinatario.nome}."
        
  end 

end