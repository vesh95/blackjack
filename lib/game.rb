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
end
