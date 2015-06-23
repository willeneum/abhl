class ScoringStatsController < ApplicationController

	before_action :confirm_logged_in

	def index
		@game = Game.find(params[:id])
		@stats = ScoringStat.where(:game_id => params[:id])
	end

end
