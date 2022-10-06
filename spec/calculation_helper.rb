# frozen_string_literal: true

module CalculationHelper
  def earth_gravity
    BigDecimal('9.807')
  end

  def moon_gravity
    BigDecimal('1.62')
  end

  def mars_gravity
    BigDecimal('3.711')
  end

  def apollo_11_mass
    BigDecimal('28801')
  end
end
