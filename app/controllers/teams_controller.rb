class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @league = League.find(params[:league_id])
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @league = League.find(params[:league_id])
    @team.league = @league
    if @team.save
      respond_to do |format|
        format.html { redirect_to league_path(@league) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'leagues/show' }
        format.js
      end
    end
  end

  def edit
  end

  def update
    @league = League.find(@team.league.id)
    if @team.update(team_params)
      respond_to do |format|
        format.html { redirect_to league_path(@league) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'leagues/show' }
        format.js
      end
    end
  end

  def destroy
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
