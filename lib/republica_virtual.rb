#encoding: UTF-8

# BUSCA DE CEP UTILIZANDO O SITE REPUBLICA VIRTUAL
# http://republicavirtual.com.br/cep

module RepublicaVirtual

  class Retorno
    attr_accessor :sucesso, :endereco, :bairro, :cidade, :estado
  end

  def self.pesquisa_cep(cep)
    if(valida_cep(cep))
      busca(cep)
    else
      raise("O #{cep} informado não é valido.")
    end
  end

  private
  def self.busca (cep)
    require "net/http"
    require "uri"
    require "nokogiri"

    url = URI.parse("http://cep.republicavirtual.com.br")
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.get("/web_cep.php?cep=#{cep}&formato=xml")
    }
    res = Nokogiri::XML(res.body)
    retorno = Retorno.new
    if !res.xpath("//logradouro").text.to_s.empty?
      retorno.sucesso = true
      retorno.endereco = res.xpath("//tipo_logradouro").text+" "+res.xpath("//logradouro").text
      retorno.bairro = res.xpath("//bairro").text
      retorno.cidade = res.xpath("//cidade").text
      retorno.estado  = res.xpath("//uf").text
    else
      retorno.sucesso = false
    end
    retorno
  end

  def self.valida_cep(cep)
    cep = cep.to_s.gsub("-","")
    return cep.to_i.to_s.length == 8
  end

end
