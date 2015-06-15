class Team < ActiveRecord::Base
	
	has_many :players
	has_many :home_games
	has_many :away_games

end
