class CreatePlayerBasicStats < ActiveRecord::Migration
  def change
    create_table :player_basic_stats, id: false do |t|
      t.primary_key :player_id
      t.integer :team_id
      t.integer :games_played
      t.integer :sum_field_goals_att
      t.float :points_per_game
      t.float :rebounds_per_game
      t.float :assists_per_game
      t.float :steals_per_game
      t.float :blocks_per_game
      t.float :turnovers_per_game
      t.float :minutes_per_game
      t.float :field_goals_pct
      t.float :free_throws_pct
      t.float :three_point_field_goals_pct
      t.float :effective_field_goals_pct
      t.float :points_per_40_minutes
      t.float :rebounds_per_40_minutes
      t.float :assists_per_40_minutes
      t.float :steals_per_40_minutes
      t.float :blocks_per_40_minutes
      t.float :turnovers_per_40_minutes

      t.timestamps
    end
  end
end
