class CreateTeamgames < ActiveRecord::Migration
  def change
    #drop_table :teamgames
    create_table :teamgames do |t|
      t.integer :game_id, :options => 'PRIMARY KEY'
      t.integer :team_id, :options => 'PRIMARY KEY'
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
      t.integer :technical_fouls
      t.integer :minutes

      t.timestamps
    end
  end
end
