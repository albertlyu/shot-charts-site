class CreatePlayers < ActiveRecord::Migration
  def change
  	drop_table :players
    create_table :players do |t|
      t.integer :player_id, :options => 'PRIMARY KEY'
      t.string :player_first_name
      t.string :player_last_name
      t.integer :player_team_id

      t.timestamps
    end
  end
end
