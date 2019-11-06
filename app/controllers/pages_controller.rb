class PagesController < ApplicationController
  skip_before_action :authenticate_league!, only: :home

  def home
  end
end
