class Device < ApplicationRecord
  has_many :sensor_data
  has_many :health_status
  validates_uniqueness_of :serial_number

  def status
    health_status.last.try(:name)
  end
end
