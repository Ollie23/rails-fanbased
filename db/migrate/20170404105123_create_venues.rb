class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :rating
      t.time :close
      t.integer :screens
      t.boolean :internet
      t.string :food
      t.integer :price_range

      t.timestamps
    end
  end
end
