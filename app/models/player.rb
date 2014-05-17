class Player < ActiveRecord::Base
  belongs_to :team
  has_many :plays
  has_many :player_games
  has_many :games, :through => :player_games
end
