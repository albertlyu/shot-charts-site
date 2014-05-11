class Player < ActiveRecord::Base
	belongs_to :team
	has_many :plays
end
