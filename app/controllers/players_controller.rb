class PlayersController < ApplicationController
  before_action :set_league
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @player = @league.players.build
  end

  def create
    @player = Player.new(player_params)
    @player.league = @league
    if @player.save
      respond_to do |format|
        format.html { redirect_to root_path }
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
    @league = League.find(@player.league.id)
    if @player.update(player_params)
      respond_to do |format|
        format.html { redirect_to root_path }
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
    @player.destroy
    redirect_to root_path
  end

  private

  def set_league
    @league = League.find(current_league.id)
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:derby_name, :number, :role)
  end
end
