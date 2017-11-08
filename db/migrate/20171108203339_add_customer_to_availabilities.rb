class AddCustomerToAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :availabilities, :customer_id, :integer
  end
end
