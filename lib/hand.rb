# frozen_string_literal: true

require_relative 'card'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def <<(card)
    if card.value == 'A'
      @cards << card
    else
      @cards.unshift(card)
    end
    @cards
  end

  def show
    @cards.map(&:show)
  end

  def score
    @cards.inject(0) do |sum, card|
      t = if %w[J Q K].include?(card.value)
            10
          elsif card.value == 'A'
            sum + 11 >= 21 ? 1 : 11
          else
            card.value
          end
      sum + t
    end
  end
end
