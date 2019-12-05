# frozen_string_literal: true

require_relative 'hand'
class NoMoneyError < RuntimeError; end
class Player
  attr_reader :name, :bank

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank = 100
  end

  def get_card(card)
    @hand << card
  end

  def reset_hand
    @hand = Hand.new
  end

  def show_score(mode = :close)
    case mode
    when :close
      shadow_score
    when :open
      score
    end
  end

  def show_cards(mode = :close)
    case mode
    when :close
      shadow_cards
    when :open
      @hand.show
    end
  end

  def give_money(value = 0)
    raise NoMoneyError unless value <= @bank

    @bank -= value
    value
  end

  def take_money(value = 0)
    @bank += value
  end

  def cards_count
    @hand.cards.count
  end

  def score
    @hand.score
  end
end
