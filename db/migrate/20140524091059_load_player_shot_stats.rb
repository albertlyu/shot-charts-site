class LoadPlayerShotStats < ActiveRecord::Migration
  def up
  	execute "UPDATE players SET team_id = 86 WHERE player_id = 121908;"
  	execute "UPDATE player_games SET team_id = 86 WHERE player_id = 121908;"
  	execute "UPDATE plays SET team_id_1 = 86 WHERE player_id_1 = 121908;"
  	execute "UPDATE shots SET team_id = 86 WHERE player_id = 121908;"

  	execute "UPDATE players SET team_id = 210 WHERE player_id = 88783;"
  	execute "UPDATE player_games SET team_id = 210 WHERE player_id = 88783;"
  	execute "UPDATE plays SET team_id_1 = 210 WHERE player_id_1 = 88783;"
  	execute "UPDATE shots SET team_id = 210 WHERE player_id = 88783;"

  	execute "UPDATE plays SET player_id_1 = 110394 WHERE player_id_1 = 100000017 AND team_id_1 = 309;"
  	execute "UPDATE shots SET player_id = 110394 WHERE player_id = 100000017 AND team_id = 309;"
	
	execute "UPDATE plays SET player_id_1 = 125449 WHERE player_id_1 = 100000017 AND team_id_1 = 210;"
	execute "UPDATE shots SET player_id = 125449 WHERE player_id = 100000017 AND team_id = 210;"

  	execute "INSERT into player_shot_stats
		SELECT shots.player_id AS player_id
			, shots.team_id AS team_id
			, COUNT(DISTINCT shots.id) AS shots_att
			, SUM(CASE WHEN shots.made = TRUE THEN 1 ELSE 0 END) AS shots_made
			, SUM(CASE WHEN shots.made = TRUE THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS shots_pct
			
			, SUM(CASE WHEN shots.zone_id = 1 THEN 1 ELSE 0 END) AS right_corner_3_att
			, SUM(CASE WHEN shots.zone_id = 1 AND shots.made = TRUE THEN 1 ELSE 0 END) AS right_corner_3_made
			, SUM(CASE WHEN shots.zone_id = 1 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS right_corner_3_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 1 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 1 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 1 THEN 1 ELSE 0 END)::float END AS right_corner_3_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 2 THEN 1 ELSE 0 END) AS right_wing_3_att
			, SUM(CASE WHEN shots.zone_id = 2 AND shots.made = TRUE THEN 1 ELSE 0 END) AS right_wing_3_made
			, SUM(CASE WHEN shots.zone_id = 2 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS right_wing_3_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 2 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 2 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 2 THEN 1 ELSE 0 END)::float END AS right_wing_3_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 3 THEN 1 ELSE 0 END) AS straight_up_3_att
			, SUM(CASE WHEN shots.zone_id = 3 AND shots.made = TRUE THEN 1 ELSE 0 END) AS straight_up_3_made
			, SUM(CASE WHEN shots.zone_id = 3 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS straight_up_3_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 3 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 3 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 3 THEN 1 ELSE 0 END)::float END AS straight_up_3_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 4 THEN 1 ELSE 0 END) AS left_wing_3_att
			, SUM(CASE WHEN shots.zone_id = 4 AND shots.made = TRUE THEN 1 ELSE 0 END) AS left_wing_3_made
			, SUM(CASE WHEN shots.zone_id = 4 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS left_wing_3_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 4 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 4 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 4 THEN 1 ELSE 0 END)::float END AS left_wing_3_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 5 THEN 1 ELSE 0 END) AS left_corner_3_att
			, SUM(CASE WHEN shots.zone_id = 5 AND shots.made = TRUE THEN 1 ELSE 0 END) AS left_corner_3_made
			, SUM(CASE WHEN shots.zone_id = 5 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS left_corner_3_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 5 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 5 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 5 THEN 1 ELSE 0 END)::float END AS left_corner_3_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 6 THEN 1 ELSE 0 END) AS right_baseline_2_att
			, SUM(CASE WHEN shots.zone_id = 6 AND shots.made = TRUE THEN 1 ELSE 0 END) AS right_baseline_2_made
			, SUM(CASE WHEN shots.zone_id = 6 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS right_baseline_2_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 6 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 6 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 6 THEN 1 ELSE 0 END)::float END AS right_baseline_2_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 7 THEN 1 ELSE 0 END) AS right_wing_2_att
			, SUM(CASE WHEN shots.zone_id = 7 AND shots.made = TRUE THEN 1 ELSE 0 END) AS right_wing_2_made
			, SUM(CASE WHEN shots.zone_id = 7 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS right_wing_2_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 7 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 7 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 7 THEN 1 ELSE 0 END)::float END AS right_wing_2_pct_att
			
			, SUM(CASE WHEN shots.zone_id = 8 THEN 1 ELSE 0 END) AS straight_up_2_att
			, SUM(CASE WHEN shots.zone_id = 8 AND shots.made = TRUE THEN 1 ELSE 0 END) AS straight_up_2_made
			, SUM(CASE WHEN shots.zone_id = 8 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS straight_up_2_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 8 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 8 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 8 THEN 1 ELSE 0 END)::float END AS straight_up_2_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 9 THEN 1 ELSE 0 END) AS left_wing_2_att
			, SUM(CASE WHEN shots.zone_id = 9 AND shots.made = TRUE THEN 1 ELSE 0 END) AS left_wing_2_made
			, SUM(CASE WHEN shots.zone_id = 9 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS left_wing_2_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 9 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 9 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 9 THEN 1 ELSE 0 END)::float END AS left_wing_2_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 10 THEN 1 ELSE 0 END) AS left_baseline_2_att
			, SUM(CASE WHEN shots.zone_id = 10 AND shots.made = TRUE THEN 1 ELSE 0 END) AS left_baseline_2_made
			, SUM(CASE WHEN shots.zone_id = 10 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS left_baseline_2_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 10 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 10 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 10 THEN 1 ELSE 0 END)::float END AS left_baseline_2_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 11 THEN 1 ELSE 0 END) AS right_high_paint_att
			, SUM(CASE WHEN shots.zone_id = 11 AND shots.made = TRUE THEN 1 ELSE 0 END) AS right_high_paint_made
			, SUM(CASE WHEN shots.zone_id = 11 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS right_high_paint_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 11 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 11 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 11 THEN 1 ELSE 0 END)::float END AS right_high_paint_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 12 THEN 1 ELSE 0 END) AS left_high_paint_att
			, SUM(CASE WHEN shots.zone_id = 12 AND shots.made = TRUE THEN 1 ELSE 0 END) AS left_high_paint_made
			, SUM(CASE WHEN shots.zone_id = 12 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS left_high_paint_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 12 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 12 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 12 THEN 1 ELSE 0 END)::float END AS left_high_paint_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 13 THEN 1 ELSE 0 END) AS right_low_paint_att
			, SUM(CASE WHEN shots.zone_id = 13 AND shots.made = TRUE THEN 1 ELSE 0 END) AS right_low_paint_made
			, SUM(CASE WHEN shots.zone_id = 13 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS right_low_paint_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 13 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 13 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 13 THEN 1 ELSE 0 END)::float END AS right_low_paint_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 14 THEN 1 ELSE 0 END) AS left_low_paint_att
			, SUM(CASE WHEN shots.zone_id = 14 AND shots.made = TRUE THEN 1 ELSE 0 END) AS left_low_paint_made
			, SUM(CASE WHEN shots.zone_id = 14 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS left_low_paint_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 14 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 14 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 14 THEN 1 ELSE 0 END)::float END AS left_low_paint_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 15 THEN 1 ELSE 0 END) AS at_rim_att
			, SUM(CASE WHEN shots.zone_id = 15 AND shots.made = TRUE THEN 1 ELSE 0 END) AS at_rim_made
			, SUM(CASE WHEN shots.zone_id = 15 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS at_rim_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 15 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 15 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 15 THEN 1 ELSE 0 END)::float END AS at_rim_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (1,5) THEN 1 ELSE 0 END) AS corner_3_att
			, SUM(CASE WHEN shots.zone_id IN (1,5) AND shots.made = TRUE THEN 1 ELSE 0 END) AS corner_3_made
			, SUM(CASE WHEN shots.zone_id IN (1,5) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS corner_3_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (1,5) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (1,5) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (1,5) THEN 1 ELSE 0 END)::float END AS corner_3_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (2,4) THEN 1 ELSE 0 END) AS wing_3_att
			, SUM(CASE WHEN shots.zone_id IN (2,4) AND shots.made = TRUE THEN 1 ELSE 0 END) AS wing_3_made
			, SUM(CASE WHEN shots.zone_id IN (2,4) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS wing_3_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (2,4) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (2,4) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (2,4) THEN 1 ELSE 0 END)::float END AS wing_3_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (6,10) THEN 1 ELSE 0 END) AS baseline_2_att
			, SUM(CASE WHEN shots.zone_id IN (6,10) AND shots.made = TRUE THEN 1 ELSE 0 END) AS baseline_2_made
			, SUM(CASE WHEN shots.zone_id IN (6,10) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS baseline_2_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (6,10) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (6,10) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (6,10) THEN 1 ELSE 0 END)::float END AS baseline_2_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (7,9) THEN 1 ELSE 0 END) AS wing_2_att
			, SUM(CASE WHEN shots.zone_id IN (7,9) AND shots.made = TRUE THEN 1 ELSE 0 END) AS wing_2_made
			, SUM(CASE WHEN shots.zone_id IN (7,9) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS wing_2_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (7,9) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (7,9) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (7,9) THEN 1 ELSE 0 END)::float END AS wing_2_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (11,12) THEN 1 ELSE 0 END) AS high_paint_att
			, SUM(CASE WHEN shots.zone_id IN (11,12) AND shots.made = TRUE THEN 1 ELSE 0 END) AS high_paint_made
			, SUM(CASE WHEN shots.zone_id IN (11,12) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS high_paint_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (11,12) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (11,12) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (11,12) THEN 1 ELSE 0 END)::float END AS high_paint_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (13,14) THEN 1 ELSE 0 END) AS low_paint_att
			, SUM(CASE WHEN shots.zone_id IN (13,14) AND shots.made = TRUE THEN 1 ELSE 0 END) AS low_paint_made
			, SUM(CASE WHEN shots.zone_id IN (13,14) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS low_paint_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (13,14) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (13,14) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (13,14) THEN 1 ELSE 0 END)::float END AS low_paint_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (1,2,3,4,5) THEN 1 ELSE 0 END) AS threes_att
			, SUM(CASE WHEN shots.zone_id IN (1,2,3,4,5) AND shots.made = TRUE THEN 1 ELSE 0 END) AS threes_made
			, SUM(CASE WHEN shots.zone_id IN (1,2,3,4,5) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS threes_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (1,2,3,4,5) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (1,2,3,4,5) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (1,2,3,4,5) THEN 1 ELSE 0 END)::float END AS threes_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (6,7,8,9,10) THEN 1 ELSE 0 END) AS outside_the_paint_att
			, SUM(CASE WHEN shots.zone_id IN (6,7,8,9,10) AND shots.made = TRUE THEN 1 ELSE 0 END) AS outside_the_paint_made
			, SUM(CASE WHEN shots.zone_id IN (6,7,8,9,10) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS outside_the_paint_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (6,7,8,9,10) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (6,7,8,9,10) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (6,7,8,9,10) THEN 1 ELSE 0 END)::float END AS outside_the_paint_pct_made
			
			, SUM(CASE WHEN shots.zone_id IN (11,12,13,14) THEN 1 ELSE 0 END) AS in_the_paint_att
			, SUM(CASE WHEN shots.zone_id IN (11,12,13,14) AND shots.made = TRUE THEN 1 ELSE 0 END) AS in_the_paint_made
			, SUM(CASE WHEN shots.zone_id IN (11,12,13,14) THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS in_the_paint_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id IN (11,12,13,14) THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id IN (11,12,13,14) AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id IN (11,12,13,14) THEN 1 ELSE 0 END)::float END AS in_the_paint_pct_made
			
			, SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 THEN 1 ELSE 0 END) AS short_att
			, SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 AND shots.made = TRUE THEN 1 ELSE 0 END) AS short_made
			, SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS short_pct_att
			, CASE WHEN SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 THEN 1 ELSE 0 END)::float END AS short_pct_made
			
			, SUM(CASE WHEN shots.distance > 8 AND shots.distance <= 14 THEN 1 ELSE 0 END) AS mid_att
			, SUM(CASE WHEN shots.distance > 8 AND shots.distance <= 14 AND shots.made = TRUE THEN 1 ELSE 0 END) AS mid_made
			, SUM(CASE WHEN shots.distance > 8 AND shots.distance <= 14 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS mid_pct_att
			, CASE WHEN SUM(CASE WHEN shots.distance > 8 AND shots.distance <= 14 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.distance > 8 AND shots.distance <= 14 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.distance > 8 AND shots.distance <= 14 THEN 1 ELSE 0 END)::float END AS mid_pct_made
			
			, SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 THEN 1 ELSE 0 END) AS long_att
			, SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 AND shots.made = TRUE THEN 1 ELSE 0 END) AS long_made
			, SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS long_pct_att
			, CASE WHEN SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.distance > 0 AND shots.distance <= 8 THEN 1 ELSE 0 END)::float END AS long_pct_made
			
			, SUM(CASE WHEN shots.detail_id = 1 THEN 1 ELSE 0 END) AS jump_shots_att
			, SUM(CASE WHEN shots.detail_id = 1 AND shots.made = TRUE THEN 1 ELSE 0 END) AS jump_shots_made
			, SUM(CASE WHEN shots.detail_id = 1 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS jump_shots_pct_att
			, CASE WHEN SUM(CASE WHEN shots.detail_id = 1 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.detail_id = 1 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.detail_id = 1 THEN 1 ELSE 0 END)::float END AS jump_shots_pct_made
			
			, SUM(CASE WHEN shots.detail_id = 2 THEN 1 ELSE 0 END) AS hook_shots_att
			, SUM(CASE WHEN shots.detail_id = 2 AND shots.made = TRUE THEN 1 ELSE 0 END) AS hook_shots_made
			, SUM(CASE WHEN shots.detail_id = 2 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS hook_shots_pct_att
			, CASE WHEN SUM(CASE WHEN shots.detail_id = 2 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.detail_id = 2 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.detail_id = 2 THEN 1 ELSE 0 END)::float END AS hook_shots_pct_made
			
			, SUM(CASE WHEN shots.detail_id = 3 THEN 1 ELSE 0 END) AS tip_shots_att
			, SUM(CASE WHEN shots.detail_id = 3 AND shots.made = TRUE THEN 1 ELSE 0 END) AS tip_shots_made
			, SUM(CASE WHEN shots.detail_id = 3 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS tip_shots_pct_att
			, CASE WHEN SUM(CASE WHEN shots.detail_id = 3 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.detail_id = 3 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.detail_id = 3 THEN 1 ELSE 0 END)::float END AS tip_shots_pct_made
			
			, SUM(CASE WHEN shots.detail_id = 4 THEN 1 ELSE 0 END) AS layup_shots_att
			, SUM(CASE WHEN shots.detail_id = 4 AND shots.made = TRUE THEN 1 ELSE 0 END) AS layup_shots_made
			, SUM(CASE WHEN shots.detail_id = 4 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS layup_shots_pct_att
			, CASE WHEN SUM(CASE WHEN shots.detail_id = 4 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.detail_id = 4 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.detail_id = 4 THEN 1 ELSE 0 END)::float END AS layup_shots_pct_made

			, SUM(CASE WHEN shots.detail_id = 5 THEN 1 ELSE 0 END) AS dunk_shots_att
			, SUM(CASE WHEN shots.detail_id = 5 AND shots.made = TRUE THEN 1 ELSE 0 END) AS dunk_shots_made
			, SUM(CASE WHEN shots.detail_id = 5 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS dunk_shots_pct_att
			, CASE WHEN SUM(CASE WHEN shots.detail_id = 5 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.detail_id = 5 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.detail_id = 5 THEN 1 ELSE 0 END)::float END AS dunk_shots_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 4 THEN 1 ELSE 0 END) AS at_rim_layup_shots_att
			, SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 4 AND shots.made = TRUE THEN 1 ELSE 0 END) AS at_rim_layup_shots_made
			, SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 4 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS at_rim_layup_shots_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 4 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 4 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 4 THEN 1 ELSE 0 END)::float END AS at_rim_layup_shots_pct_made
			
			, SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 5 THEN 1 ELSE 0 END) AS at_rim_dunk_shots_att
			, SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 5 AND shots.made = TRUE THEN 1 ELSE 0 END) AS at_rim_dunk_shots_made
			, SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 5 THEN 1 ELSE 0 END)::float/COUNT(DISTINCT shots.id)::float AS at_rim_dunk_shots_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 5 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 5 AND shots.made = TRUE THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 5 THEN 1 ELSE 0 END)::float END AS at_rim_dunk_shots_pct_made
				
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 15 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 4 THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 15 THEN 1 ELSE 0 END)::float END AS layup_shots_per_at_rim_shots_pct_att
			, CASE WHEN SUM(CASE WHEN shots.zone_id = 15 THEN 1 ELSE 0 END)::float = 0 THEN 0 ELSE SUM(CASE WHEN shots.zone_id = 15 AND shots.detail_id = 5 THEN 1 ELSE 0 END)::float/SUM(CASE WHEN shots.zone_id = 15 THEN 1 ELSE 0 END)::float END AS dunk_shots_per_at_rim_shots_pct_att
			
		FROM shots
		GROUP BY player_id, team_id;"
  end  

  def down
    execute "TRUNCATE player_shot_stats;"
  end
end
