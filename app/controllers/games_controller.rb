class GamesController < ApplicationController
  layout "admin"

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    @teams = Team.all
  end  

  def create
    @game = Game.new(game_params)

    if @game.home_team == @game.away_team
      @teams = Team.all
      flash[:notice] = "Home team and away team must be different"
      render('new')
    elsif @game.save
      flash[:notice] = "Game saved successfully"
      redirect_to(:action => 'index')
    else
      @teams = Team.all
      render('new')
    end
  end

  def edit
    @game = Game.find(params[:id])
    @teams = Team.all
  end

  def update
    @game = Game.find(params[:id])

    if @game.home_team == @game.away_team
      @teams = Team.all
      flash[:notice] = "Home team and away team must be different"
      render('edit')
    elsif @game.update_attributes(game_params)
      redirect_to(:action => 'show', :id => @game.id)
    else
      render('edit')
    end
  end

  def delete
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end


  # private method calls
  private
    def game_params
      params.require(:game).permit(:home_team, :away_team, :location, :game_time)
    end

end
