# frozen_string_literal: true

require 'simplecov'
require 'bigdecimal'
require_relative 'calculation_helper'

SimpleCov.start

def root
  Dir.pwd
end

def root_join(*path)
  "#{root}/#{path.join('/')}"
end

require_relative root_join 'loader'

RSpec.configure do |config|
  config.include CalculationHelper
end
