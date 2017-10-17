class AddLastnameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lastname, :string
  end
end
