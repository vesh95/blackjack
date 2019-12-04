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
    if score <= 17 && cards_count <= 3
      :add
    else
      :pass
    end
  end
end
