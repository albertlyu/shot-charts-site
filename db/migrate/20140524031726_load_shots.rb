class LoadShots < ActiveRecord::Migration
  def up
    execute "INSERT INTO shots(play_id,player_id,team_id,game_id,half,details,points_type,distance,x_coord,y_coord,detail_id,zone_id,made)
		SELECT p.id AS play_id
			,p.player_id_1 AS player_id
			,p.team_id_1 AS team_id
			,p.game_id
			,p.half
			,p.details
			,p.points_type
			,p.distance
			,p.x_coord
			,p.y_coord
			,CASE WHEN p.detail_desc = 'Jump Shot' THEN 1
				WHEN p.detail_desc = 'Hook Shot' THEN 2
				WHEN p.detail_desc = 'Tip Shot' THEN 3
				WHEN p.detail_desc = 'Layup Shot' THEN 4
				WHEN p.detail_desc = 'Dunk Shot' THEN 5
				ELSE -1 END AS detail_id
			,CASE WHEN p.x_coord = 0 AND p.y_coord = 0 THEN 15
				WHEN p.x_coord < -15 AND p.y_coord < 10 AND p.points_type = 3 THEN 1
				WHEN p.x_coord < -6 AND p.y_coord >= 10 AND p.points_type = 3 THEN 2
				WHEN p.x_coord >= -6 AND p.x_coord < 6 AND p.points_type = 3 THEN 3
				WHEN p.x_coord >= 6 AND p.y_coord >= 10 AND p.points_type = 3 THEN 4
				WHEN p.x_coord >= 15 AND p.y_coord < 10 AND p.points_type = 3 THEN 5
				WHEN p.x_coord < -6 AND p.y_coord < 5 AND p.points_type = 2 THEN 6
				WHEN p.x_coord < -6 AND p.y_coord >= 5 AND p.points_type = 2 THEN 7
				WHEN p.x_coord >= -6 AND p.x_coord < 6 AND p.y_coord >= 15 AND p.points_type = 2 THEN 8
				WHEN p.x_coord >= 6 AND p.y_coord >= 5 AND p.points_type = 2 THEN 9
				WHEN p.x_coord >= 6 AND p.y_coord < 5 AND p.points_type = 2 THEN 10
				WHEN p.x_coord >= -6 AND p.x_coord < 0 AND p.y_coord >= 5 AND p.y_coord < 15 THEN 11
				WHEN p.x_coord >= 0 AND p.x_coord < 6 AND p.y_coord >= 5 AND p.y_coord < 15 THEN 12
				WHEN p.x_coord >= -6 AND p.x_coord < 0 AND p.y_coord < 5 THEN 13
				WHEN p.x_coord >= 0 AND p.x_coord < 6 AND p.y_coord < 5 THEN 14
				ELSE -1 END AS zone_id
			,CASE WHEN p.event_desc = 'Field Goal Made' THEN TRUE
				WHEN p.event_desc = 'Field Goal Missed' THEN FALSE
				END AS made		
		FROM plays p
		WHERE x_coord IS NOT NULL;"
  end

  def down
    execute "TRUNCATE shots;"
  end
end
