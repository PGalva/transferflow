#!/usr/bin/env ruby

require 'json'
require 'net/http'
require 'uri'

class AuthorizeHttp
  
  URL = URI('https://util.devi.tools/api/v2/authorize')


  def autorizado?

    response = Net::HTTP.get_response(URL)

          if response.code == '200'
            return JSON.parse(response.body).dig('data', 'authorization') == true 
          end 

          if response.code != '200' 
            return false
          end

    rescue OpenSSL::SSL::SSLError, SocketError, JSON::ParserError => e
    puts "Não foi possível consultar a autorização: #{e.class}"
    false
  end
    
end
