class CreateHealthStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :health_statuses do |t|
      t.references :device, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
