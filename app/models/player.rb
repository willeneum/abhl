class Player < ActiveRecord::Base

	has_secure_password

	belongs_to :team

	has_many :game_player_stats
	has_many :games, :through => :game_player_stats


	validates :first_name, :presence => true,
												 :length => {:maximum => 25}
	validates :last_name, :presence => true,
												:length => {:maximum => 50}

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates :email, :format => {:with => EMAIL_REGEX},
										:presence => true,
										:length => {:maximum => 50},
										:uniqueness => true


	scope :sorted, lambda { order("players.first_name ASC") }
	scope :search, lambda {|query| where (["first_name LIKE ?", "%#{query}%"] or ["last_name LIKE ?", "%#{query}%"])}

end
