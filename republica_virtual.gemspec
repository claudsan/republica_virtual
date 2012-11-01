$:.push File.expand_path("../lib", __FILE__)

require "republica_virtual/version"

Gem::Specification.new do |s|
  s.name        = "republica_virtual"
  s.version     = RepublicaVirtual::VERSION
  s.description = "Busca de CEP Online"
  s.summary     = "Realiza a busca do cep online, atraves do webservice do site http://republicavirtual.com.br/cep"
  s.author      = "claudsan"
  s.email       = "claudsan@gmail.com"
  s.homepage    = "https://github.com/claudsan/republica_virtual"
  s.files       = Dir["{lib/**/*.rb,README.rdoc,test/**/*.rb,Rakefile,*.gemspec}"]
  s.add_dependency 'nokogiri' unless Proc.new { install_flags('no-nokogiri') }
  s.add_development_dependency "rspec"
end