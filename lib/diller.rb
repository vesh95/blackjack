# frozen_string_literal: true

require_relative 'player'
class Diller < Player
  def shadow_cards
    @hand.cards.size.times { puts('|* |') }
  end
end
