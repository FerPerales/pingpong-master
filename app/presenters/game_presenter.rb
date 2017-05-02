class GamePresenter
  def initialize(game)
    @game = game;
  end

  def date
    @game.date_played.strftime("%b %d")
  end

  def opponent_display_name
    @game.opponent ? @game.opponent.email : ''
  end

  def score
    "#{@game.own_score} - #{@game.opponent_score}"
  end

  def result
    @game.own_score > @game.opponent_score ? 'W' : 'L'
  end

end


