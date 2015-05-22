class Game < ActiveRecord::Base

	has_many :game_player_stats
	has_many :players, :through => :game_player_stats

#	has_one :home_team, :class_name => "Team"
#	has_one :away_team, :class_name => "Team"


end
