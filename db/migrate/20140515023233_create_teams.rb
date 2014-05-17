class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, id: false do |t|
      t.primary_key :team_id
      t.string :team_alias
      t.string :team_name
      t.string :team_mascot
      t.string :team_div
      t.string :team_conf

      t.timestamps
    end
  end
end
