class AddFirstnameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string
  end
end
