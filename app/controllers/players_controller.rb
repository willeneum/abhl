class PlayersController < ApplicationController
	layout "admin"

	def index
		@players = Player.sorted
	end

	def show
		@player = Player.find(params[:id])
	end

	def new
		@player = Player.new
	end

	def create
		@player = Player.new(player_params)

		if @player.save
			flash[:notice] = "Player created successfully"
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def edit
		@player = Player.find(params[:id])
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
			params.require(:player).permit(:first_name, :last_name, :email)
		end


end
