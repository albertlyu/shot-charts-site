class ApplicationController < ActionController::Base

  before_filter :index

  def index
    @confs = Team.where("team_div = 'divia'").select(:team_conf).distinct.order("team_conf ASC")
    @teams = Team.where("team_name != '' and team_div = 'divia'").order("team_name ASC")
  end

  def search
    if params['q']
      @players = Player.joins('LEFT JOIN teams ON teams.team_id = players.team_id').where("CONCAT(player_first_name, ' ', player_last_name, ' ', team_name, ' ', team_mascot) LIKE INITCAP('%#{params['q']}%')")
      @teams = Team.where("CONCAT(team_name, ' ', team_mascot) LIKE INITCAP('%#{params['q']}%')")
    end
  end

  def draft
    @pg_basic_stats = PlayerBasicStat.where(:player_id => [97934, 109674, 116037, 97385, 121072, 97562, 110318, 116604, 97587, 97222]).group(:player_id).order(:player_id)
    @sg_basic_stats = PlayerBasicStat.where(:player_id => [116665, 97602, 110167, 109662, 117555, 109666, 120692, 97656, 116744, 88583]).group(:player_id).order(:player_id)
    @sf_basic_stats = PlayerBasicStat.where(:player_id => [116666, 110093, 117127, 116757, 109781, 110089, 121033, 116741, 121907, 121084]).group(:player_id).order(:player_id)
    @pf_basic_stats = PlayerBasicStat.where(:player_id => [120791, 88704, 110437, 97718, 97677, 97471, 121089, 121075, 116007, 97391]).group(:player_id).order(:player_id)
    @c_basic_stats = PlayerBasicStat.where(:player_id => [116502, 97125, 97224, 97179, 121911, 97225, 116743, 109779, 97032, 88468]).group(:player_id).order(:player_id)
    @pg_shot_stats = PlayerShotStat.where(:player_id => [97934, 109674, 116037, 97385, 121072, 97562, 110318, 116604, 97587, 97222]).group(:player_id).order(:player_id)
    @sg_shot_stats = PlayerShotStat.where(:player_id => [116665, 97602, 110167, 109662, 117555, 109666, 120692, 97656, 116744, 88583]).group(:player_id).order(:player_id)
    @sf_shot_stats = PlayerShotStat.where(:player_id => [116666, 110093, 117127, 116757, 109781, 110089, 121033, 116741, 121907, 121084]).group(:player_id).order(:player_id)
    @pf_shot_stats = PlayerShotStat.where(:player_id => [120791, 88704, 110437, 97718, 97677, 97471, 121089, 121075, 116007, 97391]).group(:player_id).order(:player_id)
    @c_shot_stats = PlayerShotStat.where(:player_id => [116502, 97125, 97224, 97179, 121911, 97225, 116743, 109779, 97032, 88468]).group(:player_id).order(:player_id)
  end

  def tourney
    @games = Game.where(:game_id => [93820, 93821, 93822, 93823, 93795, 93814, 93792, 93801, 93796, 93813, 93872, 93802, 93805, 93819, 93875, 93809, 93806, 93818, 93816, 93810, 93817, 93811, 93797, 93807, 93887, 93812, 93798, 93808, 93800, 93880, 93803, 93793, 93799, 93815, 93804, 93794, 93908, 93913, 93911, 93912, 93906, 93907, 93909, 93910, 93934, 93938, 93937, 93932, 93939, 93933, 93936, 93935, 93955, 93964, 93963, 93967, 93961, 93960, 93957, 93965, 94000, 94001, 94014, 94013, 94032, 94034, 94092]).order(:date)
  end

  def teams
    @teams = Team.where("team_name != '' AND team_div != ''").order("team_name ASC")
  end

  def players
    @players = Player.all.order("player_last_name ASC")
  end

  def team
    @team = Team.find_by(team_id: params['id'])
    @games = Game.where("home_team_id = ? OR away_team_id = ?", params['id'], params['id']).order("date ASC")
    @players = Player.where("team_id = ?", params['id']).order("player_last_name ASC")
    @shots = Shot.where("team_id = ?", params['id']).order("id ASC")
    @team_shot_stats = TeamShotStat.where("team_id = ?", params['id'])
  end

  def player
    @player = Player.find_by(player_id: params['id'])
    @shots = Shot.where("player_id = ?", params['id']).order("id ASC")
    @player_basic_stats = PlayerBasicStat.where("player_id = ?", params['id']).group(:player_id)
    @player_shot_stats = PlayerShotStat.where("player_id = ?", params['id']).group(:player_id)
  end

  def game
    @game = Game.find_by(game_id: params['id'])
    @home = Team.find_by(team_id: @game.home_team_id)
    @away = Team.find_by(team_id: @game.away_team_id)
    @plays = Play.where("game_id = ?", params['id']).order("id ASC")
    @shots = Shot.where("game_id = ?", params['id']).order("id ASC")
  end
end
