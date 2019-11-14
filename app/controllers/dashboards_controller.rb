class DashboardsController < ApplicationController

  def show
    @teams = Team.where(league_id: current_league.id)
  end

end
