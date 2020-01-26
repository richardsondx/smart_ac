class AirHumidity < SensorDatum
  UNIT = 'percentage'.freeze

  def default_unit
    UNIT
  end
end