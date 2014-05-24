class InsertDetailsRecords < ActiveRecord::Migration
  def up
  	execute "INSERT INTO details(id, detail_desc)
  		VALUES
  			(-1, 'Unknown'),
  			(1, 'Jump Shot'),
  			(2, 'Hook Shot'),
  			(3, 'Tip Shot'),
  			(4, 'Layup Shot'),
  			(5, 'Dunk Shot');"
  end
  def down
  	execute "TRUNCATE details;"
  end
end
