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
    %w[♣ ♥ ♠ ♦].each do |suit|
      set.concat((2..10).map { |value| Card.new(suit, value) })
      set.concat(%w[A J Q K].map { |value| Card.new(suit, value) })
    end
    set
  end
end
