class HomeController < ApplicationController
  def index
  end

  def history
    @games = Game.where(player_id: current_user.id)
  end

  def log
    @game = Game.new
  end
end
