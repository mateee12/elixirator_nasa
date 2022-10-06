# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FuelConsumption::Pipeline do
  describe 'total fuel consumption' do
    subject { described_class.new(directives).process(input_mass) }

    let(:directives) {}
    let(:input_mass) {}

    context 'with apollo 11 mission' do
      let(:directives) do
        [
          FuelConsumption::Directives::Launch.new(earth_gravity),
          FuelConsumption::Directives::Landing.new(moon_gravity),
          FuelConsumption::Directives::Launch.new(moon_gravity),
          FuelConsumption::Directives::Landing.new(earth_gravity)
        ]
      end
      let(:input_mass) { apollo_11_mass }

      it { is_expected.to eq(51_898) }
    end

    context 'with mission to Mars' do
      let(:directives) do
        [
          FuelConsumption::Directives::Launch.new(earth_gravity),
          FuelConsumption::Directives::Landing.new(mars_gravity),
          FuelConsumption::Directives::Launch.new(mars_gravity),
          FuelConsumption::Directives::Landing.new(earth_gravity)
        ]
      end
      let(:input_mass) { 14_606 }

      it { is_expected.to eq(33_388) }
    end

    context 'with mission to in solar system' do
      let(:directives) do
        [
          FuelConsumption::Directives::Launch.new(earth_gravity),
          FuelConsumption::Directives::Landing.new(moon_gravity),
          FuelConsumption::Directives::Launch.new(moon_gravity),
          FuelConsumption::Directives::Landing.new(mars_gravity),
          FuelConsumption::Directives::Launch.new(mars_gravity),
          FuelConsumption::Directives::Landing.new(earth_gravity)
        ]
      end
      let(:input_mass) { 75_432 }

      it { is_expected.to eq(212_161) }
    end
  end
end
