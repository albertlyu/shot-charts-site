require 'json'

scoreboard_paths = Dir.glob(Rails.root.join('lib','data','scoreboards','**','*.json').to_s)

for scoreboard in scoreboard_paths
	puts scoreboard
	contests = JSON.parse(File.read(scoreboard))['contests']
	for contest in contests
		home_team_id = contest['homeTeam']['id']
		home_team_alias = contest['homeTeam']['abrv']
		home_team_name = contest['homeTeam']['name']
		home_team_mascot = contest['homeTeam']['mascot']
		home_team_div = contest['homeTeam']['division']
		home_team_conf = contest['homeTeam']['conference']
		
		away_team_id = contest['visitorTeam']['id']
		away_team_alias = contest['visitorTeam']['abrv']
		away_team_name = contest['visitorTeam']['name']
		away_team_mascot = contest['visitorTeam']['mascot']
		away_team_div = contest['visitorTeam']['division']
		away_team_conf = contest['visitorTeam']['conference']

		game_id = contest['id']
		date = contest['dateYearMonthDay']
		year = contest['seasonYear']
		venue_name = contest['venue']['venueName']
		venue_city = contest['venue']['venueCity']
		venue_state = contest['venue']['venueState']
		
		if !Game.exists?(:game_id => contest['id']) 
			g = Game.new
			g.game_id = game_id
			g.date = date
			g.year = year
			g.home_team_id = home_team_id
			g.away_team_id = away_team_id
			g.venue_name = venue_name
			g.venue_city = venue_city
			g.venue_state = venue_state
			g.save
		end
		if !Team.exists?(:team_id => home_team_id)
			h = Team.new
			h.team_id = home_team_id
			h.team_alias = home_team_alias
			h.team_name = home_team_name
			h.team_mascot = home_team_mascot
			h.team_div = home_team_div
			h.team_conf = home_team_conf
			h.save
		end
		if !Team.exists?(:team_id => away_team_id)
			v = Team.new
			v.team_id = away_team_id
			v.team_alias = away_team_alias
			v.team_name = away_team_name
			v.team_mascot = away_team_mascot
			v.team_div = away_team_div
			v.team_conf = away_team_conf
			v.save
		end
	end
end
