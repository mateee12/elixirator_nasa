# frozen_string_literal: true

module FuelConsumption
  module Directives
    class CumulativeBase < Base
      def process(mass)
        partial_consumption = calculate_iteration(mass)

        if partial_consumption.positive?
          @total_consumption += partial_consumption
          process(partial_consumption)
        end

        total_consumption
      end

      private

      def calculate_iteration(mass)
        # :nocov:
        raise NotImplementedError
        # :nocov:
      end
    end
  end
end
