class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.references :team, foreign_key: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
