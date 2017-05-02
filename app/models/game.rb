class Game < ActiveRecord::Base
  belongs_to :player, class_name: "User", foreign_key:  "player_id"
  belongs_to :opponent, class_name: "User", foreign_key: "opponent_id"

  WINNING_SCORE = 21.freeze
  MINIMUN_SCORE_DIFFERENCE = 2.freeze

  validates :date_played,
    :opponent,
    :player,
    :opponent_score,
    :own_score,
    presence: true

  validate :presence_of_winner
  validate :more_than_two_points_of_difference
  validate :cannot_play_with_myself


  private

  def scores_present?
    !!(own_score && opponent_score)
  end

  def presence_of_winner
    if scores_present? &&
        (own_score < WINNING_SCORE || opponent_score < WINNING_SCORE)
      errors.add(:base, "There must be a winner with at least #{WINNING_SCORE} points")
    end
  end

  def more_than_two_points_of_difference
    if scores_present? &&
        (own_score - opponent_score < MINIMUN_SCORE_DIFFERENCE ||
        opponent_score - own_score < MINIMUN_SCORE_DIFFERENCE)
      errors.add(:base, "There must be a difference of at least #{MINIMUN_SCORE_DIFFERENCE} points")
    end
  end

  def cannot_play_with_myself
    if opponent && opponent.id === player.id
      errors.add(:base, "You cannot play against yourself")
    end
  end
end
