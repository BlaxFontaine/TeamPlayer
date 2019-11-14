class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @player = @team.players.build
  end

  def create
    @player = Player.new(player_params)
    @player.team = @team
    if @player.save
      respond_to do |format|
        format.html { redirect_to team_path(@team) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'teams/show' }
        format.js
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
