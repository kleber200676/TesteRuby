# frozen_string_literal: true

Dado('que possuo o endpoint para consulta') do
  @url = 'https://portal.vr.com.br/api-web/comum/enumerations/typeOfEstablishment'
end

Quando('realizo a consulta') do
  @response = HTTParty.get(@url, verify: false)
end

Entao('o status code e {string}') do |status_code|
  expect(@response.code).eql? status_code
end

Entao('valido se o campo {string} existe') do |string|
  expect(@response.body).to match(/#{string}/)
end

Entao('retorno aleatoriamente o valor da chave {string}') do |string|

  @array = [] # Instancializo o array.

  response_typeOfEstablishment = JSON.parse(@response.body)

  response_typeOfEstablishment[string.to_s].each do |recipe|

    @array.push(recipe)

  end

  puts "Retornando aleatoriamente os dados do #{string} => #{@array.sample}"

end
