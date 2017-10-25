class AddImageToHome < ActiveRecord::Migration[5.1]
  def change
    add_column :homes, :image_data, :text
  end
end
