class Availability < ApplicationRecord
  belongs_to :user

  def add_customer_id
  add_reference(:availabilities, :customer, foreign_key: { to_table: :users })
  end
  
end
