# frozen_string_literal: true

class Game

  private

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

end
