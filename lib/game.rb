# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'diller'
require_relative 'player'
require_relative 'user'
require_relative 'game/dialogs'

class Game
  def initialize
    @players = []
    @bank = 0
    reset_deck
    game_setup!
  end

  def start_round
    loop do
      table_summary
      break if player_step(@player)

      break if player_step(@diller)

      break if three_cards? || @open
    end
    table_summary :open
    choose_winner
    resume
  end

  def make_bets!
    @open = false
    @players.each do |player|
      2.times { player.get_card(@deck.pop!) }
      @bank += player.give_money(10)
    end
  end

  def reset_deck
    @players.each(&:reset_hand)
    @deck = Deck.new
    @deck.shuffle!
  end
end
