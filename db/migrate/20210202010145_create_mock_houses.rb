class CreateMockHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :mock_houses do |t|
      t.string :address
      t.integer :price
      t.integer :year_built
      t.integer :beds
      t.integer :baths
      t.integer :sqft
      t.integer :hoa_fee
      t.integer :last_tax_amount
      t.string :main_picture
      t.string :url
      t.integer :rent_estimate 
      t.integer :rank_score

      t.timestamps
    end
  end
end
