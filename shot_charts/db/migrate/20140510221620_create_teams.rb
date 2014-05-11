class CreateTeams < ActiveRecord::Migration
  def change
    drop_table :teams
    create_table :teams do |t|
      t.integer :team_id, :options => 'PRIMARY KEY'
      t.string :team_alias
      t.string :team_name
      t.string :team_mascot
      t.string :team_div
      t.string :team_conf

      t.timestamps
    end
  end
end
