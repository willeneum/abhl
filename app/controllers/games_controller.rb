class GamesController < ApplicationController
  layout "application"

  #before_action :confirm_logged_in
  before_action :confirm_admin, :only => [:edit, :create, :update, :delete]
  #after_destroy :delete_game_scoring_stats, :delete_game_penalty_stats



  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @scoring_stats = ScoringStat.where(:game_id => params[:id])
    @penalty_stats = PenaltyStat.where(:game_id => params[:id])
  end

  def new
    @game = Game.new
    @teams = Team.all
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:success] = "Game saved successfully"
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
    @game = Game.find(params[:id]).destroy
    flash[:success] = "Game deleted successfully"
    redirect_to(:action => 'index')
  end


  # private method calls
  private
    def game_params
      params.require(:game).permit(:home_team_id, :away_team_id, :location, :game_time)
    end

    def delete_game_scoring_stats
      self.scoring_stats.each do |score|
        #score.destroy
      end
    end

    def delete_game_penalty_stats
      self.penalty_stats.each do |penalty|
        #penalty.destroy
      end
    end

end
