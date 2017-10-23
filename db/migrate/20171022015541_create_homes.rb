class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.string :home_type
      t.string :listing_name
      t.text :address
      t.text :instructions
      t.integer :hours
      t.integer :hourly_rate
      t.references :user, foreign_key: true
      t.boolean :supplies_provided

      t.timestamps
    end
  end
end
