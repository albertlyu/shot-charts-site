ShotCharts::Application.routes.draw do
  root 'home#index'
  get '/#' => 'home#index'
  get '/teams' => 'application#teams'
  get '/teams/:id' => 'application#team'
  get '/players' => 'application#players'
  get '/players/:id' => 'application#player'
  get '/conf/:team_conf' => 'application#conf'
end
