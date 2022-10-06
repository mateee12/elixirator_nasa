# frozen_string_literal: true

module FuelConsumption
  module Directives
    class Launch < CumulativeBase
      attr_reader :gravity

      def initialize(gravity)
        super
        @gravity = gravity
      end

      private

      def calculate_iteration(mass)
        (mass * gravity * BigDecimal('0.042') - BigDecimal('33')).floor
      end
    end
  end
end
