class TeamsController < ApplicationController
  layout "admin"

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(team_params)
      redirect_to(:action => 'show', :id => @team.id)
    else
      render('edit')
    end
  end

  def delete
    @team = Team.find(params[:id])
  end

  def destroy
    team = Team.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end


  # private method calls
  private
    def team_params
      params.require(:team).permit(:name, :manager, :payroll)
    end

end


