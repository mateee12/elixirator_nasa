# frozen_string_literal: true

module FuelConsumption
  class Pipeline
    DIRECTIVE_BY_NAME = {
      launch: Directives::Launch,
      land: Directives::Landing
    }.freeze

    attr_reader :directives

    def initialize(directives)
      @directives = directives.reverse
    end

    def process(input_mass)
      directives.reduce(0) do |consumption, directive|
        consumption + directive.process(input_mass + consumption)
      end
    end
  end
end
