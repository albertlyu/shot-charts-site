class ApplicationController < ActionController::Base
  def conf
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@teams = Team.where('team_name != "" AND team_conf = ?', params['team_conf']).order('team_name ASC')
  end

  def teams
    @confs = Team.select(:team_conf).distinct.order('team_conf ASC')
    @teams = Team.where('team_name != "" and team_div = "divia"').order('team_name ASC')
    #@teams = Team.where('team_conf = ?', params['id'])
    @players = Player.where('player_team_id = ?', params['id']).order('player_team_id ASC')
  end

  def players
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@players = Player.all.order('player_last_name ASC')
  end

  def team
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@team = Team.find_by(team_id: params['id'])
    @games = Game.where('home_team_id = ? OR away_team_id = ?', params['id'], params['id']).order('date ASC')
  	@players = Player.where('team_id = ?', params['id']).order('player_id ASC')
  end

  def player
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@player = Player.find_by(player_id: params['id'])
  	@playergames = Playergame.where('player_id = ?', params['id']).order('game_id ASC')
    @plays = Play.where('player_id_1 = ?', params['id']).order('id ASC')
  end
end
