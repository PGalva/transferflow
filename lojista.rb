#!/usr/bin/env ruby
require_relative 'conta'
require_relative 'notificationservice'
require_relative 'authorize_http'
require_relative 'usuario'

class Lojista < Conta


  def lojista_transferencia(*)
      raise LojistaTransferError, "Sem permissao para transferencia"
    end


end
