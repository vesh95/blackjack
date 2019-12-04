# frozen_string_literal: true

class Game

  private

  def greeting!
    puts('Как вас зовут?')
    nick = gets.chomp.to_s
    @player = User.new(nick)
  end

  def summary(player)
    puts("#{player.name} $#{player.bank}")
    puts("#{player.score} #{player.shadow_cards}") # FIX: shadow_score
    puts('-' * 10)
  end

  def open_summary(player)
    puts("#{player.name} $#{player.bank}")
    puts("#{player.score} #{player.show_cards}")
    puts('-' * 10)
  end

  def table_summary(results = :close)
    puts("Банк #{@bank}".rjust(30, '#'))
    @players.each { |p| results == :open ? open_summary(p) : summary(p) }
  end

  def actions_list(player)
    puts('p - пропустить ход')
    puts('a - добавить карту') if player.cards_count < 3
    puts('o - открыть карты')
  end

end
