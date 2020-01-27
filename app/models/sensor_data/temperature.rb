class Temperature < SensorDatum
  UNIT = 'Celcius'.freeze

  def default_unit
    UNIT
  end
end