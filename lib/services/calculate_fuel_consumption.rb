# frozen_string_literal: true

module Services
  class CalculateFuelConsumption < Base
    attr_reader :input_mass, :pipeline

    def initialize(input_mass, directives)
      @input_mass = input_mass
      @pipeline = FuelConsumption::Pipeline.new(directives)
    end

    def execute
      pipeline.process(input_mass)
    end
  end
end
