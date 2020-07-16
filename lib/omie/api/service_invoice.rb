# frozen_string_literal: true

module Omie
  module API
    class ServiceInvoice < Base
      def list(data)
        conn.post("servicos/nfse/", { call: "ListarNFSEs", param: [data] })
      end
    end
  end
end
