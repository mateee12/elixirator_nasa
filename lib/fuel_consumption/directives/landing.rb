# frozen_string_literal: true

module FuelConsumption
  module Directives
    class Landing < CumulativeBase
      attr_reader :gravity

      def initialize(gravity)
        super
        @gravity = gravity
      end

      private

      def calculate_iteration(mass)
        (mass * gravity * BigDecimal('0.033') - BigDecimal('42')).floor
      end
    end
  end
end
