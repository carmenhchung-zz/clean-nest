class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.string :listing_name
      t.string :home_type
      t.text :address
      t.text :instructions
      t.integer :hours
      t.integer :hourly_rate
      t.boolean :supplies_provided
      t.text :image_data
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
