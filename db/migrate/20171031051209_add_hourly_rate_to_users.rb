class AddHourlyRateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :hourly_rate, :integer
  end
end
