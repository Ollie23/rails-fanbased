class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :venue, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
