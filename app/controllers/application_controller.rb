class ApplicationController < ActionController::Base

  before_filter :index

  def index
    @confs = Team.where("team_div = 'divia'").select(:team_conf).distinct.order("team_conf ASC")
    @teams = Team.where("team_name != '' and team_div = 'divia'").order("team_name ASC")
  end

  def draft
    @pg = Player.where(:player_id => [97934, 109674, 116037, 97385, 121072, 97562, 110318, 116604, 97587, 97222]).order("player_last_name ASC")
    @sg = Player.where(:player_id => [116665, 97602, 110167, 109662, 117555, 109666, 120692, 97656, 116744, 88583]).order("player_last_name ASC")
    @sf = Player.where(:player_id => [116666, 110093, 117127, 116757, 109781, 110089, 121033, 116741, 121907, 121084]).order("player_last_name ASC")
    @pf = Player.where(:player_id => [120791, 88704, 110437, 97718, 97677, 97471, 121089, 121075, 116007, 97391]).order("player_last_name ASC")
    @c = Player.where(:player_id => [116502, 97125, 97224, 97179, 121911, 97225, 116743, 109779, 97032, 88468]).order("player_last_name ASC")
  end

  def teams
    @teams = Team.where("team_name != '' AND team_div != ''").order("team_name ASC")
    #@teams = Team.where("team_conf = ?", params['id'])
    #@players = Player.where("player_team_id = ?", params['id']).order("player_team_id ASC")
  end

  def players
    @players = Player.all.order("player_last_name ASC")
  end

  def team
    @team = Team.find_by(team_id: params['id'])
    @games = Game.where("home_team_id = ? OR away_team_id = ?", params['id'], params['id']).order("date ASC")
    @players = Player.where("team_id = ?", params['id']).order("player_id ASC")
    @shots = Play.where("team_id_1 = ? AND x_coord IS NOT NULL", params['id']).to_json.html_safe#.pluck(:x_coord, :y_coord).to_json
  end

  def player
    @player = Player.find_by(player_id: params['id'])
    @playergames = PlayerGame.where("player_id = ?", params['id']).order("game_id ASC")
    @plays = Play.where("player_id_1 = ?", params['id']).order("id ASC")
    @shots = Play.where("player_id_1 = ? AND x_coord IS NOT NULL", params['id']).to_json.html_safe
    @player_basic_stats = PlayerGame.select("AVG(player_games.points) AS ppg, AVG(player_games.rebounds_total) AS rpg, AVG(player_games.assists) AS apg, AVG(player_games.steals) AS spg, AVG(player_games.blocked_shots) AS bpg, (SUM(player_games.field_goals_made)::float/SUM(player_games.field_goals_att)::float) AS fgpct, (SUM(player_games.free_throws_made)::float/SUM(player_games.free_throws_att)::float) AS ftpct, (SUM(player_games.three_point_field_goals_made)::float/SUM(player_games.three_point_field_goals_att)::float) AS threefgpct, (SUM(player_games.field_goals_made)::float+0.5*SUM(player_games.three_point_field_goals_made))/SUM(player_games.field_goals_att)::float AS efgpct, SUM(player_games.points)::float/(SUM(player_games.minutes)::float/40.0) AS pp40, SUM(player_games.rebounds_total)::float/(SUM(player_games.minutes)::float/40.0) AS rp40, SUM(player_games.assists)::float/(SUM(player_games.minutes)::float/40.0) AS ap40, SUM(player_games.steals)::float/(SUM(player_games.minutes)::float/40.0) AS sp40, SUM(player_games.blocked_shots)::float/(SUM(player_games.minutes)::float/40.0) AS bp40").where("player_id = ?", params['id']).group(:player_id)
    @player_shot_stats = Play.select("SUM(CASE WHEN plays.distance = 0 AND plays.event_desc = 'Field Goal Made' THEN 1 ELSE 0 END)::float / SUM(CASE WHEN plays.distance = 0 THEN 1 ELSE 0 END)::float AS AtRimFGpct, SUM(CASE WHEN plays.distance >= 2 AND plays.distance < 9 AND plays.event_desc = 'Field Goal Made' THEN 1 ELSE 0 END)::float / SUM(CASE WHEN plays.distance >= 2 AND plays.distance < 9 THEN 1 ELSE 0 END)::float AS ShortFGpct, SUM(CASE WHEN plays.distance >= 9 AND plays.distance < 15 AND plays.event_desc = 'Field Goal Made' THEN 1 ELSE 0 END)::float / SUM(CASE WHEN plays.distance >= 9 AND plays.distance < 15 THEN 1 ELSE 0 END)::float AS MidFGpct, SUM(CASE WHEN plays.distance >= 15 AND plays.distance < 21 AND plays.event_desc = 'Field Goal Made' THEN 1 ELSE 0 END)::float / SUM(CASE WHEN plays.distance >= 15 AND plays.distance < 21 THEN 1 ELSE 0 END)::float AS LongFGpct, SUM(CASE WHEN plays.points_type = 3 AND plays.event_desc = 'Field Goal Made' THEN 1 ELSE 0 END)::float / SUM(CASE WHEN plays.points_type = 3 THEN 1 ELSE 0 END)::float AS ThreeFGpct, SUM(CASE WHEN plays.x_coord BETWEEN -6 AND 6 AND plays.y_coord <= 15 AND plays.points_type = 2 AND plays.event_desc = 'Field Goal Made' THEN 1 ELSE 0 END)::float / SUM(CASE WHEN plays.x_coord BETWEEN -6 AND 6 AND plays.y_coord <= 15 AND plays.points_type = 2 THEN 1 ELSE 0 END)::float AS InThePaintFGpct, SUM(CASE WHEN plays.x_coord NOT BETWEEN -6 AND 6 AND plays.points_type = 2 AND plays.event_desc = 'Field Goal Made' OR plays.y_coord > 15 AND plays.points_type = 2 AND plays.event_desc = 'Field Goal Made' THEN 1 ELSE 0 END)::float / SUM(CASE WHEN plays.x_coord NOT BETWEEN -6 AND 6 AND plays.points_type = 2 OR plays.y_coord > 15 AND plays.points_type = 2 THEN 1 ELSE 0 END)::float AS OutsideThePaintFGpct").where("player_id_1 = ?", params['id']).group(:player_id_1)
  end

  def game
    @game = Game.find_by(game_id: params['id'])
    @plays = Play.where("game_id = ?", params['id']).order("id ASC")
    @home = Team.find_by(team_id: @game.home_team_id)
    @away = Team.find_by(team_id: @game.away_team_id)
  end
end
