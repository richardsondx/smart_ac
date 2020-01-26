class CreateSensorData < ActiveRecord::Migration[6.0]
  def change
    create_table :sensor_data do |t|
      t.references :device, null: false, foreign_key: true
      t.string :type
      t.string :unit
      t.string :value

      t.timestamps
    end
  end
end
