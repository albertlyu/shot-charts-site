class InsertZonesRecords < ActiveRecord::Migration
  def up
  	execute "INSERT INTO zones(id, zone_desc)
  		VALUES
  			(-1, 'Unknown'),
  			(1, 'Right Corner 3'),
  			(2, 'Right Wing 3'),
  			(3, 'Straight-Up 3'),
  			(4, 'Left Wing 3'),
  			(5, 'Left Corner 3'),
  			(6, 'Right Baseline 2'),
  			(7, 'Right Wing 2'),
  			(8, 'Straight-Up 2'),
  			(9, 'Left Wing 2'),
  			(10, 'Left Baseline 2'),
  			(11, 'Right High Paint'),
  			(12, 'Left High Paint'),
  			(13, 'Right Low Paint'),
  			(14, 'Left Low Paint'),
  			(15, 'At-Rim');"
  end
  def down
  	execute "TRUNCATE zones;"
  end
end
