# frozen_string_literal: true

require_relative 'card'

class Deck
  def initialize
    @set = set_generate
  end

  def shuffle!
    @set.shuffle!
    nil
  end

  def pop!
    @set.pop
  end

  private

  def set_generate
    set = []
    Card::SUITS.each do |suit|
      set.concat(Card::RANKS.map { |value| Card.new(suit, value) })
    end
    set
  end
end
