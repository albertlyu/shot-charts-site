class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :play_id
      t.integer :player_id
      t.integer :team_id
      t.integer :game_id
      t.integer :half
      t.string :details
      t.integer :points_type
      t.integer :distance
      t.float :x_coord
      t.float :y_coord
      t.integer :detail_id
      t.integer :zone_id
      t.boolean :made

      t.timestamps
    end
  end
end
