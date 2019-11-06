class TeamsController < ApplicationController
  before_action :set_league
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @team = @league.teams.build
  end

  def create
    @team = Team.new(team_params)
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
    @league = League.find(@team.league.id)
    @team.destroy
    redirect_to league_path(@league)
  end

  private

  def set_league
    @league = League.find(params[:league_id])
  end

  def set_team
    @team = @league.teams.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
