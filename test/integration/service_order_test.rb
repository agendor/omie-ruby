# frozen_string_literal: true

require "test_helper"
require "support/config/vcr"

class ServiceOrderTest < Minitest::Test
  def setup
    @client = Omie::Client.new(
      app_key: "38333295000",
      app_secret: "4cea520a0e2a2ecdc267b75d3424a0ed"
    )
  end

  def test_service_order_create
    VCR.use_cassette("integration/service_order/create") do
      data = {
        "Cabecalho" => {
          "cCodIntOS" => "99999",
          "cEtapa" => "20",
          "dDtPrevisao" => "01/07/2020",
          "nCodCli" => 2_485_994,
          "nQtdeParc" => 7
        },
        "Departamentos" => [],
        "Email" => {
          "cEnvBoleto" => "N",
          "cEnvLink" => "N",
          "cEnviarPara" => "ajuda@omie.com.br"
        },
        "InformacoesAdicionais" => {
          "cCidPrestServ" => "SAO PAULO (SP)",
          "cCodCateg" => "1.01.02",
          "cDadosAdicNF" => "OS incluida via API de teste 15287",
          "nCodCC" => 11_850_365
        },
        "ServicosPrestados" => [
          {
            "cCodServLC116" => "7.07",
            "cCodServMun" => "01015",
            "cDadosAdicItem" => "Serviços prestados",
            "cDescServ" => "Serviço prestado 001",
            "cRetemISS" => "N",
            "cTribServ" => "01",
            "impostos" => {
              "cFixarCOFINS" => "",
              "cFixarCSLL" => "",
              "cFixarIRRF" => "",
              "cFixarISS" => "",
              "cFixarPIS" => "",
              "nAliqCOFINS" => 0,
              "nAliqCSLL" => 0,
              "nAliqIRRF" => 0,
              "nAliqISS" => 3,
              "nAliqPIS" => 0,
              "nBaseISS" => 100,
              "nTotDeducao" => 0,
              "nValorCOFINS" => 0,
              "nValorCSLL" => 0,
              "nValorIRRF" => 0,
              "nValorISS" => 3,
              "nValorPIS" => 0
            },
            "nQtde" => 3,
            "nValUnit" => 1000
          }
        ]
      }

      response = @client.service_order.create(data)

      assert response.success?
      assert_equal "Ordem de Serviço cadastrado com sucesso!",
        response.body["cDescStatus"]
    end
  end

  def test_service_order_create_invoice
    VCR.use_cassette("integration/service_order/create_invoice") do
      data = { "cCodIntOS" => "1593622040" }
      response = @client.service_order.create_invoice(data)

      assert response.success?
    end
  end

  def test_service_order_cancel_invoice
    VCR.use_cassette("integration/service_order/cancel_invoice") do
      data = { "cCodIntOS" => "1593622040" }

      response = @client.service_order.cancel_invoice(data)

      assert response.success?
      assert_equal "Ordem de Serviço cancelada com sucesso!",
        response.body["cDescStatus"]
    end
  end
end
