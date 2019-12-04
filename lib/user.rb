# frozen_string_literal: true

require_relative 'player'

class User < Player
  def make_a_decision
    case gets.chomp.to_s
    when 'a'
      raise 'У вас уже три карты' if cards_count == 3

      :add
    when 'o'
      :open
    else
      :pass
    end
  rescue RuntimeError => e
    puts(e)
    retry
  end
end
