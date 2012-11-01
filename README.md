republica_virtual
=================

Busca de CEP através do site Republica Virtual


## Instalação
adicione a gem no seu arquivo Gemfile:

**Exemplo:**

`gem "republica_virtual"`

## Como utilizar
`RepublicaVirtual::pesquisa_cep("00000-000")`
ou
`RepublicaVirtual::pesquisa_cep("00000000")`


Sera retornado um objeto com os seguintes atributos:
* sucesso - em caso de true a operação foi realizada com sucesso, e false caso o CEP não seja encontrado.
* endereco - Endereço completo, Ex. Av. Brasil, Rua Natal.
* bairro
* cidade
* estado - UF do estado