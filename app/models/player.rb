class Player < ActiveRecord::Base

	belongs_to :team

	has_many :game_player_stats
	has_many :games, :through => :game_player_stats


	scope :sorted, lambda { order("players.first_name ASC") }
	scope :search, lambda {|query| where (["first_name LIKE ?", "%#{query}%"] or ["last_name LIKE ?", "%#{query}%"])}

end
