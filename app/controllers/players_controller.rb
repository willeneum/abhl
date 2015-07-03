class PlayersController < ApplicationController
	layout "application"

	#before_action :confirm_logged_in
	before_action :confirm_admin, :only => [:new, :edit, :create, :update, :delete]

	def index
		@players = Player.friendly.sorted
		if session[:player_id]
			@admin_level = Player.friendly.find(session[:player_id]).admin
		else
			@admin_level = false
		end

	end

	def show
		@player = Player.friendly.find(params[:id])
	end

	def new
		@player = Player.new
		@teams = Team.all
	end

	def create
		@player = Player.new(player_params)

		if @player.save
			flash[:success] = "Player created successfully"
			redirect_to(:action => 'index')
		else
			@teams = Team.all
			flash[:danger] = "Player not created"
			render('new')
		end
	end

	def edit
		@player = Player.friendly.find(params[:id])
		@teams = Team.all
	end

	def update
		@player = Player.friendly.find(params[:id])

		if @player.update_attributes(player_params)
			flash[:success] = "Player updated successfully"
			redirect_to(:action => 'show', :id => @player.id)
		else
			flash[:danger] = "Player not updated"
			render('edit')
		end
	end

	def delete
		@player = Player.find(params[:id])
	end

	def destroy
		player = Player.find(params[:id]).destroy
		flash[:success] = "Player '#{player.first_name} #{player.last_name}' deleted successfully"
		redirect_to(:action => 'index')
	end


	# private method calls
	private
		def player_params
			# whitelisting attributes to be mass-assigned
			params.require(:player).permit(:first_name, :last_name, :email, :team_id, :admin)
		end


end
