#!/usr/bin/env ruby


require 'json'
require 'net/http'

  uri =URI('https://util.devi.tools/api/v1/notify') #URI significa o endereço da API de notificação para onde a requisição POST será enviada
  response = Net::HTTP.get_response(uri) #faz a requisição POST para enviar a notificação
  
  puts "Status: #{response.code}" #imprime o status da requisição
  puts "body: #{response.body}" #imprime a resposta da API
  puts "parsed: #{JSON.parse(response.body)}" #imprime a resposta da API convertida para um hash Ruby

