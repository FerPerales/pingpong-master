require 'game_presenter'

class HomeController < ApplicationController
  def index
  end

  def history
    games = Game.where(player_id: current_user.id).order(date_played: :desc)
    @games = games.map {|game| ::GamePresenter.new(game)}
  end

  def log
    @game = Game.new
  end
end
