#language:pt

  @TesteGet
  Funcionalidade: Validar json

    Cenario: Buscar informacoes de um estabelecimento
      Dado que possuo o endpoint para consulta
      Quando realizo a consulta
      Entao o status code e '200'
      E valido se o campo 'typeOfEstablishment' existe
      E retorno aleatoriamente o valor da chave 'typeOfEstablishment'