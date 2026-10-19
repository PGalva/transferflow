class TransferenciaService
  def transferir(valor,transferencia, autoriza)
    
    cents = transferencia.to_centavos(valor)

    if cents <= 0
      puts "Valor de transferência inválido. Deve ser maior que zero."
      return
    end

    if cents > transferencia.saldo 
      raise SaldoInsuficienteError,"Saldo insuficiente." 
    end

    unless autoriza.autorizado?
      puts "Transferência não autorizada."
      return 
    end

    transferencia.saldo -= cents
    transferencia.destinatario.receber(cents)
    transferencia.debitar(cents)
    puts "Transferência de R$#{valor} realizada com sucesso para #{transferencia.destinatario.nome}."
        
  end 

end