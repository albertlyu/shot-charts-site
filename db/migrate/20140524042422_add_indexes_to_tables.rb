class AddIndexesToTables < ActiveRecord::Migration
  def change
  	add_index :games, :home_team_id
  	add_index :games, :away_team_id

  	add_index :players, :team_id

  	add_index :plays, :game_id
  	add_index :plays, :player_id_1
  	add_index :plays, :team_id_1

  	add_index :player_games, :player_id
  	add_index :player_games, :team_id
  	add_index :player_games, :game_id

  	add_index :shots, :play_id
  	add_index :shots, :player_id
  	add_index :shots, :team_id
  	add_index :shots, :game_id
  	add_index :shots, :detail_id
  	add_index :shots, :zone_id
  end
end