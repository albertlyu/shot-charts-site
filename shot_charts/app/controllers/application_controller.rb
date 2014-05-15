class ApplicationController < ActionController::Base

  before_filter :index

  def index
    @confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  end

  def draft
    @pg = Player.where(:player_id => [97934, 109674, 116037, 97385, 121072, 97562, 110318, 116604, 97587, 97222]).order('player_last_name ASC')
    @sg = Player.where(:player_id => [116665, 97602, 110167, 109662, 117555, 109666, 120692, 97656, 116744, 88583]).order('player_last_name ASC')
    @sf = Player.where(:player_id => [116666, 110093, 117127, 116757, 109781, 110089, 121033, 116741, 121907, 121084]).order('player_last_name ASC')
    @pf = Player.where(:player_id => [120791, 88704, 110437, 97718, 97677, 97471, 121089, 121075, 116007, 97391]).order('player_last_name ASC')
    @c = Player.where(:player_id => [116502, 97125, 97224, 97179, 121911, 97225, 116743, 109779, 97032, 88468]).order('player_last_name ASC')
  end

  def teams
    @teams = Team.where('team_name != "" AND team_div != ""').order('team_name ASC')
    #@teams = Team.where('team_conf = ?', params['id'])
    @players = Player.where('player_team_id = ?', params['id']).order('player_team_id ASC')
  end

  def players
    @players = Player.all.order('player_last_name ASC')
  end

  def conf
    @teams = Team.where('team_name != "" AND team_conf = ?', params['team_conf']).order('team_name ASC')
  end

  def team
    @team = Team.find_by(team_id: params['id'])
    @games = Game.where('home_team_id = ? OR away_team_id = ?', params['id'], params['id']).order('date ASC')
    @players = Player.where('team_id = ?', params['id']).order('player_id ASC')
  end

  def player
    @player = Player.find_by(player_id: params['id'])
    @playergames = PlayerGame.where('player_id = ?', params['id']).order('game_id ASC')
    @plays = Play.where('player_id_1 = ?', params['id']).order('id ASC')
    @shots = Play.where('player_id_1 = ? and x_coord != ""', params['id']).to_json.html_safe#.pluck(:x_coord, :y_coord).to_json
  end

  def game
    @game = Game.find_by(game_id: params['id'])
    @plays = Play.where('game_id = ?', params['id']).order('id ASC')
    @home = Team.find_by(team_id: @game.home_team_id)
    @away = Team.find_by(team_id: @game.away_team_id)
  end
end
