class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id: false do |t|
      t.primary_key :player_id
      t.integer :team_id
      t.string :player_first_name
      t.string :player_last_name
      t.integer :player_position
      t.integer :player_uniform_number

      t.timestamps
    end
  end
end
