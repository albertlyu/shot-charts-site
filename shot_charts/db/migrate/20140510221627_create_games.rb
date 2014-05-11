class CreateGames < ActiveRecord::Migration
  def change
    drop_table :games
    create_table :games do |t|
      t.integer :game_id, :options => 'PRIMARY KEY'
      t.date :date
      t.integer :year
      t.integer :home_team_id
      t.integer :away_team_id
      t.string :venue_name
      t.string :venue_city
      t.string :venue_state

      t.timestamps
    end
  end
end
