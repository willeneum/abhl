class Team < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :players
	has_many :home_games
	has_many :away_games

end
