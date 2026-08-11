#!/usr/bin/env ruby

class AuthorizeHttp
  
  URL = URI('https://util.devi.tools/api/v2/authorize')


  def autorizado?

    response = Net::HTTP.get(URL)

        if response.code == '200'
          return JSON.parse(response.body).dig('data', 'authorization') == true
        end
      rescue OpenSSL::SSL::SSLError, SocketError, JSON::ParserError => e
        puts "Não foi possível consultar a autorização: #{e.class}"
        false
      end
  
  end
