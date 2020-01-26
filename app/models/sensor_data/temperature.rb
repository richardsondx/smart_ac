class Temperature < SensorDatum
  UNIT = 'celcius'.freeze

  def default_unit
    UNIT
  end
end