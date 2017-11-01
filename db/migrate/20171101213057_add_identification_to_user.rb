class AddIdentificationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :identification_data, :text
  end
end
