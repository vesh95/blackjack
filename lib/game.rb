# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'diller'
require_relative 'player'
require_relative 'user'
require_relative 'interface'

class Game
  include Interface

  def initialize
    @players = []
    @bank = 0
    reset_deck
    game_setup!
  end

  def start_round
    loop do
      table_summary :close
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

  def game_winner
    winner = if @player.bank == @diller.bank
               nil
             elsif @player.bank > @diller.bank
               @player
             else
               @diller
             end
    show_game_winner(winner)
  end

  private

  def player_step(player)
    case player.make_a_decision(select_decision(player))
    when :pass
      nil
    when :add
      player.get_card(@deck.pop!)
      nil
    when :open
      @open = true
    end
  end

  def choose_winner
    if (@player.score > 21 && @diller.score > 21) || @player.score == @diller.score
      standoff
    elsif @player.score > 21
      winner(@diller)
    elsif @diller.score > 21 || @player.score > @diller.score
      winner(@player)
    else
      winner(@diller)
    end
  end

  def winner(player)
    show_winner(player)
    player.take_money(20)
    @bank = 0
  end

  def standoff
    @player.take_money(10)
    @diller.take_money(10)
    @bank = 0
  end

  def three_cards?
    @players.select { |p| p.cards_count == 3 }.size == 2
    # example [Diller, Player].size == 2
  end

  def game_setup!
    nick = greeting!
    @player = User.new(nick)
    @diller = Diller.new('Диллер')
    @players = [@player, @diller]
  end
end
