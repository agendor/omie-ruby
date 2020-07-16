# frozen_string_literal: true

module Omie
  module API
    class Base
      def initialize(conn)
        @conn = conn
      end

      private

      attr_reader :conn
    end
  end
end
