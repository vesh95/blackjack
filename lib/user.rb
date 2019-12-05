# frozen_string_literal: true

require_relative 'player'

class User < Player
  def make_a_decision(key)
    case key
    when 'a'
      return :pass if cards_count == 3

      :add
    when 'o'
      :open
    else
      :pass
    end
  end

  private

  def shadow_score
    @hand.score
  end

  def shadow_cards
    @hand.show
  end
end
