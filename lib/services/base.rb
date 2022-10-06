# frozen_string_literal: true

module Services
  class Base
    def execute
      # :nocov:
      raise NotImplementedError
      # :nocov:
    end
  end
end
