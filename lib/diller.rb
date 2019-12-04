# frozen_string_literal: true

require_relative 'player'
class Diller < Player
  def shadow_cards
    '|* |' * @hand.cards.size
  end

  def shadow_score
    'xx'
  end

  def make_a_decision
    :pass if score <= 17
    :pass if score >= 17
  end
end
