class CarbonMonoxideLvl < SensorDatum
  UNIT = 'PPM'.freeze

  def default_unit
    UNIT
  end
end