#!/usr/bin/env ruby
require_relative 'conta'
require_relative 'notificationservice'
require_relative 'authorize_fake'
require_relative 'authorize_http'
require_relative 'usuario'

class Lojista < Conta


  def lojista_transferencia

    transfer = transferir 

    if transfer
      raise LojistaTransferError, "Sem permissao para transferencia"
    end

  end
end
