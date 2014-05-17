class Game < ActiveRecord::Base
  has_many :plays
  has_many :players, :through => :player_games
end
