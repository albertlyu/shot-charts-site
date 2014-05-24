class LoadPlayerBasicStats < ActiveRecord::Migration
  def up
  	execute "UPDATE players SET team_id = 596 WHERE player_id = 98345;"
  	execute "UPDATE player_games SET team_id = 596 WHERE player_id = 98345;"
  	execute "UPDATE plays SET team_id_1 = 596 WHERE player_id_1 = 98345;"

  	execute "INSERT INTO player_basic_stats
		SELECT player_games.player_id
			, player_games.team_id
			, COUNT(DISTINCT player_games.game_id) AS games_played
			, SUM(player_games.field_goals_att) AS sum_field_goals_att
			, COALESCE(AVG(player_games.points),0) AS points_per_game
			, COALESCE(AVG(player_games.rebounds_total),0) AS rebounds_per_game
			, COALESCE(AVG(player_games.assists),0) AS assists_per_game
			, COALESCE(AVG(player_games.steals),0) AS steals_per_game
			, COALESCE(AVG(player_games.blocked_shots),0) AS blocks_per_game
			, COALESCE(AVG(player_games.turnovers),0) AS turnovers_per_game
			, COALESCE(AVG(player_games.minutes),0) AS minutes_per_game
			, CASE WHEN SUM(player_games.field_goals_att)::float = 0 THEN 0 ELSE SUM(player_games.field_goals_made)::float/SUM(player_games.field_goals_att)::float END AS field_goals_pct
			, CASE WHEN SUM(player_games.free_throws_att)::float = 0 THEN 0 ELSE SUM(player_games.free_throws_made)::float/SUM(player_games.free_throws_att)::float END AS free_throws_pct
			, CASE WHEN SUM(player_games.three_point_field_goals_att)::float = 0 THEN 0 ELSE SUM(player_games.three_point_field_goals_made)::float/SUM(player_games.three_point_field_goals_att)::float END AS three_point_field_goals_pct
			, CASE WHEN SUM(player_games.field_goals_att)::float = 0 THEN 0 ELSE (SUM(player_games.field_goals_made)::float+0.5*SUM(player_games.three_point_field_goals_made))/(SUM(player_games.field_goals_att)::float) END AS effective_field_goals_pct
		FROM player_games
		WHERE player_id IS NOT NULL
		GROUP BY player_id, team_id;"
  end

  def down
    execute "TRUNCATE player_basic_stats;"
  end
end
