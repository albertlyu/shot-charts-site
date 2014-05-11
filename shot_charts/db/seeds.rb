# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' } { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel' city: cities.first)

require 'json'

scoreboard_paths = Dir.glob(Rails.root.join('lib','data','scoreboards','**','*.json').to_s)
playbyplay_paths = Dir.glob(Rails.root.join('lib','data','gameflash','**','*_playbyplay.json').to_s)

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

for playbyplay in playbyplay_paths
	puts playbyplay
	playbyplay = JSON.parse(File.read(playbyplay))['playbyplay']
	game_id = playbyplay['contest']['id']
	plays = playbyplay['plays']['play']
	for play in plays

		if play['player1-id'] != ""
			player_id = play['player1-id']
			player_first_name = play['player-first-name-1']
			player_last_name = play['player-last-name-1']
			player_team_id = play['team-id-1']
			if !Player.exists?(:player_id => player_id)
				pl = Player.new
				pl.player_id = player_id
				pl.player_first_name = player_first_name
				pl.player_last_name = player_last_name
				pl.player_team_id = player_team_id
				pl.save
			end
		end

		p = Play.new
		p.game_id = game_id
		p.half = play['half']
		p.time_minutes = play['time-minutes']
		p.time_seconds = play['time-seconds']
		p.details = play['details']
		p.player_id_1 = play['player1-id']
		p.player_id_2 = play['player2-id']
		p.player_first_name_1 = play['player-first-name-1']
		p.player_first_name_2 = play['player-first-name-2']
		p.player_last_name_1 = play['player-last-name-1']
		p.player_last_name_2 = play['player-last-name-2']
		p.home_score = play['home-score']
		p.visitor_score = play['visitor-score']
		p.visitor_fouls = play['visitor-fouls']
		p.home_fouls = play['home-fouls']
		p.player_score = play['player-score']
		p.points_type = play['points-type']
		p.detail_desc = play['detail-desc']
		p.event_desc = play['event-desc']
		p.distance = play['distance']
		p.x_coord = play['x-coord']
		p.y_coord = play['y-coord']
		p.team_id_1 = play['team-id-1']
		p.team_id_2 = play['team-id-2']
		p.save
	end
end
