ShotCharts::Application.routes.draw do
  root 'home#index'
  get '/#' => 'home#index'

  get '/draft' => 'application#draft'
  get '/teams' => 'application#teams'
  get '/players' => 'application#players'

  get '/conf/:team_conf' => 'application#conf'
  get '/teams/:id' => 'application#team'
  get '/players/:id' => 'application#player'
  get '/games/:id' => 'application#game'

  resources :data
end
