class CreatePlayers < ActiveRecord::Migration
  def change
    #drop_table :players
    create_table :players do |t|
      t.integer :player_id, :options => 'PRIMARY KEY'
      t.integer :team_id
      t.string :player_first_name
      t.string :player_last_name
      t.integer :player_position
      t.integer :player_uniform_number

      t.timestamps
    end
  end
end
