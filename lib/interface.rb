# frozen_string_literal: true

module Interface
  def next_round?
    print('Играть еще один раунд? (y/n) ')
    true if gets.chomp.to_s.downcase == 'y'
  end

  def select_decision(player)
    if player.class == User
      actions_list(player)
      decision = gets.chomp.to_s
    end
    decision
  end

  def greeting!
    print('Как вас зовут? ')
    gets.chomp.to_s
  end

  def summary(player, mode = :close)
    puts("#{player_resume(player)} #{player_cards(player, mode)}")
  end

  def table_summary(results = :close)
    show_bank
    @players.each { |p| results == :open ? summary(p, :open) : summary(p) }
  end

  def actions_list(player)
    puts('p - пропустить ход')
    puts('a - добавить карту') if player.cards_count < 3
    puts('o - открыть карты')
  end

  def show_winner(player)
    puts('Ничья') if player.nil?
    puts("Победил #{player.name}")
  end

  def show_game_winner(player)
    puts('Ничья.') if player.nil?
    puts("Игра окончена. Победил #{player.name} $#{player.bank}")
  end

  def player_resume(player)
    "#{player.name.ljust(10)} $#{player.bank.to_s.ljust(5)}"
  end

  def player_cards(player, mode = :close)
    "#{player.show_score(mode)} #{player.show_cards(mode)}"
  end

  def resume
    show_bank
    @players.each { |player| puts("#{player.name} $#{player.bank}") }
  end

  def show_bank
    puts("Банк #{@bank}")
  end
end
