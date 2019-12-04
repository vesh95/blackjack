# frozen_string_literal: true

require_relative 'lib/game'

game = Game.new
loop do
  begin
    game.reset_deck
    game.make_bets!
    game.start_round
  end
end
game.game_winner
