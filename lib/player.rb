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

  def score
    @hand.score
  end

  def shadow_cards
    show_cards
  end

  def show_cards
    @hand.show
  end

  def shadow_score
    score
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
end
