class PlayersController < ApplicationController
	layout false

	def index
		@players = Player.sorted
	end

	def new
		
	end
end
