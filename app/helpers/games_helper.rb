module GamesHelper
	def team_find(team_id, options={})
		Team.find(team_id).name
	end
end
