class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  def index
    games = Game.where(player_id: current_user.id).order(date_played: :desc)
    @games = games.map {|game| ::GamePresenter.new(game)}
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    @game.player = current_user

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def new
    @game = Game.new
    @users_list = User.where.not(id: current_user.id).collect { |p| [ p.email, p.id ] }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:date_played, :opponent_score, :own_score, :opponent_id)
    end
end
