class ScoringStatsController < ApplicationController

	def index
		@game = Game.find(params[:id])
		@stats = ScoringStat.where(:game_id => params[:id])
	end

end
