#!/usr/bin/env ruby
require_relative 'conta'
require_relative 'notificationservice'
require_relative 'authorize_http'
require_relative 'usuario'
require_relative 'lojista_transfer_error'

class Lojista < Conta


  def transferir(*)
      raise LojistaTransferError, "Sem permissao para transferencia"
    end


end
