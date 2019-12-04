# frozen_string_literal: true

require_relative 'lib/game'

game = Game.new
loop do
  begin
    game.reset_deck
    game.make_bets!
    game.start_round
    break unless game.next_round?
  rescue NoMoneyError
    break
  end
end
game.game_winner
