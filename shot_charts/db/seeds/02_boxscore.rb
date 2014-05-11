require 'json'

boxscore_paths = Dir.glob(Rails.root.join('lib','data','gameflash','**','*_boxscore.json').to_s)

for boxscore in boxscore_paths
	puts boxscore
	boxscore = JSON.parse(File.read(boxscore))['boxscore']
	game_id = boxscore['contest']['id']
	teams = boxscore['player-stats']['team']
	for team in teams
		players = team['players']['player']

		#tg = Teamgame.new
		#tg.game_id = game_id
		#tg.team_id = team_id
		#tg.field_goals_made = ['field-goals']['made']
		#tg.field_goals_att = ['field-goals']['attempted']
		#tg.field_goals_pct = ['field-goals']['percentage']
		#tg.free_throws_made = ['free-throws']['made']
		#tg.free_throws_att = ['free-throws']['attempted']
		#tg.free_throws_pct = ['free-throws']['percentage']
		#tg.three_point_field_goals_made = ['three-point-field-goals']['made']
		#tg.three_point_field_goals_att = ['three-point-field-goals']['attempted']
		#tg.three_point_field_goals_pct = ['three-point-field-goals']['percentage']
		#tg.points = ['points']['points']
		#tg.rebounds_total = ['rebounds']['total']
		#tg.rebounds_off = ['rebounds']['offensive']
		#tg.rebounds_def = ['rebounds']['defensive']
		#tg.assists = ['assists']['assists']
		#tg.steals = ['steals']['steals']
		#tg.blocked_shots = ['blocked-shots']['blocked-shots']
		#tg.turnovers = ['turnovers']['turnovers']
		#tg.personal_fouls = ['personal-fouls']['personal-fouls']
		#tg.technical_fouls = ['technical-fouls']['technical-fouls']
		#tg.ejections = ['ejections']['']
		#tg.minutes = ['minutes']['minutes']
		#tg.save

		for player in players

			if player['id'] != "" # this excludes non-divia players
				if !Player.exists?(:player_id => player['id'])
					pl = Player.new
					pl.player_id = player['id']
					pl.team_id = team['id']
					pl.player_first_name = player['first-name']
					pl.player_last_name = player['last-name']
					pl.player_position = player['position']
					pl.player_uniform_number = player['uniform-number']
					pl.save
				end
			end

			plg = Playergame.new
			plg.game_id = game_id
			plg.player_id = player['id']
			plg.team_id = team['id']
			plg.player_first_name = player['first-name']
			plg.player_last_name = player['last-name']
			plg.player_position = player['position']
			plg.player_uniform_number = player['uniform-number']
			plg.field_goals_made = player['field-goals']['made']
			plg.field_goals_att = player['field-goals']['attempted']
			plg.field_goals_pct = player['field-goals']['percentage']
			plg.free_throws_made = player['free-throws']['made']
			plg.free_throws_att = player['free-throws']['attempted']
			plg.free_throws_pct = player['free-throws']['percentage']
			plg.three_point_field_goals_made = player['three-point-field-goals']['made']
			plg.three_point_field_goals_att = player['three-point-field-goals']['attempted']
			plg.three_point_field_goals_pct = player['three-point-field-goals']['percentage']
			plg.points = player['points']['points']
			plg.rebounds_total = player['rebounds']['total']
			plg.rebounds_off = player['rebounds']['offensive']
			plg.rebounds_def = player['rebounds']['defensive']
			plg.assists = player['assists']['assists']
			plg.steals = player['steals']['steals']
			plg.blocked_shots = player['blocked-shots']['blocked-shots']
			plg.turnovers = player['turnovers']['turnovers']
			plg.personal_fouls = player['personal-fouls']['personal-fouls']
			plg.disqualifications = player['personal-fouls']['disqualifications']
			plg.technical_fouls = player['technical-fouls']['technical-fouls']
			plg.minutes = ""
			unless player['minutes'].nil?
				plg.minutes = player['minutes']['minutes']
			end
			plg.starter = player['games']['starter']
			plg.save
		end
	end
end
