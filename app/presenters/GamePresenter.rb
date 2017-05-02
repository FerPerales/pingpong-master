class GamePresenter
  def initialize(game)
    @game = game;
  end

  def date
    @game.date_played.strftime("%b %d")
  end
end


