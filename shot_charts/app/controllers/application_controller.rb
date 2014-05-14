class ApplicationController < ActionController::Base

  before_filter :index

  def index
    @confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  end

  def conf
   	@teams = Team.where('team_name != "" AND team_conf = ?', params['team_conf']).order('team_name ASC')
  end

  def teams
    @teams = Team.where('team_name != "" AND team_div != ""').order('team_name ASC')
    #@teams = Team.where('team_conf = ?', params['id'])
    @players = Player.where('player_team_id = ?', params['id']).order('player_team_id ASC')
  end

  def players
  	@players = Player.all.order('player_last_name ASC')
  end

  def team
  	@team = Team.find_by(team_id: params['id'])
    @games = Game.where('home_team_id = ? OR away_team_id = ?', params['id'], params['id']).order('date ASC')
  	@players = Player.where('team_id = ?', params['id']).order('player_id ASC')
  end

  def player
  	@player = Player.find_by(player_id: params['id'])
  	@playergames = Playergame.where('player_id = ?', params['id']).order('game_id ASC')
    @plays = Play.where('player_id_1 = ?', params['id']).order('id ASC')
    @shots = Play.where('player_id_1 = ? and x_coord != ""', params['id']).to_json.html_safe#.pluck(:x_coord, :y_coord).to_json
  end
end
