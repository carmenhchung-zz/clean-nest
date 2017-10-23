class AddMoreFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :gender, :string
    add_column :users, :language, :string
    add_column :users, :location, :text
    add_column :users, :bio, :text
  end
end
