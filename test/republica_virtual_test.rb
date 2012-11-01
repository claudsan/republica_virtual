#encoding: UTF-8

require "test/unit"
require "republica_virtual"

class RepublicaVirtualTest < Test::Unit::TestCase

  def test_busca_cep_correto
    retorno = RepublicaVirtual.pesquisa_cep(38400456)
    assert_equal "Uberlândia", retorno.cidade
  end

  def test_busca_cep_gsub
    retorno = RepublicaVirtual.pesquisa_cep("38400-456")
    assert_equal "Uberlândia", retorno.cidade
  end

end

