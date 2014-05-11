require 'json'

playbyplay_paths = Dir.glob(Rails.root.join('lib','data','gameflash','**','*_playbyplay.json').to_s)

for playbyplay in playbyplay_paths
	puts playbyplay
	playbyplay = JSON.parse(File.read(playbyplay))['playbyplay']
	game_id = playbyplay['contest']['id']
	plays = playbyplay['plays']['play']
	for play in plays
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
