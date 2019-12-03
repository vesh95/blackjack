# frozen_string_literal: true

require_relative 'hand'

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

  def score
    @hand.score
  end

  def shadow_cards
    show_cards
  end

  def show_cards
    @hand.show
  end

  def take_money(value = 0)
    return unless value <= @bank

    @bank -= value
    value
  end

  def get_money(value = 0)
    @bank += value
  end
end
