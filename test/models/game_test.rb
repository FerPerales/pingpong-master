require 'test_helper'

class GameTest < ActiveSupport::TestCase

  player = User.new(email: 'player@demo.com')
  opponent = User.new(email: 'opponent@demo.com')

  default_values = {
    date_played: Date.today,
    opponent: opponent,
    player: player,
    opponent_score: 21,
    own_score: 17,
  }

  test "requires opponent score" do
    game = Game.new(default_values)
    game.opponent_score = nil
    assert_equal(game.valid?, false)
    assert_equal(game.errors[:opponent_score], ["can't be blank"])
  end

  test "requires own score" do
    game = Game.new(default_values)
    game.own_score= nil
    assert_equal(game.valid?, false)
    assert_equal(game.errors[:own_score], ["can't be blank"])
  end

  test "requires a winner" do
    game = Game.new(default_values)
    game.own_score= 15
    game.opponent_score = 12
    assert_equal(game.valid?, false)
    assert_equal(game.errors[:base].first, "There must be a winner with at least #{Game::WINNING_SCORE} points")
  end
end
