class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :home, foreign_key: true
      t.datetime :date
      t.datetime :time
      t.integer :hours
      t.integer :hourly_price
      t.integer :total

      t.timestamps
    end
  end
end
