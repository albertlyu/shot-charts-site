class CreatePlays < ActiveRecord::Migration
  def change
    #drop_table :plays
    create_table :plays do |t|
      t.integer :game_id
      t.integer :half
      t.integer :time_minutes
      t.integer :time_seconds
      t.string :details
      t.integer :player_id_1
      t.integer :player_id_2
      t.string :player_first_name_1
      t.string :player_first_name_2
      t.string :player_last_name_1
      t.string :player_last_name_2
      t.integer :home_score
      t.integer :visitor_score
      t.integer :visitor_fouls
      t.integer :home_fouls
      t.integer :player_score
      t.integer :points_type
      t.string :detail_desc
      t.string :event_desc
      t.integer :distance
      t.float :x_coord
      t.float :y_coord
      t.integer :team_id_1
      t.integer :team_id_2

      t.timestamps
    end
  end
end
