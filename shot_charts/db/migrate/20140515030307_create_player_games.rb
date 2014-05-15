class CreatePlayerGames < ActiveRecord::Migration
  def change
    create_table :player_games do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :team_id
      t.string :player_first_name
      t.string :player_last_name
      t.integer :player_position
      t.integer :player_uniform_number
      t.integer :field_goals_made
      t.integer :field_goals_att
      t.float :field_goals_pct
      t.integer :free_throws_made
      t.integer :free_throws_att
      t.float :free_throws_pct
      t.integer :three_point_field_goals_made
      t.integer :three_point_field_goals_att
      t.float :three_point_field_goals_pct
      t.integer :points
      t.integer :rebounds_total
      t.integer :rebounds_off
      t.integer :rebounds_def
      t.integer :assists
      t.integer :steals
      t.integer :blocked_shots
      t.integer :turnovers
      t.integer :personal_fouls
      t.integer :disqualifications
      t.integer :technical_fouls
      t.integer :minutes
      t.boolean :starter

      t.timestamps
    end
  end
end
