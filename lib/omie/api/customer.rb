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
    end
  end
end
