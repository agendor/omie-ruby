# frozen_string_literal: true

module Omie
  module API
    class Customer < Base
      def upsert(data)
        conn.post("geral/clientes/", { call: "UpsertCliente", param: [data] })
      end

      def batch_upsert(data, part: 1)
        conn.post(
          "geral/clientes/",
          {
            call: "UpsertClientesPorLote",
            param: [
              clientes_cadastro: data,
              lote: part
            ]
          }
        )
      end

      # rubocop:disable Naming/AccessorMethodName
      def set_integration_id(data)
        conn.post(
          "geral/clientes/",
          { call: "AssociarCodIntCliente", param: [data] }
        )
      end
      # rubocop:enable Naming/AccessorMethodName
    end
  end
end
