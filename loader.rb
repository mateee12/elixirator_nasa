# frozen_string_literal: true

require_relative 'lib/fuel_consumption/directives/base'
require_relative 'lib/fuel_consumption/directives/cumulative_base'
require_relative 'lib/fuel_consumption/directives/launch'
require_relative 'lib/fuel_consumption/directives/landing'
require_relative 'lib/fuel_consumption/pipeline'

Dir['lib/services/*.rb'].sort.each do |file|
  require_relative file
end
