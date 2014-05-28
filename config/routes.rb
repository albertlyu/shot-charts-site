ShotCharts::Application.routes.draw do
  root 'home#index'
  get '/#' => 'home#index'
  get '/search' => 'application#search'

  get '/draft' => 'application#draft'
  get '/tourney' => 'application#tourney'
  get '/teams' => 'application#teams'
  get '/players' => 'application#players'
  get '/about' => 'application#about'

  get '/conf/:team_conf' => 'application#conf'
  get '/teams/:id' => 'application#team'
  get '/players/:id' => 'application#player'
  get '/games/:id' => 'application#game'

  resources :data
end
