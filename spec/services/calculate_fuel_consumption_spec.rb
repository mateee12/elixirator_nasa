# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Services::CalculateFuelConsumption do
  subject { described_class.new(mass, directives).execute }

  let(:mass) { 28_801 }
  let(:directives) do
    [
      FuelConsumption::Directives::Launch.new(earth_gravity),
      FuelConsumption::Directives::Landing.new(moon_gravity),
      FuelConsumption::Directives::Launch.new(moon_gravity),
      FuelConsumption::Directives::Landing.new(earth_gravity)
    ]
  end

  it 'initialize fuel consumption pipeline and process result' do
    expect(subject).to eq(51_898)
  end
end
