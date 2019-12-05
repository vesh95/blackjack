# frozen_string_literal: true

class Card
  attr_reader :suit, :value

  SUITS = %w[♣ ♦ ♥ ♠].freeze
  RANKS = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'].freeze

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def show
    [@suit, @value]
  end
end
