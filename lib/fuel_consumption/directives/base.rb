# frozen_string_literal: true

module FuelConsumption
  module Directives
    class Base
      attr_reader :total_consumption

      def initialize(*_)
        @total_consumption = 0
      end

      def process(mass)
        # :nocov:
        raise NotImplementedError
        # :nocov:
      end
    end
  end
end
