class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.date :date_time
      t.string :location
      t.integer :gameweek
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
