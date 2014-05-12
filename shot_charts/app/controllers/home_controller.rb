class HomeController < ApplicationController
  def index
    @confs = Team.select(:team_conf).distinct.order('team_conf ASC')
  end
end
