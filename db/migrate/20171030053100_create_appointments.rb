class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :home, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :hours
      t.integer :hourly_rate
      t.integer :total_price

      t.timestamps
    end
  end
end
