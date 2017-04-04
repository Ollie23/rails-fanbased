class AddTeamsToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :home_team_id, :integer
    add_column :games, :away_team_id, :integer

    add_foreign_key :games, :teams, column: "home_team_id"
    add_foreign_key :games, :teams, column: "away_team_id"
    add_index :games, :home_team_id
    add_index :games, :away_team_id
  end
end
