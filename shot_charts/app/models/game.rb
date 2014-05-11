class Game < ActiveRecord::Base
	has_and_belongs_to_many :teams
	has_and_belongs_to_many :playergames
end
