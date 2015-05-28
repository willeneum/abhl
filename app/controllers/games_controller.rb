class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end  

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(game_params)
      redirect_to(:action => 'show', :id => @game.id)
    else
      render('edit')
    end
  end

  def delete
    @game = Game.find(params[:id])
  end

  def destroy
    game = Game.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end
  

  # private method calls
  private
    def game_params
      params.require(:game).permit(:home_team, :away_team, :location, :game_time)
    end

end
