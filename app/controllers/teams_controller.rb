class TeamsController < ApplicationController
  layout "application"

  #before_action :confirm_logged_in
  before_action :confirm_admin, :only => [:new, :edit, :create, :update, :delete]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.friendly.find(params[:id])
    @players = Player.where(:team_id => params[:id])
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:success] = "Team " + @team.name + " created"
      redirect_to(:action => 'index')
    else
      flash[:danger] = "Team not created"
      render('new')
    end
  end

  def edit
    @team = Team.friendly.find(params[:id])
  end

  def update
    @team = Team.friendly.find(params[:id])

    if @team.update_attributes(team_params)
      redirect_to(:action => 'show', :id => @team.id)
    else
      render('edit')
    end
  end

  def delete
    @team = Team.friendly.find(params[:id])
  end

  def destroy
    team = Team.friendly.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end


  # private method calls
  private
    def team_params
      params.require(:team).permit(:name, :manager, :payroll)
    end

end


