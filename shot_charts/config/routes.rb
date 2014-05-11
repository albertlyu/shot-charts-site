ShotCharts::Application.routes.draw do
  get '/index' => 'application#index'
  get '/teams/:id' => 'application#team'
  get '/players' => 'application#players'
  get '/players/:id' => 'application#player'
  get '/conf/:team_conf' => 'application#conf'
end
