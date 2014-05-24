class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :detail_desc

      t.timestamps
    end
  end
end
