# frozen_string_literal: true

require "test_helper"
require "support/config/vcr"

class ServiceInvoiceTest < Minitest::Test
  def setup
    @client = Omie::Client.new(
      app_key: "38333295000",
      app_secret: "4cea520a0e2a2ecdc267b75d3424a0ed"
    )
  end

  def test_service_invoice_list
    VCR.use_cassette("integration/service_invoice/list") do
      data = {
        "nPagina" => 1,
        "nRegPorPagina" => 20,
        "nCodigoOS" => 2_553_368
      }

      response = @client.service_invoice.list(data)

      assert response.success?
      assert_equal 1, response.body["nRegistros"]
    end
  end
end
