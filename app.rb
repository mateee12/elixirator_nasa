#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'loader'
require 'thor'
require 'bigdecimal'

class App < Thor
  package_name 'App'

  DIRECTIVE_BY_NAME = {
    launch: FuelConsumption::Directives::Launch,
    land: FuelConsumption::Directives::Landing
  }.freeze
  DIRECTIVE_OPTIONS = DIRECTIVE_BY_NAME.keys.map(&:to_s).join(', ')

  desc 'calculate_consumption',
       "calculate fuel consumption for space mission\n"\
       'example: `calculate_consumption -m 28801 -d launch 9.807 -d land 1.62`'
  method_option :input_mass, type: :numeric, required: true, aliases: '-m', banner: 'MASS'
  method_option :directive, type: :array, required: true, repeatable: true,
                            aliases: '-d', banner: 'DIRECTIVE ARG1 ARG2',
                            desc: "Repeatable, name of directive and its arguments\n"\
                                  "\tDIRECTIVE enum: (#{DIRECTIVE_OPTIONS})\n"\
                                  "\texample: launch 9.807"
  def calculate_consumption
    input_mass = options[:input_mass]
    directives = construct_directives(options[:directive])

    service = Services::CalculateFuelConsumption.new(input_mass, directives)
    puts service.execute
  end

  default_command :calculate_consumption

  private

  def directive_class(directive_name)
    DIRECTIVE_BY_NAME[directive_name.to_sym]
  end

  def directive_arguments(directive_args)
    directive_args.map { |arg| BigDecimal(arg) }
  end

  def construct_directives(input_directives)
    @directives = input_directives.map do |directive_name, *directive_args|
      klass = directive_class(directive_name)
      args = directive_arguments(directive_args)
      klass.new(*args)
    end
  end
end

App.start(ARGV)
