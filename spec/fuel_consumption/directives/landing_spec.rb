# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FuelConsumption::Directives::Landing do
  it 'consumption for landing on earth' do
    directive = described_class.new(earth_gravity)
    expect(directive.process(apollo_11_mass)).to eq(13_447)
  end

  it 'consumption for landing on mars' do
    directive = described_class.new(mars_gravity)
    expect(directive.process(apollo_11_mass)).to eq(3874)
  end
end
