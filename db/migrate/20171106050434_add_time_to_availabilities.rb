class AddTimeToAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :availabilities, :date, :date
    add_column :availabilities, :start_time, :time
    add_column :availabilities, :end_time, :time
  end
end
