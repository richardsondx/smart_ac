class AirHumidity < SensorDatum
  UNIT = 'Percent'.freeze

  def default_unit
    UNIT
  end
end