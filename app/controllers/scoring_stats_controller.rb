class ScoringStatsController < ApplicationController

	#before_action :confirm_logged_in
	before_action :confirm_admin, :only => [:edit, :create, :update, :delete]

	def index
		@game = Game.find(params[:id])
		@stats = ScoringStat.where(:game_id => params[:id])
	end

end
