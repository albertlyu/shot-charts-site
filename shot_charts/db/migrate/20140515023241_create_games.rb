class CreateGames < ActiveRecord::Migration
  def change
    create_table :games, id: false do |t|
      t.primary_key :game_id
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
