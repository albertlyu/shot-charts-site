class Play < ActiveRecord::Base
	belongs_to :player
	#def self.get_shots() # create a filter for only shots here
	#	where('x_coord != ""')
	#end
end
