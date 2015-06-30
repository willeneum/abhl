class Game < ActiveRecord::Base

	has_many :scoring_stats, :dependent => :destroy
	has_many :penalty_stats, :dependent => :destroy
	has_many :players, :through => :game_player_stats

	belongs_to :home_team, :class_name => "Team", :foreign_key => :home_team_id
	belongs_to :away_team, :class_name => "Team", :foreign_key => :away_team_id

	validate :unique_opponent



	def unique_opponent
		if home_team_id == away_team_id
			errors.add(:home_team, "Teams cannot play against themselves")
		end
	end

end
