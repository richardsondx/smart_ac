# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Device.create!(
  serial_number: '123456789',
  registration_date: '2019',
  firmware_version: '1'
)

Device.create!(
  serial_number: '123456790',
  registration_date: '2019',
  firmware_version: '2'
)

Device.create!(
  serial_number: '123456791',
  registration_date: '2019',
  firmware_version: '3'
)


10.times do |device|
  Device.all.sample.sensor_data.record_data(
    category: SensorDatum::CATEGORIES.sample,
    value: rand(100)
  )
end