# frozen_string_literal: true

require 'spec_helper'

require_relative root_join 'app'

RSpec.describe App do
  describe 'calculate_consumption' do
    subject { described_class.new.invoke(:calculate_consumption, [], input_mass:, directive: directives) }

    let(:input_mass) { 28_801 }
    let(:directives) do
      [
        ['launch', earth_gravity.to_s],
        ['land', moon_gravity.to_s],
        ['launch', moon_gravity.to_s],
        ['land', earth_gravity.to_s]
      ]
    end

    it '#construct_directives initialize directive instances' do
      result_directives = described_class.new.send(:construct_directives, directives)

      launch_directive = result_directives[0]
      expect(launch_directive).to be_kind_of(FuelConsumption::Directives::Launch)
      expect(launch_directive.gravity).to eq(earth_gravity)

      land_directive = result_directives[1]
      expect(land_directive).to be_kind_of(FuelConsumption::Directives::Landing)
      expect(land_directive.gravity).to eq(moon_gravity)
    end

    it 'calculate fuel consumption of Apollo 11 mission' do
      expect { subject }.to output(/\b51898\b/).to_stdout
    end
  end
end
