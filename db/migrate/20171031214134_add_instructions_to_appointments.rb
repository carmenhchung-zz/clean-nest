class AddInstructionsToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :instructions, :text
  end
end
