class PlayersController < ApplicationController
	layout "admin"
	before_action :confirm_logged_in

	def index
		@players = Player.sorted
	end

	def show
		@player = Player.find(params[:id])
	end

	def new
		@player = Player.new
		@teams = Team.all
	end

	def create
		@player = Player.new(player_params)

		if @player.save
			flash[:notice] = "Player created successfully"
			redirect_to(:action => 'index')
		else
			@teams = Team.all
			render('new')
		end
	end

	def edit
		@player = Player.find(params[:id])
		@teams = Team.all
	end

	def update
		@player = Player.find(params[:id])

		if @player.update_attributes(player_params)
			flash[:notice] = "Player updated successfully"
			redirect_to(:action => 'show', :id => @player.id)
		else
			render('edit')
		end
	end

	def delete
		@player = Player.find(params[:id])
	end

	def destroy
		player = Player.find(params[:id]).destroy
		flash[:notice] = "Player '#{player.first_name} #{player.last_name}' deleted successfully"
		redirect_to(:action => 'index')
	end


	# private method calls
	private
		def player_params
			# whitelisting attributes to be mass-assigned
			params.require(:player).permit(:first_name, :last_name, :email, :team_id)
		end


end
