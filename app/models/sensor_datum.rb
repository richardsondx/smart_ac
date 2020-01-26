class SensorDatum < ApplicationRecord
  belongs_to :device
  before_create :add_unit

  CATEGORIES = %w(
    air_humidity
    carbon_monoxide_lvl
    temperature
  ).freeze

  def self.record_data(category: nil, value: nil)
    return false unless CATEGORIES.include? category
    create!(type: category.camelcase, value: value)
  end

  def add_unit
    self.unit = self.default_unit
  end
end
