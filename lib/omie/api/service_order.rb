# frozen_string_literal: true

module Omie
  module API
    class ServiceOrder < Base
      def create(data)
        conn.post("servicos/os/", { call: "IncluirOS", param: [data] })
      end

      def create_invoice(data)
        conn.post("servicos/osp/", { call: "FaturarOS", param: [data] })
      end

      def cancel_invoice(data)
        conn.post("servicos/osp/", { call: "CancelarOS", param: [data] })
      end
    end
  end
end
