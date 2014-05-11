class ApplicationController < ActionController::Base
  def index
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@teams = Team.where('team_name != ""').order('team_name ASC')
  end

  def conf
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@teams = Team.where('team_name != "" AND team_conf = ?', params['team_conf']).order('team_name ASC')
  end

  def players
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@players = Player.all.order('player_last_name ASC')
  end

  def team
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@team = Team.find_by(team_id: params['id'])
  	@players = Player.where('player_team_id = ?', params['id']).order('player_team_id ASC')
  	render 'team'
  end

  def player
  	@confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  	@player = Player.find_by(player_id: params['id'])
  	@plays = Play.where('player_id_1 = ?', params['id']).order('id ASC')
  	render 'player'
  end
end
