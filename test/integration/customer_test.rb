# frozen_string_literal: true

require "test_helper"
require "support/config/vcr"

class CustomerTest < Minitest::Test
  def setup
    @client = Omie::Client.new(
      app_key: "38333295000",
      app_secret: "4cea520a0e2a2ecdc267b75d3424a0ed"
    )
  end

  def test_customer_upsert
    VCR.use_cassette("integration/customer/upsert") do
      data = {
        "codigo_cliente_integracao" => "CodigoInterno0001",
        "email" => "primeiro@cliente.com.br",
        "nome_fantasia" => "Primeiro Cliente",
        "razao_social" => "Primeiro Cliente  Ltda Me"
      }

      response = @client.customer.upsert(data)

      assert response.success?
      assert_equal 447_708_994, response.body["codigo_cliente_omie"]
    end
  end

  def test_customer_batch_upsert
    VCR.use_cassette("integration/customer/batch_upsert") do
      data = [
        {
          "codigo_cliente_integracao" => "CodigoInterno0001",
          "email" => "primeiro@cliente.com.br",
          "nome_fantasia" => "Primeiro Cliente",
          "razao_social" => "Primeiro Cliente  Ltda Me"
        },
        {
          "codigo_cliente_integracao" => "CodigoInterno0002",
          "email" => "segundo@cliente.com.br",
          "nome_fantasia" => "Segundo Cliente",
          "razao_social" => "Segundo Cliente  Ltda Me"
        }
      ]

      response = @client.customer.batch_upsert(data)

      assert response.success?
      assert_equal "Ok!", response.body["descricao_status"]
    end
  end
end
