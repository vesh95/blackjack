# frozen_string_literal: true

require_relative 'player'
class Diller < Player
  def make_a_decision(_key)
    if score <= 17 && cards_count <= 3
      :add
    else
      :pass
    end
  end

  private

  def shadow_score
    'xx'
  end

  def shadow_cards
    '|*  |' * @hand.cards.size
  end
end
