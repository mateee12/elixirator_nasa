# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FuelConsumption::Directives::Launch do
  it 'consumption for launch from earth' do
    directive = described_class.new(earth_gravity)
    expect(directive.process(apollo_11_mass)).to eq(19_772)
  end

  it 'consumption for launch from moon' do
    directive = described_class.new(moon_gravity)
    expect(directive.process(apollo_11_mass)).to eq(2024)
  end
end
